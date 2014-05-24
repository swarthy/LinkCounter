package ru.linkcounter

class Project {
    String title
    static constraints = {
        title blank: false
    }
    static belongsTo = [client: Client]
    static hasMany = [sites: Site]

}
