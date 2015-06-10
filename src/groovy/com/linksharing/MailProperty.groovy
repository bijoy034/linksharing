package com.linksharing

class MailProperty {
    Boolean isMultipart = false
    List<String> to = []
    List<String> cc = []
    List<String> bcc = []
    String subject = "Demo Heading"
    String view = ""
    Map<String,Object> model = [:]
    List<Inline> inlines = []

    void leftShift(Map<String,String> attr){
        this.inlines << new Inline(attr.cid,attr.type,attr.path)
    }

    class Inline {
        String cid
        String contentType
        File path
        Inline(String cid, String contentType, String path){
            this.cid = cid
            this.contentType = contentType
            this.path =  new File("./web-app/${path}")
        }

    }
}
