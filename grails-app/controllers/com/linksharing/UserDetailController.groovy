package com.linksharing

import grails.transaction.Transactional

class UserDetailController {
    def userService

    def index(){}

    def dashboard(Integer max){
        println "Dashboard reached"
        params.max = Math.min(max ?: 1, 100)
        try {
            userService.dashboard(session.user as Map,params)

        }catch (Throwable e){
           flash.error = e.getMessage()
            session.invalidate()
            redirect(url: '/')
        }
    }
    /*def inbox(){
       // [posts:userService.inbox(session.user as Map)]
        render userService.inbox(session.user as Map)
    }*/


}
