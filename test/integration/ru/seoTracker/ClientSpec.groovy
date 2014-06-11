package ru.seoTracker

import grails.test.mixin.Mock
import spock.lang.Specification

/**
 *
 */
@Mock(Client)
class ClientSpec extends Specification {

    def setup() {
    }

    def cleanup() {
    }

    void "Test toJSONarray"() {
        when:
        def client = new Client(name: "s", surname: "s", patronymic: "s", phone: "s", info: "s", icq: 1, email: "s@s.ru", city: "s")
        then:
        client.toJSONArray().toString() == '[s, s, s, s@s.ru, s, s, 1, null]'
        client.toString() == 's s s'
    }
}
