package ru.linkcounter



class MetricsUpdaterJob {
    static triggers = {
      simple startDelay: 60000, repeatInterval: 3600000 // execute job once in one hour
    }

    def execute() {
        // execute job
        println("MetricsUpdaterJob execution! TODO");
    }
}
