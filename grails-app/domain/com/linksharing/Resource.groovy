package com.linksharing

class Resource {
    //String title
    String description
    Date dateCreated
    Date lastUpdated

    static belongsTo = [
            createdBy:UserDetail,
            topic:Topic
    ]
    static hasMany = [
            readingItem:ReadingItem,
            resourceRating:ResourceRating
    ]
    static mapping = {
        tablePerHierarchy false
        description type: 'text'
        sort dateCreated: 'desc'
        readingItem lazy:false
        resourceRating fetch: 'join'
    }
    static constraints = {
      //  title(unique: 'topic') // topic not working
        description(widget:'textarea',maxSize: 1024)
        createdBy()
        topic()
        dateCreated(format:'yyyy-MM-dd')
        lastUpdated(format:'yyyy-MM-dd')
        readingItem nullable: true
        resourceRating nullable: true
    }
}
