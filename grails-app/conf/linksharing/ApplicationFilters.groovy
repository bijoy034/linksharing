package linksharing

class ApplicationFilters {

    def filters = {

        beforeLogin(controller: '(userDetail|subscription|resource)') {
            before = {
                if (!session.user) {
                    redirect(url: "/")
                    return false
                }
            }
            after = {
                println "<====================================Rendering view=========================================================>"
            }

        }

        afterLogin(uri: '/') {
            before = {
                if (session.user) {
                    println "Filter start"
                    redirect(url:"/dashboard")
                    //return false
                }
            }
        }
    }
}
