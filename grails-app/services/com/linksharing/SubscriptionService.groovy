package com.linksharing

import com.linksharing.dto.UserDetailDTO
import grails.transaction.Transactional
import grails.validation.ValidationException

@Transactional
class SubscriptionService {

    @Transactional(readOnly = true)
    List<Subscription> listSubscription(Map user,Map criteria = [:]) {
        UserDetail userDetail = UserDetail.load(user?.id)
        Subscription.findAllByUserDetail(userDetail,criteria)
    }

    Subscription subscribeTopic(Long topic_id,Map user_map) {
        UserDetail user = UserDetail.load(user_map?.id)
        Subscription subscriptionInstance = new Subscription(seriousness: Seriousness.VerySerious,topic: Topic.load(topic_id), userDetail: user)
        if(subscriptionInstance.hasErrors()){
            throw new ValidationException("Subscribe Detail is not valid", subscriptionInstance.errors)
        }else if (subscriptionInstance.save (flush:true)) {
            return subscriptionInstance
        }else {
            throw new ValidationException("Subscribe Detail is not valid", subscriptionInstance.errors)
        }
        return null
    }

    Subscription updateSubscribe(Subscription subscriptionInstance){
        if(subscriptionInstance.hasErrors()){
            throw new ValidationException("Subscribe Detail is not valid", subscriptionInstance.errors)
        }else if (subscriptionInstance.save (flush:true)) {
            return subscriptionInstance
        }else {
            throw new ValidationException("Subscribe Detail is not valid", subscriptionInstance.errors)
        }
        return null
    }

    Subscription unSubscribe(Long topic_id,Map user){
        Subscription.findByTopicAndUserDetail(Topic.load(topic_id), UserDetail.load(user?.id)).delete(flush: true)
    }
}
