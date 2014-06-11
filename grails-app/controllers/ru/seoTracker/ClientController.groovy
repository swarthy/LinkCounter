package ru.seoTracker

import grails.converters.JSON
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class ClientController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Client.list(params), model: [clientInstanceCount: Client.count()]
    }

    def list(Integer max) {
        render([data: Client.list().collect { it.toJSONArray() }] as JSON)
    }

    def show(Client clientInstance) {
        respond clientInstance
    }

    def create() {
        respond new Client(params)
    }

    @Transactional
    def save(Client clientInstance) {
        if (clientInstance == null) {
            notFound()
            return
        }

        if (clientInstance.hasErrors()) {
            respond clientInstance.errors, view: 'create'
            return
        }

        clientInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'clientInstance.label', default: 'Client'), clientInstance.surname])
                redirect clientInstance
            }
            '*' { respond clientInstance, [status: CREATED] }
        }
    }

    def edit(Client clientInstance) {
        respond clientInstance
    }

    @Transactional
    def update(Client clientInstance) {
        if (clientInstance == null) {
            notFound()
            return
        }

        if (clientInstance.hasErrors()) {
            respond clientInstance.errors, view: 'edit'
            return
        }

        clientInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Client.label', default: 'Client'), clientInstance.surname])
                redirect clientInstance
            }
            '*' { respond clientInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Client clientInstance) {

        if (clientInstance == null) {
            notFound()
            return
        }

        clientInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Client.label', default: 'Client'), clientInstance.surname])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'clientInstance.label', default: 'Client'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
