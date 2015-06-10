package com.linksharing

import grails.transaction.Transactional

@Transactional
class MailingService {
    def mailService
    def sendMail(MailProperty property) {
        mailService.sendMail {
            multipart property.isMultipart
            if(property.to){
                to property.to.toArray()
                if(property.cc){
                    cc property.cc.toArray()
                }
                if(property.bcc){
                    bcc property.bcc.toArray()
                }
                subject property.subject
                if(property.view) {
                    body(view: property.view, model: property.model)
                    property.inlines.each {
                        inline it.cid, it.contentType, it.path
                    }
                }
            }


        }

    }
}
