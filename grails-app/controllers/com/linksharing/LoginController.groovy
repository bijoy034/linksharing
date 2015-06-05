package com.linksharing

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND

class LoginController {

    def index() {
        //forward( action:"login")
    }

    def login = {
        def user = UserDetail.findByPasswordAndUsername(params.password, params.loginid)
        if (user) {
            session.user = user
            flash.message = "Hello ${user.firstName + " " + user.lastName}!"
            redirect(controller: 'userDetail', action: 'dashboard')

        } else {
            flash.error = "Sorry, ${params.loginid}. Please try again."
            redirect(url: '/')
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

        if (userDetailInstance.hasErrors()) {
            flash.put("error-msg", userDetailInstance)
            redirect(action: 'index')
        } else {
            userDetailInstance.save flush: true
            String path= grailsApplication.mainContext.servletContext.getRealPath("images/profile")
            File image = new File("${path}/${userDetailInstance.username}")
            image.bytes =params.photo.bytes
            flash.message = "Hallo ${userDetailInstance.username}"
            session.user = userDetailInstance
            redirect(controller: 'userDetail', action: 'dashboard')
        }
    }


}