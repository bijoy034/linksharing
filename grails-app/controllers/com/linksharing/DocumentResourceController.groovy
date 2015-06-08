package com.linksharing

import com.linksharing.co.DocumentResourceCO
import grails.validation.ValidationException

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentResourceController {
    def resourceService
    def fileService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DocumentResource.list(params), model:[documentResourceInstanceCount: DocumentResource.count()]
    }

    def show(DocumentResource documentResourceInstance) {
        respond documentResourceInstance
    }

    def create() {
        respond new DocumentResource(params)
    }

    @Transactional
    def save(DocumentResourceCO documentsResourceInstance) {
        withForm {
            try{
                String path= grailsApplication.mainContext.servletContext.getRealPath("images/topic")
                DocumentResource resource = resourceService.shareDocument(documentsResourceInstance,session.user as UserDetail,path )
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
    def downloadDoc(DocumentResource doc){
        try {
            String path = grailsApplication.mainContext.servletContext.getRealPath("images/topic")
            fileService.download(response, doc.fileName, path)
        }catch(Throwable e){
            flash.error = e.getMessage()
            redirect(url:"/")
        }
    }
    def edit(DocumentResource documentResourceInstance) {
        respond documentResourceInstance
    }

    @Transactional
    def update(DocumentResource documentResourceInstance) {
        if (documentResourceInstance == null) {
            notFound()
            return
        }

        if (documentResourceInstance.hasErrors()) {
            respond documentResourceInstance.errors, view:'edit'
            return
        }

        documentResourceInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DocumentResource.label', default: 'DocumentResource'), documentResourceInstance.id])
                redirect documentResourceInstance
            }
            '*'{ respond documentResourceInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DocumentResource documentResourceInstance) {

        if (documentResourceInstance == null) {
            notFound()
            return
        }

        documentResourceInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DocumentResource.label', default: 'DocumentResource'), documentResourceInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'documentResource.label', default: 'DocumentResource'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
