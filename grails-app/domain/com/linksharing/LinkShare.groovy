package com.linksharing

class LinkShare extends Resource{

    String url

    static constraints = {
        url url: true,nullable: false,blank: false
    }
}
