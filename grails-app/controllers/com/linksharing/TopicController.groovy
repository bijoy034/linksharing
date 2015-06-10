package com.linksharing

import grails.validation.ValidationException
import org.springframework.validation.Errors
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {
    def topicService

    static allowedMethods = [save: "POST"]


    def list(Topic topicInstance ) {
        try {
            List<Topic> topicList = topicService.listTopic(session.user as Map)
            List<Resource> post;
            if (topicList.size() > 0) {
                if (topicInstance) {
                    post = topicService.listAllTopicPosts(topicInstance)
                } else {

                    post = topicList[0].resource as List
                }
                [topicList: topicList, posts: post]
            } else {
                redirect(url: "/")
            }
        }catch(Throwable e){
            flash.error = e.getMessage()
            redirect(url: "/")
        }

    }
    def show(Topic topicInstance) {
        try {
            if (!topicInstance && session.user) {
                redirect(controller: "topic", action: "list")
            } else if (topicInstance && session.user) {
                topicService.showTopic(topicInstance)
            }
        }catch(Throwable e){
            flash.error = e.getMessage()
            redirect(controller: "topic", action: "list")
        }
    }

}
