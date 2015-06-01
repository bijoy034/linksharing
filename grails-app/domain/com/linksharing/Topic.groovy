package com.linksharing

class Topic {
    String name
   Visibility visibility
    Date dateCreated
    Date lastUpdated
    static belongsTo = [createdBy:UserDetail]
    static hasMany = [subscription:Subscription,resource:Resource]
    static constraints = {
        name()
        visibility()
        dateCreated()
        lastUpdated()
        //userDetail(unique: (Topic))
    }
}
