package com.linksharing

import com.linksharing.co.UserDetailCO
import grails.transaction.Transactional
import grails.validation.Validateable
import grails.validation.ValidationException
import org.springframework.web.multipart.MultipartFile

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND

class LoginController {
    def userService
    static allowedMethods = [login: 'POST', register: 'POST', logout: 'GET']

    def index() {
        //forward( action:"login")
    }

    def login(String loginid,String password){
        withForm {
            try {
                UserDetail user = userService.login(loginid, password)
                if (userService.login(loginid, password)) {
                    session.user = user
                    flash.message = "Hello ${user.firstName + " " + user.lastName}!"
                } else {
                    flash.error = "The email/username and password you entered don't match. "
                }
            }catch(Throwable e){
                flash.error = e.getMessage()
            }
        }
    }


    def logout = {
        try {
            UserDetail user = session.user
            flash.message = "Goodbye ${user.username}"
            session.invalidate()
        }catch(Throwable e){
            flash.error = e.getMessage()
        }
        redirect(url: '/')
    }

    @Transactional
    def register(UserDetailCO userDetailCOInstance) {
         withForm {
             try {
                 String path = grailsApplication.mainContext.servletContext.getRealPath("images/profile")
                 UserDetail user = userService.register(userDetailCOInstance,path)
                 if(user) {
                     flash.message = "Hallo ${user.username}"
                     session.user = user
                     render(view: '/userDetail/dashboard')
                 }else{
                     flash.message = "Try again"
                     render(view: 'index')
                 }
             }catch (ValidationException e) {
                 userDetailCOInstance.errors = e.errors
                 flash.put("error-msg", userDetailCOInstance)
                 render(view: 'index')
             }catch(Throwable e){
                 flash.message = e.getMessage()
                 render(view: 'index')
             }
         }

    }

}
