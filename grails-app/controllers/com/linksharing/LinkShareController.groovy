package com.linksharing



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class LinkShareController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond LinkShare.list(params), model:[linkShareInstanceCount: LinkShare.count()]
    }

    def show(LinkShare linkShareInstance) {
        respond linkShareInstance
    }

    def create() {
        respond new LinkShare(params)
    }

    @Transactional
    def save(LinkShare linkShareInstance) {
    withForm {
        ReadingItem item = new ReadingItem(userDetail: session.user.id,isRead: true)
        linkShareInstance.addToReadingItem(item)
        if (linkShareInstance.hasErrors()) {
            flash.put("error-msg", linkShareInstance)
        } else if (linkShareInstance.save(flush: true)) {
            flash.message = "Link Resource successfully added!"
        } else {
            flash.put("error-msg", linkShareInstance)
        }
    }
        redirect(controller: "userDetail", action: 'dashboard')
    }

    def edit(LinkShare linkShareInstance) {
        respond linkShareInstance
    }

    @Transactional
    def update(LinkShare linkShareInstance) {
        if (linkShareInstance == null) {
            notFound()
            return
        }

        if (linkShareInstance.hasErrors()) {
            respond linkShareInstance.errors, view:'edit'
            return
        }

        linkShareInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'LinkShare.label', default: 'LinkShare'), linkShareInstance.id])
                redirect linkShareInstance
            }
            '*'{ respond linkShareInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(LinkShare linkShareInstance) {

        if (linkShareInstance == null) {
            notFound()
            return
        }

        linkShareInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'LinkShare.label', default: 'LinkShare'), linkShareInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'linkShare.label', default: 'LinkShare'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
