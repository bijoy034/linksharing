package com.linksharing

import com.linksharing.co.DocumentResourceCO
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class ResourceController {

    def resourceService
    static allowedMethods = [saveLink: "POST",saveDoc: "POST"]

    @Transactional
    def saveLink(LinkShare linkShareInstance) {
        withForm {
            try{
                resourceService.shareLink(linkShareInstance,session.user as Map)
                flash.message = "Link Resource successfully added!"
                redirect(controller: "topic", action: 'resource',id: linkShareInstance.id)
            }catch(ValidationException e){
                linkShareInstance.errors = e.errors
                flash.put("error-msg", linkShareInstance)
                redirect(url: '/dashboard')
            }catch(Throwable e){
                flash.error = e.getMessage()
                redirect(url: '/dashboard')
            }
        }

    }

    @Transactional
    def saveDoc(DocumentResourceCO documentsResourceInstance) {
        withForm {
            try{
                String path= grailsApplication.mainContext.servletContext.getRealPath("images/topic")
                DocumentResource resource = resourceService.shareDocument(documentsResourceInstance,session.user as Map,path )
                flash.message = "Document Resource successfully added!"
                redirect(controller: "topic", action: 'resource',id: resource.id)
            }catch(ValidationException e){
                documentsResourceInstance.errors = e.errors
                flash.put("error-msg", documentsResourceInstance)
                redirect(ul: '/dashboard')
            }catch(Throwable e){
                flash.error = e.getMessage()
                redirect(url: '/dashboard')
            }
        }
    }
}
