class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view: "index")
        "500"(view:'/error')
        "/subscription"(controller: "subscription",action: "list")
        "/topic"(controller: "topic",action: "list")
        "/userDetail"(controller: "userDetail",action: "dashboard")
        "/dashboard"(controller: "userDetail",action: "dashboard")
	}
}
