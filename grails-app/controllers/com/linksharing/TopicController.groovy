package com.linksharing

import grails.validation.ValidationException
import org.springframework.validation.Errors

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {
    def topicService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer maxTopic ) {
        params.max = Math.min(max ?: 10, 100)
        respond Topic.list(params), model:[topicInstanceCount: Topic.count()]
    }
    def list(Topic topicInstance ) {
        try {
            List<Topic> topicList = topicService.listTopic()
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
            flash.error = e
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


    def create() {
        respond new Topic(params)
    }

    @Transactional
    def save(Topic topicInstance) {
        withForm {
            try {
                Topic topic = topicService.saveTopic(topicInstance, session.user as UserDetail)
                flash.message = "Topic successfully added!"
                redirect(controller: "topic", action: 'show',id: topic.id)
            }catch (ValidationException e) {
                topicInstance.errors = e.errors
                flash.put("error-msg", topicInstance)
                redirect(controller: "userDetail", action: 'dashboard')
            }catch(Throwable e){
                flash.error = e.getMessage()
                redirect(controller: "userDetail", action: 'dashboard')
            }
        }

    }


    def edit(Topic topicInstance) {
        respond topicInstance
    }

    @Transactional
    def update(Topic topicInstance) {
        if (topicInstance == null) {
            notFound()
            return
        }

        if (topicInstance.hasErrors()) {
            respond topicInstance.errors, view:'edit'
            return
        }

        topicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect topicInstance
            }
            '*'{ respond topicInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Topic topicInstance) {

        if (topicInstance == null) {
            notFound()
            return
        }

        topicInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Topic.label', default: 'Topic'), topicInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'topic.label', default: 'Topic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
