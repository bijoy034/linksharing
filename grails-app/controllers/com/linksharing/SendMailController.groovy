package com.linksharing

class SendMailController {
    def mailingService
    def mailService
    def index() {
        MailProperty property = new MailProperty()
        property.isMultipart = true
        property.to << "work.bijoypaul@gmail.com"
        property.subject = "Sending Image with logo customized form444852"
        property.view = "/mailingLayouts/forgot"
        property.model = [name: "Bijoy Paul", password: "123456"]
        property << [cid:'logo',type:'image/jpg',path:'images/logo.png']
        property << [cid:'myimage',type:'image/jpg',path:'images/profile/kurkure.jpg']
        println property.dump()
        mailingService.sendMail(property)
    }
}
