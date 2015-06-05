package com.linksharing

class ResourceRating {

    Integer score
    static belongsTo = [resource:Resource,userDetail:UserDetail]
    static mapping = {
        sort score: 'desc'
    }
    static constraints = {
        resource()
        userDetail()
        score()
    }
}
