package com.linksharing

import com.linksharing.co.DocumentResourceCO
import grails.transaction.Transactional
import grails.validation.ValidationException

@Transactional
class ResourceService {
    def fileService

    @Transactional(readOnly = true)
    Resource showResource(Resource resourceInstance) {
        Resource.get(resourceInstance.id)
    }

    LinkShare shareLink(LinkShare linkShareInstance,UserDetail user){
        ReadingItem item = new ReadingItem(userDetail: user?.id,isRead: true)
        linkShareInstance.addToReadingItem(item)
        if (linkShareInstance.hasErrors()) {
            throw new ValidationException("Invalid Data",linkShareInstance.errors)
        } else if (linkShareInstance.save(flush: true)) {
            return linkShareInstance
        } else {
            throw new ValidationException("Invalid Data",linkShareInstance.errors)
        }
        return null
    }

    DocumentResource shareDocument(DocumentResourceCO documentsResourceInstanceCO,UserDetail user, String fileLocation){
        ReadingItem item = new ReadingItem(userDetail: user?.id,isRead: true)
        DocumentResource documentsResourceInstance = new DocumentResource(documentsResourceInstanceCO)
        documentsResourceInstance.addToReadingItem(item)
        if (documentsResourceInstanceCO.hasErrors()) {
            throw new ValidationException("Invalid Data",documentsResourceInstanceCO.errors)
        } else if (documentsResourceInstance.validate()) {
            if(fileService.upload(documentsResourceInstanceCO.filePath,fileLocation)) {
                documentsResourceInstance.save(flush: true)
                return documentsResourceInstance
            }
        } else {
            throw new ValidationException("Invalid Data",documentsResourceInstance.errors)
        }
        return null
    }
}
