package com.linksharing

import com.sun.org.apache.xpath.internal.operations.Bool

class ReadingItem {

    Boolean isRead
    static belongsTo = [resource:Resource,userDetail:UserDetail]
    static constraints = {
        resource()
        userDetail()
        isRead()
    }
}
