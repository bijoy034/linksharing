package com.linksharing

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND

class LoginController {

    static allowedMethods = [login: 'POST', register: 'POST', logout: 'GET']

    def index() {
        //forward( action:"login")
    }

    def login = {
        withForm {
            def user = UserDetail.findByPasswordAndUsername(params.password, params.loginid) ?: UserDetail.findByPasswordAndEmail(params.password, params.loginid)
            if (user) {
                session.user = user
                flash.message = "Hello ${user.firstName + " " + user.lastName}!"

            } else {
                flash.error = "The email/username and password you entered don't match. "
            }
        }
    }


    def logout = {
        def user = session.user
        flash.message = "Goodbye ${user.username}"
        session.invalidate()
        redirect(url: '/')
    }

    @Transactional
    def register(UserDetail userDetailInstance) {
        withForm {
            if (userDetailInstance.hasErrors()) {
                flash.put("error-msg", userDetailInstance)
                render(view: 'index')
            } else if (userDetailInstance.save(flush: true)) {
                String path = grailsApplication.mainContext.servletContext.getRealPath("images/profile")
                File image = new File("${path}/${userDetailInstance.username}")
                image.bytes = params.photo.bytes
                flash.message = "Hallo ${userDetailInstance.username}"
                session.user = userDetailInstance
                render(view: '/userDetail/dashboard')
            } else {
                flash.put("error-msg", userDetailInstance)
                redirect(action: 'index')
            }
        }
        //redirect(action: 'index')
    }


}