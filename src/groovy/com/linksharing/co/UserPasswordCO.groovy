package com.linksharing.co

import com.linksharing.UserDetail
import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile


@Validateable
class UserPasswordCO {
    Long userId
    String password
    String confirmPassword

    void rightShift(UserDetail userDetail){
        userDetail.password = this.password
    }

    static constraints = {
        confirmPassword validator: { value, user, errors ->
            if (!(value?.equals(user?.password))) {
                errors.rejectValue("confirmPassword", "some.text", "Confirm password must be same as password")
                return false
            }
            return true
        }
        importFrom(UserDetail)
    }

}
