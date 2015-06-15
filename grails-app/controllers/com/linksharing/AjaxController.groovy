package com.linksharing

class AjaxController {
    def topicService

    def addTopic(){
        render (template: "/ajax/addTopic",model: [visibility:Visibility])
    }
    def invite(){
        render (template: "/ajax/invite")
    }

    def shareLink(){
        render (template: "/ajax/shareLink",model: [topicList:topicService.listAllDistinctTopic(session.user as Map)])
    }
    def shareDoc(){
        render (template: "/ajax/shareDoc",model: [topicList:topicService.listAllDistinctTopic(session.user as Map)])
    }
    def trendingTopic(){
        render (template: "/layouts/trending_topics",model: [topicList:topicService.listTrendingTopis(params.day)])
    }
  /*  def loadTopicPosts(Topic topicInstance){
        render (template: "/layouts/topic_posts",model: topicService.showTopic(topicInstance))

    }*/
}
