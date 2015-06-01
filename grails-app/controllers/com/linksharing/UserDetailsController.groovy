package com.linksharing

class UserDetailsController {

    def index() {
       /* UserDetail user = UserDetail.get(1)
        Topic topic = new Topic(name: "Topic 1")
        topic.save(flush: true)
        user.addToTopic(topic)
        render user*.topic*/
        render "index page"
    }
}
