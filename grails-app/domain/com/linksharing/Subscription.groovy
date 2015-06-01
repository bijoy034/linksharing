package com.linksharing

import com.linksharing.Seriousness
import com.linksharing.Topic

class Subscription {

    Seriousness seriousness
    Date dateCreated
    static belongsTo = [topic:Topic,userDetail:UserDetail]

    static constraints = {
        topic()
        userDetail()
        seriousness()
        dateCreated()
    }
}
