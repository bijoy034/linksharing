package com.linksharing

import com.linksharing.Seriousness
import com.linksharing.Topic

class Subscription {

    Seriousness seriousness
    Date dateCreated

    static belongsTo = [topic:Topic,userDetail:UserDetail]
    static mapping = {

        sort(dateCreated: 'desc')
    }
    static constraints = {
        topic (unique: 'userDetail')
        userDetail()
        seriousness()
        dateCreated(format:'yyyy-MM-dd')
    }

    static namedQueries = {
        trendingTopics{ Date date = null ->
            projections {
                count("topic","countTopic")
                "topic"{
                    count("resource","countResource")
                    groupProperty("resource")
                }
                groupProperty("topic")
                order("countResource","desc")
                order("countTopic","desc")
            }
            if(date){
//                between("dateCreated",date.clearTime(),new Date())
                ge("dateCreated",date.clearTime())
                le("dateCreated",new Date())
            }
        }
    }
}
