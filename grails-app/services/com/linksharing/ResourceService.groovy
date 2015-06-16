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

    Resource rateResource(Long resourceId,Integer score, Map user){
        if(score){
            Resource resource = Resource.load(resourceId)
            UserDetail userDetail = UserDetail.load(user?.id)
            ResourceRating rating = getRating(resource,userDetail)
            if(!rating){
                //insert
                rating = new ResourceRating(resource:resource,userDetail:userDetail)
            }
            rating.score = score
            if (rating.save(flush: true)) {
                return resource
            } else {
                throw new ValidationException("Invalid Data",rating.errors)
            }
        }
        null
    }

    ResourceRating getRating(Resource resource,UserDetail userDetail){
        ResourceRating rating = ResourceRating.findByResourceAndUserDetail(resource,userDetail)
    }

    Double getAvgRating(Resource resource){
            ResourceRating.createCriteria().get {
                projections{
                    avg("score")
                }
                eq("resource",resource )
            }
    }

    LinkShare shareLink(LinkShare linkShareInstance,Map user){
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

    DocumentResource shareDocument(DocumentResourceCO documentsResourceInstanceCO,Map user, String fileLocation){
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
