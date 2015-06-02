package com.linksharing

class UserDetail {

    String email
    String username
    String password
    String confirmPassword
    String firstName
    String lastName
    Byte[] photo
    Boolean admin = false
    Boolean active = true
    Date dateCreated
    Date lastUpdated
    static transients = ['confirmPassword']
    static hasMany = [
            topic:Topic,
            subscription:Subscription,
            resource:Resource,
            readingItem:ReadingItem,
            resourceRating:ResourceRating
    ]

    static constraints = {
        firstName()
        lastName()
        email(email: true, unique: true, blank: false)
        username(unique: true)
        password(password:true)
        confirmPassword(matches: 'password')
        photo()
        admin()
        active()
        dateCreated(format:'yyyy-MM-dd')
        lastUpdated(format:'yyyy-MM-dd')
    }
}
