package com.linksharing

import com.linksharing.co.UserDetailCO
import com.linksharing.dto.UserDetailDTO
import grails.transaction.Transactional
import grails.validation.ValidationException
import org.hibernate.criterion.CriteriaSpecification

@Transactional
class UserService {

    def fileService
    def subscriptionService
    def mailingService

    Map register(UserDetailCO userDetailCOInstance,String fileLocation) {
        UserDetail userDetail = new UserDetail(userDetailCOInstance)
            if (userDetailCOInstance.hasErrors()) {
                throw new ValidationException("User Detail is not valid", userDetailCOInstance.errors)
            }else if (userDetail.validate()) {
                if(fileService.upload(userDetailCOInstance.photo,fileLocation)) {
                    userDetail.save(flush: true)
                    return [id:userDetail.id,photo:userDetail.photo,username:userDetail.username]
                }
            } else {
                throw new ValidationException("User Detail is not valid", userDetail.errors)
            }

        return null
    }

    @Transactional(readOnly = true)
    Map login(String loginid,String password){
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
        UserDetail userDetail = UserDetail.findByEmail(email)
    }

    @Transactional(readOnly = true)
    Map<String,Object> dashboard(Map user){
        List<Subscription> subscriptionList = subscriptionService.listSubscription(user,[max:5])

        [topic_subscription:subscriptionList,users:[UserDetail.get(user?.id)],posts: subscriptionList*.topic.resource.flatten {ReadingItem.findAllByIsRead(null)}]
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
