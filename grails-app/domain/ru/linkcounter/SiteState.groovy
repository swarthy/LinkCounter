package ru.linkcounter

class SiteState {
    Integer pr
    Integer tcy
    static constraints = {
    }
    static belongsTo = [site: Site]
}
