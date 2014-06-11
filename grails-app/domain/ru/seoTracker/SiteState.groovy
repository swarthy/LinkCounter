package ru.seoTracker

import org.joda.time.DateTime

class SiteState {
    Integer pr
    Integer tcy
    DateTime dateCreated
    static constraints = {
    }
    static mapping = {
        autoTimestamp false
    }
    static belongsTo = [site: Site]
}
