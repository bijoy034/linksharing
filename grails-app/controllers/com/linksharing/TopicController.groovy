package com.linksharing

import grails.validation.ValidationException
import org.springframework.validation.Errors
import grails.transaction.Transactional

class TopicController {
    def topicService
    def resourceService
    def fileService

    static allowedMethods = [save: "POST"]

    def index(){}
    def list(Integer max, Topic topicInstance ) {
        try {
            params.max = Math.min(max ?: 2, 100)
            Map topicMap = topicService.listTopicWithPost(topicInstance,session.user as Map,params)
            if (topicMap) {
                topicMap
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
