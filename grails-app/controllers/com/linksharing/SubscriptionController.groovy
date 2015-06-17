package com.linksharing

import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

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

    def list(Integer max, Topic topicInstance ) {
        try {
            params.max = Math.min(max ?: 3, 100)
            Map subscriptionMap = subscriptionService.listSubscriptionTopic(topicInstance,session.user as Map,params)
            if (subscriptionMap) {
                subscriptionMap
            } else {
                redirect(url: '/dashboard')
            }
        }catch(Throwable e){
            flash.error = e
            redirect(url: '/dashboard')
        }
    }
    def save(Long topicId) {
        Subscription subscriptionInstance
        try {
            subscriptionInstance = subscriptionService.subscribeTopic(topicId,session.user as Map)
            flash.message = "successfully topic subscribed!"
            redirect(controller: "topic", action: 'show',id: topicId)
        }catch (ValidationException e) {
            subscriptionInstance.errors = e.errors
            flash.put("error-msg", subscriptionInstance)
            redirect(url: '/dashboard')
        }catch(Throwable e){
            flash.message = e.getMessage()
            redirect(url: '/dashboard')
        }
    }
    def remove(Long topicId) {
        Subscription subscriptionInstance
        try{
            subscriptionInstance = subscriptionService.unSubscribe(topicId,session.user as Map)
            flash.message = "Topic Unsubscribed!"
            redirect(controller: "topic", action: 'show', id:topicId)
        }catch(Throwable e){
            flash.message = e.getMessage()
            redirect(url: '/dashboard')
        }
    }

    def read(Long id) {
        ReadingItem readingItem
        try {
            readingItem = subscriptionService.readResource(id,session.user as Map)
            flash.message = "Item read!"
        }catch (ValidationException e) {
            readingItem.errors = e.errors
            flash.put("error-msg", readingItem)
        }catch(Throwable e){
            flash.message = e.getMessage()
        }
       redirect(url: '/dashboard')
    }

    def unRead(Long id) {
        try{
            subscriptionService.unReadResource(id,session.user as Map)
            flash.message = "Item unread!"
        }catch(Throwable e){
            flash.message = e.getMessage()
        }
        redirect(url: '/dashboard')
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
