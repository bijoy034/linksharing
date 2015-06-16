package com.linksharing

class AjaxController {
    def topicService
    def resourceService

    def addTopic(){
        render (template: "/ajax/addTopic",model: [visibility:Visibility])
    }
    def invite(){
        render (template: "/ajax/invite",model: [topicList:topicService.listAllDistinctTopic(session.user as Map)])
    }
    def inlineInvite(Long id){
        render (template: "/ajax/invite",model: [topicList:[Topic.load(id)]])
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
    def rateResource(Long resourceId, Integer score){
        try {
            Resource resource = resourceService.rateResource(resourceId, score, session.user as Map)
            render c.avgRatingLabel(post: resource)
        }catch(Throwable e){
            render e.getMessage()
        }

    }
  /*  def loadTopicPosts(Topic topicInstance){
        render (template: "/layouts/topic_posts",model: topicService.showTopic(topicInstance))

    }*/
}
