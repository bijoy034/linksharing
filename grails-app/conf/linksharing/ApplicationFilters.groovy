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

        }
//
//        afterLogin(controller: '(userDetail|subscription|resource)',invert:true) {
//            before = {
//                if (session.user) {
//                    redirect(url: '/dashboard')
//                    return false
//                }
//            }
//        }
    }
}
