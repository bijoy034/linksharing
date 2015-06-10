package com.linksharing

import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserDetailController {
    def userService

    def dashboard(){
        try {
            userService.dashboard(session.user as Map)

        }catch (Throwable e){
           flash.error = e.getMessage()
            session.invalidate()
            redirect(url: '/')
        }
    }


}
