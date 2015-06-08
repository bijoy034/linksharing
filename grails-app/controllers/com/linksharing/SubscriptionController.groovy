package com.linksharing

import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubscriptionController {
    def topicService
    def subscriptionService

    static allowedMethods = [save: "GET", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Subscription.list(params), model:[subscriptionInstanceCount: Subscription.count()]
    }
    def list(Topic topicInstance ) {
        try {
            List<Subscription> subscriptionList = subscriptionService.listSubscription(session.user as UserDetail)
            List<Resource> post;
            if (subscriptionList.size() > 0) {
                if (topicInstance) {
                    post = topicService.listAllTopicPosts(topicInstance)
                } else {
                    post = subscriptionList[0].topic.resource as List
                }
                [topic_subscription: subscriptionList, posts: post]
            } else {
                redirect(url: "/")
            }
        }catch(Throwable e){
            flash.error = e
            redirect(url: "/")
        }
    }
    def show(Subscription subscriptionInstance) {
        respond subscriptionInstance
    }

    def create() {
        respond new Subscription(params)
    }



    @Transactional
    def save(Long topic_id) {
        Subscription subscriptionInstance
        try {
            subscriptionInstance = subscriptionService.subscribeTopic(topic_id,session.user as UserDetail)
            flash.message = "successfully topic subscribed!"
            redirect(controller: "topic", action: 'show',id: topic_id)
        }catch (ValidationException e) {
            subscriptionInstance.errors = e.errors
            flash.put("error-msg", subscriptionInstance)
            redirect(controller: "userDetail", action: 'dashboard')
        }catch(Throwable e){
            flash.message = e.getMessage()
            redirect(controller: "userDetail", action: 'dashboard')
        }
    }
    @Transactional
    def remove(Long topic_id) {
        Subscription subscriptionInstance
        try{
            subscriptionInstance = subscriptionService.unSubscribe(topic_id,session.user as UserDetail)
            flash.message = "Topic Unsubscribed!"
            redirect(controller: "topic", action: 'show', id:topic_id)
        }catch (ValidationException e) {
            subscriptionInstance.errors = e.errors
            flash.put("error-msg", subscriptionInstance)
            redirect(controller: "userDetail", action: 'dashboard')
        }catch(Throwable e){
            flash.message = e.getMessage()
            redirect(controller: "userDetail", action: 'dashboard')
        }
    }

    def edit(Subscription subscriptionInstance) {
        respond subscriptionInstance
    }

    @Transactional
    def update(Subscription subscriptionInstance) {
        try {
            subscriptionInstance = subscriptionService.updateSubscribe(subscriptionInstance)
            flash.message = "successfully topic subscribed!"
            redirect(controller: "topic", action: 'show',id: subscriptionInstance.topic.id)
        }catch (ValidationException e) {
            subscriptionInstance.errors = e.errors
            flash.put("error-msg", subscriptionInstance)
            redirect(controller: "userDetail", action: 'dashboard')
        }catch(Throwable e){
            flash.message = e.getMessage()
            redirect(controller: "userDetail", action: 'dashboard')
        }
    }

    @Transactional
    def delete(Subscription subscriptionInstance) {

        if (subscriptionInstance == null) {
            notFound()
            return
        }

        subscriptionInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Subscription.label', default: 'Subscription'), subscriptionInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'subscription.label', default: 'Subscription'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
