package com.linksharing

import com.linksharing.co.ResourceCO

class Resource{
    //String title
    String description
    Date dateCreated
    Date lastUpdated

    Resource(){}

    Resource(ResourceCO resourceCO){
        this.description = resourceCO.description
        this.createdBy = resourceCO.createdBy
        this.topic = resourceCO.topic
    }
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
