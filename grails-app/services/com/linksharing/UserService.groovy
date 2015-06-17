package com.linksharing

import com.linksharing.co.UserDetailCO
import com.linksharing.co.UserPasswordCO
import com.linksharing.co.UserProfileCO
import com.linksharing.dto.UserDetailDTO
import grails.transaction.Transactional
import grails.validation.ValidationException
import org.hibernate.FetchMode
import org.hibernate.criterion.CriteriaSpecification
import org.hibernate.sql.JoinType

@Transactional
class UserService {

    def fileService
    def subscriptionService
    def mailingService
    def topicService


    Map register(UserDetailCO userDetailCOInstance,String fileLocation) {
        println "<====================================Register=========================================================>"
        UserDetail userDetail = new UserDetail()
        userDetailCOInstance >> userDetail
            if (userDetailCOInstance.hasErrors()) {
                throw new ValidationException("User Detail is not valid", userDetailCOInstance.errors)
            }else if (userDetail.save()) {
                (fileService.upload(userDetailCOInstance.photo,fileLocation))
                return [id:userDetail.id,photo:userDetail.photo,username:userDetail.username]
            } else {
                throw new ValidationException("User Detail is not valid", userDetail.errors)
            }

        return null
    }

    Map updateProfile(UserProfileCO profileCO,String fileLocation) {
        println "<====================================Update Profile=========================================================>"
        UserDetail userDetail = UserDetail.load(profileCO.userId )
        profileCO >> userDetail
        if (profileCO.hasErrors()) {
            throw new ValidationException("User Detail is not valid", profileCO.errors)
        }else if (userDetail.save()) {
            if(profileCO.photo.originalFilename) {
                fileService.upload(profileCO.photo, fileLocation)
            }
            return [photo:userDetail.photo,username:userDetail.username]
        } else {
            throw new ValidationException("User Detail is not valid", userDetail.errors)
        }

        return null
    }
    Boolean updatePassword(UserPasswordCO passwordCO) {
        println "<====================================Update Password=========================================================>"
        UserDetail userDetail = UserDetail.load(passwordCO.userId)
        passwordCO >> userDetail
        if (passwordCO.hasErrors()) {
            throw new ValidationException("User Detail is not valid", passwordCO.errors)
        }else if (userDetail.save()) {
            return true
        } else {
            throw new ValidationException("User Detail is not valid", userDetail.errors)
        }

        return false
    }

    @Transactional(readOnly = true)
    Map login(String loginid,String password){
        println "<====================================Login=========================================================>"
        //UserDetail.findByPasswordAndUsername(password, loginid) ?: UserDetail.findByPasswordAndEmail(password, loginid)

        Map data = UserDetail.createCriteria().get {

                            resultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP)
                            projections{
                                property("id","id")
                                property("username","username")
                                property("photo","photo")
                            }
                            or{
                                eq("email",loginid)
                                eq("username",loginid)
                            }
                            eq("password",password)
                            eq("active",true)
                        }
        return data
    }
    @Transactional(readOnly = true)
    UserDetail isValidEmail(String email){
        println "<====================================IsValidEmail=========================================================>"
        UserDetail userDetail = UserDetail.findByEmail(email)
    }

    @Transactional(readOnly = true)
    Map<String,Object> dashboard(Map user,Map criteria){
        println "<====================================Dashboard=========================================================>"
        List<Subscription> subscriptionList = subscriptionService.listSubscription(user,[max:5])
        Map<String,Object> inbox = inbox(user,criteria)
        [topicSubscription:subscriptionList,users:[UserDetail.get(user?.id)],posts:inbox.posts,count:inbox.count ,topicList:topicService.listTrendingTopis("today")]
    }

    @Transactional(readOnly = true)
    Map<String,Object> profile(Map user,Map criteria){
        println "<====================================Profile=========================================================>"
        UserDetail userDetail = UserDetail.load(user?.id)
        List<Topic> topicList = topicService.listMyTopics(userDetail,[max:5])
        return [users:[userDetail],topicList: topicList, count: topicList.size()]
    }
    @Transactional(readOnly = true)
    Map<String,Object> userProfile(UserDetail user,Map criteria){
        println "<====================================Profile=========================================================>"
//        UserDetail userDetail = UserDetail.load(user?.id)
        List<Topic> topicList = topicService.listUserTopics(user,[max:5])
        List<Resource> resourceList = topicService.listUserPosts(user,[max:5])
        return [users:[user],topicList: topicList,posts:resourceList]
    }

    Map<String,Object> inbox(Map user,Map criteria){
        println "<====================================Inbox=========================================================>"
        String hql = '''from Resource r join  r.topic t join t.subscription s join s.userDetail u
                                   where r.id not in
                                     (select r1.id from Resource r1 join r1.readingItem rd join r1.topic t1 join t1.subscription s1
                                         where rd.userDetail.id = :id
                                         )and u.id = :id group by r.id order by r.id desc'''
        List<Object> resourceList = Resource.executeQuery(hql,[id:user.id.toLong(),max : criteria.max?:5, offset: criteria.offset?:0])

        int count = Resource.executeQuery(hql,[id:user.id.toLong()])?.size()
        [posts:resourceList, count:count?:0]

    }

    def sendPasswordToMail(UserDetail user){
        MailProperty property = new MailProperty()
        property.isMultipart = true
        property.to << user.email
        property.subject = "Login Password"
        property.view = "/mailingLayouts/forgot"
        property.model = [name: "${user.firstName} ${user.lastName}", password: "${user.password}"]
        property << [cid:'logo',type:'image/jpg',path:'images/logo.png']
        property << [cid:'myimage',type:'image/jpg',path:"images/profile/${user.photo}"]
        mailingService.sendMail(property)
    }
}
