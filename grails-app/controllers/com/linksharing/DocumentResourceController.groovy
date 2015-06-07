package com.linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DocumentResourceController {

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
    def save(DocumentResource documentsResourceInstance) {
        withForm {
            ReadingItem item = new ReadingItem(userDetail: session.user.id,isRead: true)
            documentsResourceInstance.addToReadingItem(item)
            def doc = request.getFile('filePath')
            documentsResourceInstance.fileName = doc.originalFilename
            if (documentsResourceInstance.hasErrors()) {
                flash.put("error-msg", documentsResourceInstance)
            }else if(documentsResourceInstance.save(flush: true)) {
                String path= grailsApplication.mainContext.servletContext.getRealPath("images/topic")
                doc.transferTo(new File("${path}/${doc.originalFilename}"))
                flash.message = "File Resource successfully added!"
            }else {
                flash.put("error-msg", documentsResourceInstance)
            }
        }
        redirect(controller: "userDetail", action: 'dashboard')
    }
    def downloadDoc(DocumentResource doc){
        String path= grailsApplication.mainContext.servletContext.getRealPath("images/topic")
        File file = new File("${path}/${doc.fileName}")
        response.setHeader("Content-disposition", "attachment; filename=" + file.name)
       // response.contentType = file.ty
        response.contentLength = file.bytes.length
        response.outputStream << file.bytes
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
