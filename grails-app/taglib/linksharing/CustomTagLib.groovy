package linksharing

class CustomTagLib {
    static defaultEncodeAs = [taglib:'html']
    //static encodeAsForTags = [tagName: [taglib:'html'], otherTagName: [taglib:'none']]

    static namespace = "custom"

    def myFirstTag={attrs,body->
        out>>attrs.firstName+" "+attrs.lastName

    }
}
