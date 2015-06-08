package com.linksharing

import com.linksharing.co.DocumentResourceCO

class DocumentResource extends Resource{

    String fileName
    DocumentResource(DocumentResourceCO co){
        super(co)
        this.fileName = co.filePath.originalFilename
    }

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
