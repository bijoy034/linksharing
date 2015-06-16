package com.linksharing

import com.linksharing.date.CustomDate
import com.linksharing.dto.UserDetailDTO
import grails.transaction.Transactional
import grails.validation.ValidationException

@Transactional
class TopicService {


    Topic saveTopic(Topic topicInstance,Map user) {
        UserDetail userDetail = UserDetail.load(user?.id)
        Subscription subscription = new Subscription(seriousness: Seriousness.VerySerious,userDetail: userDetail)
        topicInstance.createdBy = userDetail
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
    List<Topic> listAllDistinctTopic(Map user,Map criteria = [:]){
        List<Topic> topics = Topic.listTopic(user?.id as Long).listDistinct(criteria)
        println topics
        topics

    }

    @Transactional(readOnly = true)
    Map listTopicWithPost(Topic topicInstance,Map user,Map criteria = [:]) {
        List<Topic> topicList = listAllDistinctTopic(user,criteria)
        List<Resource> post;
        if (topicList.size() > 0) {
            if (topicInstance) {
                post = listAllTopicPosts(topicInstance)
            } else {
                post = topicList[0].resource as List
            }
            int size = Topic.listTopic(user?.id as Long).listDistinct().size()
            println(size)
            return [topicList: topicList, posts: post, count: size]

        }else{
            return null
        }
    }
    List<Topic> listTrendingTopis(String day = null){
        Date date
        if(day){
            if(day == "today"){
                date = new Date()
            }
            else if(day == "week"){
                date = CustomDate.firstDayInWeek(new Date())
            }else if(day == "month"){
                date = CustomDate.firstDayInMonth(new Date())
            }else if(day == " year"){
                date = CustomDate.firstDayInYear()
            }

        }
        Subscription.trendingTopics(date).listDistinct([max:5])
    }

    @Transactional(readOnly = true)
    List<Resource> listAllTopicPosts(Topic topicInstance){
            Resource.findAllByTopic(Topic.load(topicInstance?.id))
    }
}
