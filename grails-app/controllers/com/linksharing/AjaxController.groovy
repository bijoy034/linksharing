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
        render (template: "/ajax/shareLink",model: [topicList:topicService.listTopic(session.user as Map)])
    }
    def shareDoc(){
        render (template: "/ajax/shareDoc",model: [topicList:topicService.listTopic(session.user as Map)])
    }
  /*  def loadTopicPosts(Topic topicInstance){
        render (template: "/layouts/topic_posts",model: topicService.showTopic(topicInstance))

    }*/
}