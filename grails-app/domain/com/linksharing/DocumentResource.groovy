package com.linksharing

import org.springframework.web.multipart.MultipartFile

class DocumentResource extends Resource{

    String fileName

    static constraints = {
        fileName nullable: true
        /*filePath validator: { val, doc, errors ->
            if (!(val.contentType in ['image/jpeg', 'image/png', 'image/pjpeg', 'image/gif','image/bmp'])){
                errors.rejectValue( "filePath", "some.text", "Upload only images")
                return false
            }
            return true
        }*/
    }

}
