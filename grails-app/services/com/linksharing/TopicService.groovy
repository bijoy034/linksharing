package com.linksharing

import grails.transaction.Transactional
import grails.validation.ValidationException

@Transactional
class TopicService {

    Topic saveTopic(Topic topicInstance,UserDetail user) {
        user = UserDetail.load(user?.id)
        Subscription subscription = new Subscription(seriousness: Seriousness.VerySerious,userDetail: user)
        topicInstance.createdBy = user
        topicInstance.addToSubscription(subscription)

        if(topicInstance.hasErrors()){
            throw new ValidationException("Topic Detail is not valid", topicInstance.errors)
        }else if (topicInstance.save(flush: true)) {
            return topicInstance
        }else {
            throw new ValidationException("Topic Detail is not valid", topicInstance.errors)
        }
        return null
    }
    @Transactional(readOnly = true)
    Map<String,Object> showTopic(Topic topicInstance){
        List<Topic> topicList = [Topic.load(topicInstance.id)]
        List<Resource> post = topicList[0].resource as List
        [topicList:topicList,users: topicList[0].subscription*.userDetail,posts: post]
    }

    @Transactional(readOnly = true)
    List<Topic> listTopic(){
         Topic.list()
    }

    @Transactional(readOnly = true)
    List<Resource> listAllTopicPosts(Topic topicInstance){
            Resource.findAllByTopic(Topic.load(topicInstance?.id))
    }
}
