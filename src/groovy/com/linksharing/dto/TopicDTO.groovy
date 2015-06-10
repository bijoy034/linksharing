package com.linksharing.dto

import com.linksharing.Resource
import com.linksharing.Subscription
import com.linksharing.UserDetail
import com.linksharing.Visibility

class TopicDTO {
    Long id
    String name
    Visibility visibility
    Date dateCreated
    Date lastUpdated
    UserDetail createdBy
    Set<Subscription> subscription
    Set<Resource> resource

}
