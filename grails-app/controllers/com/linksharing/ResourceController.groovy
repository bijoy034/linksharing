package com.linksharing

import com.linksharing.co.DocumentResourceCO
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ResourceController {

    def resourceService
    static allowedMethods = [saveLink: "POST",saveDoc: "POST"]

    def downloadDoc(DocumentResource doc){
        try {
            String path = grailsApplication.mainContext.servletContext.getRealPath("images/topic")
            fileService.download(response, doc.fileName, path)
        }catch(Throwable e){
            flash.error = e.getMessage()
            redirect(url:"/")
        }
    }
    def show(Resource resourceInstance) {
        try {
            if(!resourceInstance && session.user){
                redirect(url: "/")
            }else if(resourceInstance && session.user){
                Resource resource = resourceService.showResource(resourceInstance)
                [post: resource]
            }
        }catch(Throwable e){
            flash.error = e
            redirect(url: "/")
        }
    }

    @Transactional
    def saveLink(LinkShare linkShareInstance) {
        withForm {
            try{
                resourceService.shareLink(linkShareInstance,session.user as Map)
                flash.message = "Link Resource successfully added!"
                redirect(controller: "resource", action: 'show',id: linkShareInstance.id)
            }catch(ValidationException e){
                linkShareInstance.errors = e.errors
                flash.put("error-msg", linkShareInstance)
                redirect(controller: "userDetail", action: 'dashboard')
            }catch(Throwable e){
                flash.error = e.getMessage()
                redirect(controller: "userDetail", action: 'dashboard')
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
                redirect(controller: "resource", action: 'show',id: resource.id)
            }catch(ValidationException e){
                documentsResourceInstance.errors = e.errors
                flash.put("error-msg", documentsResourceInstance)
                redirect(controller: "userDetail", action: 'dashboard')
            }catch(Throwable e){
                flash.error = e.getMessage()
                redirect(controller: "userDetail", action: 'dashboard')
            }
        }
    }
}
