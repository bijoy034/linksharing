package com.linksharing

import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubscriptionController {
    def topicService
    def subscriptionService

    def saveTopic(Topic topicInstance) {
        withForm {
            try {
                Topic topic = topicService.saveTopic(topicInstance, session.user as Map)
                flash.message = "Topic successfully added!"
                redirect(controller: "topic", action: 'show',id: topic.id)
            }catch (ValidationException e) {
                topicInstance.errors = e.errors
                flash.put("error-msg", topicInstance)
                redirect(url: '/dashboard')
            }catch(Throwable e){
                flash.error = e.getMessage()
                redirect(url: '/dashboard')
            }
        }

    }

    def list(Topic topicInstance ) {
        try {
            List<Subscription> subscriptionList = subscriptionService.listSubscription(session.user as Map)
            List<Resource> post;
            if (subscriptionList.size() > 0) {
                if (topicInstance) {
                    post = topicService.listAllTopicPosts(topicInstance)
                } else {
                    post = subscriptionList[0].topic.resource as List
                }
                [topic_subscription: subscriptionList, posts: post]
            } else {
                redirect(url: '/dashboard')
            }
        }catch(Throwable e){
            flash.error = e
            redirect(url: '/dashboard')
        }
    }

    def save(Long topic_id) {
        Subscription subscriptionInstance
        try {
            subscriptionInstance = subscriptionService.subscribeTopic(topic_id,session.user as Map)
            flash.message = "successfully topic subscribed!"
            redirect(controller: "topic", action: 'show',id: topic_id)
        }catch (ValidationException e) {
            subscriptionInstance.errors = e.errors
            flash.put("error-msg", subscriptionInstance)
            redirect(url: '/dashboard')
        }catch(Throwable e){
            flash.message = e.getMessage()
            redirect(url: '/dashboard')
        }
    }
    def remove(Long topic_id) {
        Subscription subscriptionInstance
        try{
            subscriptionInstance = subscriptionService.unSubscribe(topic_id,session.user as Map)
            flash.message = "Topic Unsubscribed!"
            redirect(controller: "topic", action: 'show', id:topic_id)
        }catch(Throwable e){
            flash.message = e.getMessage()
            redirect(url: '/dashboard')
        }
    }

    def read(Long id) {
        ReadingItem readingItem
//        try {
            /*readingItem = */subscriptionService.readResource(Resource.get(id),UserDetail.get(session.user.id as Long))
            flash.message = "Item read!"
//        }catch (ValidationException e) {
//            readingItem.errors = e.errors
//            flash.put("error-msg", readingItem)
//        }catch(Throwable e){
//            flash.message = e.getMessage()
//        }
       redirect(url: '/dashboard')
    }

    def unRead(ReadingItem readingItem) {
        try{
            subscriptionService.unReadReasource(readingItem)
            flash.message = "Item unread!"
        }catch(Throwable e){
            flash.message = e.getMessage()
            redirect(url: '/dashboard')
        }
    }

    def update(Subscription subscriptionInstance) {
        try {
            subscriptionInstance = subscriptionService.updateSubscribe(subscriptionInstance)
            flash.message = "successfully Updated!"
            redirect(controller: "topic", action: 'show',id: subscriptionInstance.topic.id)
        }catch (ValidationException e) {
            subscriptionInstance.errors = e.errors
            flash.put("error-msg", subscriptionInstance)
            redirect(url: '/dashboard')
        }catch(Throwable e){
            flash.message = e.getMessage()
            redirect(url: '/dashboard')
        }
    }
    /* @Transactional
    def update(Subscription subscriptionInstance) {
        try {
            subscriptionInstance = subscriptionService.updateSubscribe(subscriptionInstance)
            render "successfully Updated!"
        }catch (ValidationException e) {
            render e.errors.properties
        }catch(Throwable e){
            render e.getMessage()
        }
    }*/

}
