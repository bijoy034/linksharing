package com.linksharing

class Topic {
    String name
    Visibility visibility
    Date dateCreated
    Date lastUpdated
    static belongsTo = [createdBy:UserDetail]
    static hasMany = [subscription:Subscription,resource:Resource]
    static mapping = {
        /*sort lastUpdated: 'desc'
        subscription fetch: 'join'*/
    }
    static constraints = {

        name(unique: 'createdBy')
        visibility()
        dateCreated(format:'yyyy-MM-dd')
        lastUpdated(format:'yyyy-MM-dd')
        resource nullable: true
    }
}
