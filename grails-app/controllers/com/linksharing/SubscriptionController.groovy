package com.linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SubscriptionController {

    static allowedMethods = [save: "GET", update: "POST", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Subscription.list(params), model:[subscriptionInstanceCount: Subscription.count()]
    }
    def list(Topic topicInstance ) {
        UserDetail user = UserDetail.load(session.user?.id)
        List<Subscription> subscriptionList = Subscription.findAllByUserDetail(user)
        List<Resource> post;
        if(topicInstance){
            post = Resource.findAllByTopic(Topic.load(topicInstance?.id))
        }else{
            post = subscriptionList[0].topic.resource as List
        }
        [topic_subscription:subscriptionList,posts: post]
    }
    def show(Subscription subscriptionInstance) {
        respond subscriptionInstance
    }

    def create() {
        respond new Subscription(params)
    }



    @Transactional
    def save(Long topic_id) {
        Subscription subscriptionInstance = new Subscription(seriousness: Seriousness.Serious,topic: Topic.load(topic_id), userDetail: UserDetail.load(session.user?.id))
        if(subscriptionInstance.hasErrors()){
            flash.put("error-msg", subscriptionInstance)
        }else if (subscriptionInstance.save (flush:true)) {
            flash.message = "successfully topic subscribed!"
        }else {
            flash.put("error-msg", subscriptionInstance)
        }
        redirect(controller: "topic", action: 'show', id:topic_id)
    }
    @Transactional
    def remove(Long topic_id) {
        Subscription.findByTopicAndUserDetail(Topic.load(topic_id), UserDetail.load(session.user?.id)).delete(flush: true)
        flash.message = "Topic Unsubscribed!"
        redirect(controller: "topic", action: 'show', id:topic_id)
    }

    def edit(Subscription subscriptionInstance) {
        respond subscriptionInstance
    }

    @Transactional
    def update(Subscription subscriptionInstance) {
        if(subscriptionInstance.hasErrors()){
            flash.put("error-msg", subscriptionInstance)
        }else if (subscriptionInstance.save (flush:true)) {
            flash.message = "successfully topic subscribed!"
        }else {
            flash.put("error-msg", subscriptionInstance)
        }
        redirect(controller: "topic", action: 'show', id:subscriptionInstance.topic.id)
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
