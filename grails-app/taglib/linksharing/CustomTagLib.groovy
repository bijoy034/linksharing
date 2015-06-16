package linksharing

import com.linksharing.DocumentResource
import com.linksharing.LinkShare
import com.linksharing.Resource
import com.linksharing.ResourceRating
import com.linksharing.UserDetail

class CustomTagLib {
    def resourceService
    static defaultEncodeAs = "raw"
     //static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "c"

    def postTime={attrs,body->
        Date date1 = new Date()
        def duration
        use(groovy.time.TimeCategory) {
            duration = date1 - attrs.post?.dateCreated
        }
        if(duration.days > 0){
            out << "<img src=\"${assetPath(src: 'placeholders/clock.png')}\" /> " + new java.text.SimpleDateFormat(attrs.format).format(attrs.post?.dateCreated)
        }
        else if(duration.hours > 5){
            out << "<img src=\"${assetPath(src: 'placeholders/clock.png')}\" /> today"
        }else if(duration.hours <= 5 && duration.hours > 0){
            out << "<img src=\"${assetPath(src: 'placeholders/clock.png')}\" /> " + duration.hours + " hr before"
        }else if(duration.minutes > 5 && duration.minutes <= 59){
            out << "<img src=\"${assetPath(src: 'placeholders/clock.png')}\" /> " + duration.minutes + " mnt before"
        }else {
            out << "<img src=\"${assetPath(src: 'placeholders/clock.png')}\" /> just now"
        }

    }

    def subscribeLink={attr,body->

        if(attr.topic.createdBy.id != attr.user?.id){
            if(attr.topic.subscription.userDetail.id.flatten().contains(attr.user?.id)){
                out <<  g.link(controller:"subscription",action:"remove",params: ['topic_id':attr.topic.id]){"Unsubscribe"}
            }else{
                out << g.link(controller:"subscription",action:"save",params: ['topic_id':attr.topic.id] ){"Subscribe"}
            }
        }
    }
    def selectUserVisibility={attr,body->
        if(attr.topic.createdBy.id == attr.user?.id){
            out << g.select(class: "select",name: "topic.visibility",from: com.linksharing.Visibility,value: attr.topic.visibility,required: "required")
        }
    }
    def selectSubscriptionSeriousness={attr,body->
        if(attr.topic.subscription.userDetail.id.flatten().contains(attr.user?.id)){
            out << g.select(class: "select",name: "seriousness",from: com.linksharing.Seriousness,value: attr.topic.subscription.find{it.userDetail.id == attr.user.id}?.seriousness,required: "required")
            out << g.field(type: "hidden",name : "id", value :attr.topic.subscription.find{it.userDetail.id == attr.user?.id}?.id)
        }
    }

    def updateTopicLink={attr,body->
        if(attr.topic.createdBy.id == attr.user?.id){
            out <<  """<a href="#" class="edit-topic"><img src="${assetPath(src: 'placeholders/editor.png')}" /></a>"""
            out <<  """<a href="#" ><img src="${assetPath(src: 'placeholders/trash.png')}" /></a>"""
        }
    }

    def updateTopicForm={attr,body->
        if(attr.topic.createdBy.id == attr.user?.id){
            out <<  """ <tr class="entry-content edit-text" style="display: none;">
                            <th colspan="2">
                                ${g.textField(name: "topic.name",value:attr.topic.name)}
                            </th>
                            <th>
                                ${g.submitButton(name: "editTopic",value:"Save",class:"form-input-button-blue" )}
                            </th>
                            <th>
                                <input type="reset" value="Cancel" class="form-input-button-blue"/>
                            </th>
                       </tr>"""

        }
    }


    def editViewOption={attr,body->
        out << """<div style="height:30px;">
                   <div class="modify-post">"""
        LinkShare link = LinkShare.get(attr.post.id)
        DocumentResource doc = DocumentResource.get(attr.post.id)
        if(attr.editPost == "show") {
            if (attr.post.createdBy.id == attr.user?.id) {
                out << """<a href="#" >Delete</a>
                       <a href="#" >Edit</a>"""
            }
        }
        if(attr.viewLink != "hide"){
            out << g.link(controller: "topic",action: "resource",id: attr.post.id){"View Post"}
        }
        if(attr.post.topic.subscription.userDetail.id.flatten().contains(attr.user?.id)){
            if(!attr.post.readingItem*.userDetail.id.contains(attr.user?.id)){
                out << g.link(controller: "subscription",action: "read",id:link?link.id:(doc?doc.id:"")){"Mark as read"}
            }else{
                out << g.link(controller: "subscription",action: "unRead",id:link?link.id:(doc?doc.id:"")){"Mark as unread"}
            }
        }
        if(link){
            out << """<a href="${link.url}" target="_blank">View full site</a>"""
        }else if(doc){
            out << g.link(controller: "topic",action:"downloadDoc",id: doc.id , target:"_blank"){"Download"}
        }
        out << """</div>
                 </div>"""

    }

    def ratingOption={attr,body->
        out << """<div style="float: right;  margin-right: 15px;">"""
        if(attr.user) {
            UserDetail userDetail = UserDetail.load(attr.user?.id)
            ResourceRating rating = resourceService.getRating(attr.resource,userDetail)
            out << """<p style="text-align: center;  margin-bottom: 0;" id="rateLabel${attr.resource?.id}">${
                rating ? "Your rate for this post" : "Rate this post"
            }</p>
                      <span class="starRating" style=" width: 111px;">"""
            (5..1).each {
                out << """<input class="rating" id="rating${it}_${attr.resource?.id}" type="radio" name="rating_${attr.resource?.id}" value="${it}" ${
                    rating && rating?.score == it ? "checked" : ""
                }>
                      <label for="rating${it}_${attr.resource?.id}" >${it}</label>"""
            }
            out << "</span>"
            out << "<input type='hidden' id='rating' value=\"${createLink(controller: "ajax", action: "rateResource")}\"/>"
            out << "<input type='hidden' class='resourceId' value=\"${attr.resource?.id}\"/>"
        }
        out << "</div>"
    }

    def avgRatingLabel={attr,body->
        Double avgRate = resourceService.getAvgRating(attr.post)
        String msg = ""
        if (avgRate) {
            msg = """<div class="rate">
                    <span>${avgRate}</span>
                    </div>"""
        }
        out << msg
    }

    def resourceCreatedByDetail={attr, body ->
        out << """<div class="entry-thumb" >
                        <a href="#" >
                        <img src="${resource(dir: 'images/profile', file: "${attr.resource.createdBy.photo ?: 'user.png'}")}" alt=""/>
                        </a>
                    </div>
                    <div class="entry-content" style="float: left;">
                        <h4 class="entry-title">
                            <a href="#" style="font-size: 14px;">${attr.resource.createdBy.firstName + " " + attr.resource.createdBy.lastName}</a>
                            <br>
                            <label style="color:#B2B2B2;display: inline;">@${attr.resource.createdBy.username}</label>
                         </h4>
                </div>"""
    }

    def sharingOptions = {attr, body ->
        out << """<div style="float: right;">
                        <p style="text-align: center;  margin-bottom: 0;">Share</p>
                        <span class="entry-date" style="float: right">
                            <a href="#"> <img src="${assetPath(src: "placeholders/facebook-icon.png")}" alt="" /></a>
                                <a href="#"><img src="${assetPath(src: "placeholders/Linkedin.png")}" alt="" /></a>
                            <a href="#"><img src="${assetPath(src: "placeholders/googleplus.png")}" alt="" /></a>
                        </span>
                </div>"""
    }

    def viewResource={attr, body->
        out << """<div style=" height: 30px;">
                        <div style="float: left;">
                            <a href="#" style="font-size:20px;">${attr.resource.topic.name}</a>
                        </div>
                        <div id="avgRatingBody${attr.resource.id}">
                            ${c.avgRatingLabel(post:attr.resource )}
                        </div>
                    </div>
                    <p class="entry-description" style="max-height: none;overflow: auto;">${attr.resource.description}</p>
                    <div style="height:25px;">
                        <label style="color:#B2B2B2;display: inline;float: left">
                        ${c.postTime(post:attr.resource,format:"MMMM dd, yyyy")}
                        </label>
                     </div>"""
    }
}
