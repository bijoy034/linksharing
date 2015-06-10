package com.linksharing

import grails.validation.ValidationException
import org.springframework.validation.Errors
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {
    def topicService
    def resourceService
    def fileService

    static allowedMethods = [save: "POST"]

    def index(){}
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
            if (!topicInstance ) {
                redirect(controller: "topic", action: "list")
            } else if (topicInstance) {
                topicService.showTopic(topicInstance)
            }
        }catch(Throwable e){
            flash.error = e.getMessage()
            redirect(controller: "topic", action: "list")
        }
    }
    def resource(Resource resourceInstance) {
        try {
            if(!resourceInstance){
                redirect(url: "/")
            }else if(resourceInstance){
                Resource resource = resourceService.showResource(resourceInstance)
                [post: resource]
            }
        }catch(Throwable e){
            flash.error = e
            redirect(url: "/")
        }
    }
    def downloadDoc(DocumentResource doc){
        try {
            String path = grailsApplication.mainContext.servletContext.getRealPath("images/topic")
            fileService.download(response, doc.fileName, path)
        }catch(Throwable e){
            flash.error = e.getMessage()
            redirect(url:"/")
        }
    }

}
