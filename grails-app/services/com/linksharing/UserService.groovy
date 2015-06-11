package com.linksharing

import com.linksharing.co.UserDetailCO
import com.linksharing.dto.UserDetailDTO
import grails.transaction.Transactional
import grails.validation.ValidationException
import org.hibernate.criterion.CriteriaSpecification
import org.hibernate.sql.JoinType

@Transactional
class UserService {

    def fileService
    def subscriptionService
    def mailingService

    Map register(UserDetailCO userDetailCOInstance,String fileLocation) {
        println "<====================================Register=========================================================>"
        UserDetail userDetail = new UserDetail(userDetailCOInstance)
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
    Map<String,Object> dashboard(Map user){
        println "<====================================Dashboard=========================================================>"
        List<Subscription> subscriptionList = subscriptionService.listSubscription(user,[max:5])

        [topic_subscription:subscriptionList,users:[UserDetail.get(user?.id)],posts: inbox(user)]
    }

    Object inbox(Map user){
        println "<====================================Inbox=========================================================>"

        List<Resource> resourceList =  Resource.executeQuery('''from Resource r join  r.topic t join t.subscription s join s.userDetail u
                                   where r.id not in
                                     (select r1.id from Resource r1 join r1.readingItem rd join r1.topic t1 join t1.subscription s1
                                         where rd.userDetail.id = :id
                                         )AND u.id = :id group by r.id''',[id:user.id.toLong()])
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