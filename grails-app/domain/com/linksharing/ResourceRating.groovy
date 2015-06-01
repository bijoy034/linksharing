package com.linksharing

class ResourceRating {

    Integer score
    static belongsTo = [resource:Resource,userDetail:UserDetail]
    static constraints = {
        resource()
        userDetail()
        score()
    }
}
