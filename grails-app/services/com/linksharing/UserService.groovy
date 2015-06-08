package com.linksharing

import com.linksharing.co.UserDetailCO
import grails.transaction.Transactional
import grails.validation.ValidationException

@Transactional
class UserService {

    def fileService
    def subscriptionService

    UserDetail register(UserDetailCO userDetailCOInstance,String fileLocation) {
        UserDetail userDetail = new UserDetail(userDetailCOInstance)

            if (userDetailCOInstance.hasErrors()) {
                throw new ValidationException("User Detail is not valid", userDetailCOInstance.errors)
            }else if (userDetail.validate()) {
                if(fileService.upload(userDetailCOInstance.photo,fileLocation)) {
                    userDetail.save(flush: true)
                    return userDetail
                }
            } else {
                throw new ValidationException("User Detail is not valid", userDetail.errors)
            }

        return null
    }

    @Transactional(readOnly = true)
    UserDetail login(String loginid,String password){
        UserDetail.findByPasswordAndUsername(password, loginid) ?: UserDetail.findByPasswordAndEmail(password, loginid)
    }

    @Transactional(readOnly = true)
    Map<String,Object> dashboard(UserDetail user){
        List<Subscription> subscriptionList = subscriptionService.listSubscription(user,[max:5])

        [topic_subscription:subscriptionList,users:[UserDetail.get(user?.id)],posts: subscriptionList*.topic.resource.flatten {ReadingItem.findAllByIsRead(null)}]
    }
}
