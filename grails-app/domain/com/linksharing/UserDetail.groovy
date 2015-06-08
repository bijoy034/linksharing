package com.linksharing

import com.linksharing.co.UserDetailCO
import org.springframework.web.multipart.MultipartFile

class UserDetail {
    UserDetail(UserDetailCO userDetailCO) {
        this.email = userDetailCO.email
        this.username = userDetailCO.username
        this.password = userDetailCO.password
        this.firstName = userDetailCO.firstName
        this.lastName = userDetailCO.lastName
        this.photo = userDetailCO.photo.originalFilename
    }

    String email
    String username
    String password
    String firstName
    String lastName
    String photo
    Boolean admin = false
    Boolean active = true
    Date dateCreated
    Date lastUpdated
    static mapping = {
        sort dateCreated: 'desc'
        topic fetch: 'join'
        subscription fetch: 'join'
        resource lazy: false
    }
    static hasMany = [
            topic         : Topic,
            subscription  : Subscription,
            resource      : Resource,
            readingItem   : ReadingItem,
            resourceRating: ResourceRating
    ]

    static constraints = {
        firstName()
        lastName()
        email(email: true, unique: true, blank: false)
        username(unique: true)
        password(password: true)
        photo(nullable: true)
        //confirmPassword bindable: true
        admin(nullable: true)
        active(nullable: true)
        dateCreated(format: 'yyyy-MM-dd')
        lastUpdated(format: 'yyyy-MM-dd')
    }

}
