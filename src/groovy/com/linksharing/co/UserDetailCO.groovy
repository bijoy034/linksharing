package com.linksharing.co

import com.linksharing.UserDetail
import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile


@Validateable
class UserDetailCO {
    String email
    String username
    String password
    String confirmPassword
    String firstName
    String lastName
    MultipartFile photo

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
