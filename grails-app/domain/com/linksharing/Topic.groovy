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
        dateCreated(format:'yyyy-MM-dd')
        lastUpdated(format:'yyyy-MM-dd')
        name validator: { value, topic, errors ->
            if ( Topic.countByNameAndCreatedBy(value,topic.createdBy) ) {
                    errors.rejectValue( "name", "some.text", "User cannot have multiple topic with the same name.")
                return false
            }
            return true
        }
    }
}
