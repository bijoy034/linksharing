package com.linksharing

import com.linksharing.co.UserDetailCO
import com.linksharing.dto.UserDetailDTO
import grails.transaction.Transactional
import grails.validation.Validateable
import grails.validation.ValidationException
import org.springframework.web.multipart.MultipartFile

import static org.springframework.http.HttpStatus.CREATED
import static org.springframework.http.HttpStatus.NOT_FOUND

class LoginController {
    def userService
    def topicService
    static allowedMethods = [login: 'POST', register: 'POST', logout: 'GET']


    def index(){[topicList:topicService.listTrendingTopis("today")]}
    def login(String loginid,String password){
        withForm {
            try {
                Map user = userService.login(loginid, password)
                if (user) {
                    session.user = user
                    flash.message = "Hello ${user.username}!"
                    redirect(url: "/dashboard")
                } else {
                    flash.error = "The email/username and password you entered don't match. "
                    redirect(url: "/")
                }
            }catch(Throwable e){
                flash.error = e.getMessage()
                redirect(url: "/")
            }
        }

    }

    def forgot(String email){
        withForm {
            try {
                UserDetail user = userService.isValidEmail(email)
                if (user) {
                    userService.sendPasswordToMail(user)
                    flash.message = "Your password has been sent to your mail!"
                } else {
                    flash.error = "The email id is not registered. "
                }
            }catch(Throwable e){
                flash.error = e.getMessage()
            }
        }
        redirect(url: "/")
    }


    def logout = {
        try {
            Map user = session.user
            flash.message = "Goodbye ${user.username}"
            session.invalidate()
            redirect(url: '/')
        }catch(Throwable e){
            flash.error = e.getMessage()
            redirect(url: '/dashboard')
        }

    }

    def register(UserDetailCO userDetailCOInstance) {
         withForm {
             try {
                 String path = grailsApplication.mainContext.servletContext.getRealPath("images/profile")
                 Map user = userService.register(userDetailCOInstance,path)
                 if(user) {
                     flash.message = "Hallo ${user.username}"
                     session.user = user
                     redirect(url: '/dashboard')
                 }else{
                     flash.message = "Try again"
                     redirect(url:"/")
                 }
             }catch (ValidationException e) {
                 userDetailCOInstance.errors = e.errors
                 flash.put("error-msg", userDetailCOInstance)
                 redirect(url:"/")
             }catch(Throwable e){
                 flash.message = e.getMessage()
                 redirect(url:"/")
             }
         }

    }

}
