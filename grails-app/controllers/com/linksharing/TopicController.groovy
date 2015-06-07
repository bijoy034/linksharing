package com.linksharing

import org.springframework.validation.Errors

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TopicController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Topic.list(params), model:[topicInstanceCount: Topic.count()]
    }

    def show(Topic topicInstance) {
        if (!topicInstance) {
            redirect(url: "/")
        }else {
            def subscribe_topic = Subscription.findAllByTopic(topicInstance)
            def resource = subscribe_topic[0].topic.resource
        [topic_subscription: subscribe_topic, users: subscribe_topic[0].topic.subscription*.userDetail, posts: resource]
         }
    }

    def create() {
        respond new Topic(params)
    }

    @Transactional
    def save(Topic topicInstance) {
        withForm {
            Subscription subscription = new Subscription(seriousness: Seriousness.Serious)
            topicInstance.addToSubscription(subscription)

            UserDetail user = UserDetail.load(session.user.id)
            user.addToTopic(topicInstance)

            user.addToSubscription(subscription)

            if(user.hasErrors()){
                flash.put("error-msg", user)
            }else if (user.save(flush: true)) {
                flash.message = "Topic successfully added!"
            }else {
                flash.put("error-msg", user)
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
