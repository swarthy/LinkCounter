package ru.linkcounter

class Site {

    String url

    static constraints = {
        url blank: false, url: true
    }

    static hasMany = [keywords: Keyword]
    static belongsTo = [project: Project]
}
