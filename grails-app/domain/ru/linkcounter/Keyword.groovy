package ru.linkcounter

class Keyword {
    String value
    static belongsTo = Site
    static hasMany = [sites: Site]
    static constraints = {
    }
}
