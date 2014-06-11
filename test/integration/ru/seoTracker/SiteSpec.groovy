package ru.seoTracker

import grails.test.mixin.Mock
import org.joda.time.DateTime
import spock.lang.Specification

/**
 *
 */
@Mock([Site, Client, SiteState])
class SiteSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Test getLastStatesDiff"() {
        when:
        def site = new Site(url: "http://test.com", client: new Client(name: "name", surname: "s", patronymic: "s", phone: "s", info: "s", icq: 12345, email: "test@mail.ru", city: "s"))
        site.save(flush: true)
        new SiteState(site: site, pr: 10, tcy: 100, dateCreated: DateTime.now()).save(flush: true)
        new SiteState(site: site, pr: 20, tcy: 200, dateCreated: DateTime.now().plusDays(1)).save(flush: true)
        then:
        def res = site.getLastStatesDiff()
        res.tcy == 100
        res.pr == 10
        res.tcyLast == 200
        res.prLast == 20
    }
}
