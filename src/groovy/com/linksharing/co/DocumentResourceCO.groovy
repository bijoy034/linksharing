package com.linksharing.co

import com.linksharing.Topic
import com.linksharing.UserDetail
import grails.validation.Validateable
import org.springframework.web.multipart.MultipartFile

@Validateable
class DocumentResourceCO extends ResourceCO{
    MultipartFile filePath
}
