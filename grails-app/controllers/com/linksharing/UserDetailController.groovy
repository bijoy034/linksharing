package com.linksharing

import com.linksharing.co.UserDetailCO
import com.linksharing.co.UserPasswordCO
import com.linksharing.co.UserProfileCO
import grails.validation.ValidationException

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
    def user(UserDetail userDetailInstance,Integer max){
        params.max = Math.min(max ?: 10, 100)
        userService.userProfile(userDetailInstance,params)
    }
    def profile(Integer max){
        println "Profile reached"
        params.max = Math.min(max ?: 10, 100)
        userService.profile(session.user as Map,params)
    }
    def updateProfile(UserProfileCO profileCO) {
        withForm {
            try {
                String path = grailsApplication.mainContext.servletContext.getRealPath("images/profile")
                Map user = userService.updateProfile(profileCO,path)
                if(user) {
                    flash.message = "Information updated"
                    session.user.photo = user.photo
                    session.user.username = user.username
                }else{
                    flash.message = "Try again"
                }
            }catch (ValidationException e) {
                profileCO.errors = e.errors
                flash.put("error-msg", profileCO)
            }catch(Throwable e){
                flash.message = e.getMessage()
            }
        }
        redirect(url: '/profile')
    }

    def updatePassword(UserPasswordCO passwordCO) {

        withForm {
            try {
                if(userService.updatePassword(passwordCO)) {
                    flash.message = "Password Changed"
                }else{
                    flash.message = "Try again"
                }
            }catch (ValidationException e) {
                passwordCO.errors = e.errors
                flash.put("error-msg-pw", passwordCO)
            }catch(Throwable e){
                flash.message = e.getMessage()
            }
        }
        redirect(url: '/profile')


    }




}
