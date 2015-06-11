package com.linksharing

import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserDetailController {
    def userService

    def index(){}

    def dashboard(){
        println "Dashboard reached"
        try {
            userService.dashboard(session.user as Map)

        }catch (Throwable e){
           flash.error = e.getMessage()
            session.invalidate()
            redirect(url: '/')
        }
    }
    def inbox(){
       // [posts:userService.inbox(session.user as Map)]
        render userService.inbox(session.user as Map)
    }


}
