package ru.seoTracker

import grails.converters.JSON
import org.joda.time.DateTime

class Site {

    String url
    DateTime dateCreated

    static constraints = {
        url blank: false, url: true
    }

    static hasMany = [states: SiteState]
    static belongsTo = [client: Client]

    static mapping = {
        states sort: 'dateCreated', order: 'desc'
    }

    def getStatesJSON() {
        return SiteState.findAllBySite(this, [sort: 'dateCreated', order: 'desc', max: 30]).collect {
            [date: it.dateCreated,
             pr  : it.pr,
             tcy : it.tcy]
        } as JSON
    }

    def getLastStatesDiff() {
        def result = [pr: 0, tcy: 0, prLast: 0, tcyLast: 0]
        def states = SiteState.findAllBySite(this, [sort: 'dateCreated', order: 'desc', max: 2, cache: true])
        if (states.size() > 1) {
            result.pr = states[0].pr - states[1].pr
            result.tcy = states[0].tcy - states[1].tcy
            result.prLast = states[0].pr
            result.tcyLast = states[0].tcy
        }
        return result
    }

    def toJSONArray()
    {
        def diff = getLastStatesDiff()
        return [url, diff.prLast, diff.tcyLast, id]
    }

    String toString() {
        return url
    }
}
