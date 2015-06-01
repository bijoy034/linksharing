package com.linksharing

class UserDetail {

    String email
    String username
    String password
    String firstName
    String lastName
    Byte[] photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
    static hasMany = [
            topic:Topic,
            subscription:Subscription,
            resource:Resource,
            readingItem:ReadingItem,
            resourceRating:ResourceRating
    ]

    static constraints = {
        email(email: true, unique: true, blank: false)
        username()
        password(password:true)
        firstName()
        lastName()
        photo()
        admin()
        active()
        dateCreated()
        lastUpdated()
    }
}
