package com.linksharing

import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND

class LoginController {

    def index() {
        //forward( action:"login")
    }

    def login = {
        def user = UserDetail.findByPasswordAndUsername( params.password,params.loginid)
        if(user){
            session.user = user
            flash.message = "Hello ${user.firstName+" "+user.lastName}!"
           redirect(controller: 'userDetail',action: 'dashboard')

        }else{
            flash.error = "Sorry, ${params.loginid}. Please try again."
            redirect(url: '/')
        }
    }


    def logout = {
        def user = session.user
        flash.message = "Goodbye ${user.username}"
        session.user = null
        redirect(url: '/')
    }

    @Transactional
    def register(UserDetail userDetailInstance) {

        if (userDetailInstance.hasErrors()) {
            flash.put("error-msg",userDetailInstance)
            redirect(action: 'index')
        }else{
                userDetailInstance.save flush:true
                flash.message = "Hallo ${userDetailInstance.username}"
                session.user = userDetailInstance
                redirect(controller: 'userDetail',action: 'dashboard')
        }
    }




}