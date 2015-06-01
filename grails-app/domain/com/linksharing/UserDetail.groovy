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
        username(unique: true)
        password(password:true)
        firstName()
        lastName()
        photo()
        admin()
        active()
        dateCreated(format:'yyyy-MM-dd')
        lastUpdated(format:'yyyy-MM-dd')
    }
}
