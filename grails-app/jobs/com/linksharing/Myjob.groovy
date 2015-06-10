package com.linksharing



class Myjob {
    static triggers = {
      simple repeatInterval: 5000l // execute job once in 5 seconds
    }

    def execute() {
        println("Test")
    }
}
