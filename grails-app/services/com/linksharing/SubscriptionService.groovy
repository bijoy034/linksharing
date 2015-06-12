package com.linksharing

import grails.transaction.Transactional
import grails.validation.ValidationException

@Transactional
class SubscriptionService {
    def topicService
    @Transactional(readOnly = true)
    Map listSubscriptionTopic(Topic topicInstance,Map user,Map criteria = [:]) {
        UserDetail userDetail = UserDetail.load(user?.id)
        List<Subscription> subscriptionList = Subscription.findAllByUserDetail(userDetail,criteria)

        List<Resource> post;
        if (subscriptionList.size() > 0) {
            if (topicInstance) {
                post = topicService.listAllTopicPosts(topicInstance)
            } else {
                post = subscriptionList[0].topic.resource as List
            }
            return [topic_subscription: subscriptionList, posts: post, count: Subscription.countByUserDetail(userDetail)]
        }else{
            return null
        }
    }

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
        subscriptionInstance
    }

    Subscription updateSubscribe(Subscription subscriptionInstance){
        if(subscriptionInstance.hasErrors()){
            throw new ValidationException("Subscribe Detail is not valid", subscriptionInstance.errors)
        }else if (subscriptionInstance.save (flush:true)) {
            return subscriptionInstance
        }else {
            throw new ValidationException("Subscribe Detail is not valid", subscriptionInstance.errors)
        }
        subscriptionInstance
    }

    Subscription unSubscribe(Long topic_id,Map user){
        Subscription subscription = Subscription.findByTopicAndUserDetail(Topic.load(topic_id), UserDetail.load(user?.id))
        if(subscription) {
            subscription.delete(flush: true)
        }
        subscription
    }

    ReadingItem unReadResource(ReadingItem readingItemInstance){
        if(readingItemInstance) {
            readingItemInstance.delete(flush: true)
        }
        readingItemInstance
    }

    ReadingItem readResource(Long resourceId,Map user){
            ReadingItem readingItem = new ReadingItem(isRead: true, userDetail: UserDetail.load(user.id),resource : Resource.load(resourceId))
            if(readingItem.hasErrors()){
                throw new ValidationException("Data is not valid", readingItem.errors)
            }else if(readingItem.save(flush: true)){
                return readingItem
            }else{
                throw new ValidationException("Data is not valid", readingItem.errors)
            }
        readingItem
    }
}
