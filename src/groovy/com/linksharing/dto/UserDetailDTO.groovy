package com.linksharing.dto

import com.linksharing.ReadingItem
import com.linksharing.Resource
import com.linksharing.ResourceRating
import com.linksharing.Subscription
import com.linksharing.Topic

class UserDetailDTO {
    Long id
    String email
    String username
    String password
    String firstName
    String lastName
    String photo
    Boolean admin
    Boolean active
    Date dateCreated
    Date lastUpdated
    Set<Topic> topic
    Set<Subscription> subscription
    Set<Resource> resource
    Set<ReadingItem> readingItem
    Set<ResourceRating> resourceRating
}
