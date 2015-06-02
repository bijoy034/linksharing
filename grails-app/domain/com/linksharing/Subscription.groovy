package com.linksharing

import com.linksharing.Seriousness
import com.linksharing.Topic

class Subscription {

    Seriousness seriousness
    Date dateCreated
    static belongsTo = [topic:Topic]

    static constraints = {
       // topic(unique: userDetail)
       // userDetail()
        seriousness()
        dateCreated(format:'yyyy-MM-dd')
    }
}
