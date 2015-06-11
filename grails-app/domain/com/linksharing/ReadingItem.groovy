package com.linksharing


class ReadingItem {

    Boolean isRead
    static belongsTo = [resource:Resource,userDetail:UserDetail]
    static constraints = {
        resource()
        userDetail()
        isRead()
    }
}
