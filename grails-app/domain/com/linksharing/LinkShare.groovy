package com.linksharing

import com.linksharing.co.ResourceCO

class LinkShare extends Resource{
    String url
    static constraints = {
        url url: true,nullable: false,blank: false
    }
}
