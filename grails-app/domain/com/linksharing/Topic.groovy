package com.linksharing

class Topic {
    String name
    Visibility visibility
    Date dateCreated
    Date lastUpdated
    static belongsTo = [createdBy:UserDetail]
    static hasMany = [subscription:Subscription,resource:Resource]
    static mapping = {
        /*sort lastUpdated: 'desc'
        subscription fetch: 'join'*/
    }
    static constraints = {

        name(unique: 'createdBy')
        visibility()
        dateCreated(format:'yyyy-MM-dd')
        lastUpdated(format:'yyyy-MM-dd')
        resource nullable: true
    }
    static namedQueries = {
        listTopic {Long userId = 0 ->

           /* or{     // duplicate entry shows due to using OR condition with offset and max
                eq("visibility",Visibility.Public)
                if(userId != 0) {
                    "subscription" {
                        eq("userDetail", UserDetail.load(userId))
                    }
                }

            }*/
            projections{
                "subscription" {
                    groupProperty("topic")
                }

            }
            not {
                and{
                    eq("visibility",Visibility.Private)
                    "subscription" {
                        ne("userDetail", UserDetail.load(userId))
                    }

                }
            }
            order("name")

        }
    }
}
