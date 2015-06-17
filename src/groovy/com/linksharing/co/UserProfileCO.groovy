package com.linksharing.co

import com.linksharing.UserDetail
import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile


@Validateable
class UserProfileCO {
    Long userId
    String username
    String firstName
    String lastName
    MultipartFile photo

    void rightShift(UserDetail userDetail){
        userDetail.username = this.username
        userDetail.firstName = this.firstName
        userDetail.lastName = this.lastName
        if(this.photo.originalFilename) {
            userDetail.photo = this.photo.originalFilename
        }
    }

    static constraints = {
        importFrom(UserDetail)
    }

}
