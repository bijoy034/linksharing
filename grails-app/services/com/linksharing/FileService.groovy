package com.linksharing

import grails.transaction.Transactional
import org.springframework.web.multipart.MultipartFile

import javax.servlet.http.HttpServletResponse

@Transactional
class FileService {

    String upload(MultipartFile file,String location) {
        if(file) {
            file.transferTo(new File("${location}/${file.originalFilename}"))
            return file.originalFilename
        }else{
            return null
        }
    }

    void download(HttpServletResponse response,String fileName, String path){
        File file = new File("${path}/${fileName}")
        response.setHeader("Content-disposition", "attachment; filename=" + file.name)
        // response.contentType = file.ty
        response.contentLength = file.bytes.length
        response.outputStream << file.bytes
    }
}
