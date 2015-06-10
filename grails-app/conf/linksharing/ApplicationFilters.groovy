package linksharing

class ApplicationFilters {

    def filters = {

        beforeLogin(controller: 'login', action: '*', invert: true) {
            before = {
                if (!session.user) {
                    redirect(url: "/")
                    return false
                }
            }

        }
        afterLogin(controller: 'login', action: 'index') {
            before = {
                if (session.user) {
                    redirect(controller: 'userDetail', action: 'dashboard')
                    return false
                }
            }
        }
    }
}
