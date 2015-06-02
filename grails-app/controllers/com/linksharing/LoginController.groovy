package com.linksharing

class LoginController {

    def index() {
        forward( action:"login")
    }

    def login = {
        if(session.user) {
            redirect( action:"index")
            return false
        }
    }

    def authenticate = {
        def user = EndUser.findByUsernameAndPassword(params.username, params.password)
        if(user){
            session.user = user
            flash.message = "Hello ${user.fullName}!"
            redirect(action:"show", id: user.id)

        }else{
            flash.message = "Sorry, ${params.userName}. Please try again."
            redirect(action:"login")
        }
    }

    def logout = {
        flash.message = "Goodbye ${session.user.firstName}"
        session.user = null
        redirect(action:"login")
    }
    def register() {
        if(session.user) {
            redirect( action:"login")
            return false
        }
        respond new UserDetail(params)
    }


}
