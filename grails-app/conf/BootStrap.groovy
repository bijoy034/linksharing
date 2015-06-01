import com.linksharing.Author
import com.linksharing.UserDetail

class BootStrap {

    def init = { servletContext ->

       /* (1..10).each{
            new Author(name: "Ma" + "${it}").save(flush: true,failOnError: true)
        }

        (1..4).each {
            new UserDetail(email: "bijoy${it}@gmail.com",username: "sdf",password: "asd",firstName: "sda",lastName: "asd").save(flush: true,failOnError: true)
        }
*/

    }
    def destroy = {
    }
}
