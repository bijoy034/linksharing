package com.linksharing

import org.springframework.validation.Errors

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer maxTopic ) {
        params.max = Math.min(max ?: 10, 100)
        respond Topic.list(params), model:[topicInstanceCount: Topic.count()]
    }
    def list(Topic topicInstance ) {
        UserDetail user = UserDetail.load(session.user?.id)
        List<Topic> topicList = Topic.list()
        List<Resource> post;
        if(topicInstance){
            post = Resource.findAllByTopic(Topic.load(topicInstance?.id))
        }else{
            post = topicList[0].resource as List
        }

        [topicList:topicList,posts: post]
    }
    def show(Topic topicInstance) {
        if (!topicInstance && session.user) {
            redirect(controller: "topic", action: "list")
        }else if(topicInstance && session.user){
            List<Topic> topicList = [Topic.load(topicInstance.id)]
            List<Resource> post = topicList[0].resource as List
            [topicList:topicList,users: topicList[0].subscription*.userDetail,posts: post]
        }
    }


    def create() {
        respond new Topic(params)
    }

    @Transactional
    def save(Topic topicInstance) {
        withForm {
            UserDetail user = UserDetail.load(session.user?.id)
            Subscription subscription = new Subscription(seriousness: Seriousness.Serious,userDetail: user)
            topicInstance.createdBy = user
            topicInstance.addToSubscription(subscription)

            if(topicInstance.hasErrors()){
                flash.put("error-msg", user)
            }else if (topicInstance.save(flush: true)) {
                flash.message = "Topic successfully added!"
            }else {
                flash.put("error-msg", topicInstance)
            }
        }
        redirect(controller: "userDetail", action: 'dashboard')
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
