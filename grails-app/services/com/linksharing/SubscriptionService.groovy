package com.linksharing

import grails.transaction.Transactional
import grails.validation.ValidationException

@Transactional
class SubscriptionService {

    @Transactional(readOnly = true)
    List<Subscription> listSubscription(UserDetail user,Map criteria = [:]) {
        user = UserDetail.load(user?.id)
        Subscription.findAllByUserDetail(user,criteria)
    }

    Subscription subscribeTopic(Long topic_id,UserDetail user) {
        user = UserDetail.load(user?.id)
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

    Subscription unSubscribe(Long topic_id,UserDetail user){
        Subscription.findByTopicAndUserDetail(Topic.load(topic_id), UserDetail.load(user?.id)).delete(flush: true)
    }
}
