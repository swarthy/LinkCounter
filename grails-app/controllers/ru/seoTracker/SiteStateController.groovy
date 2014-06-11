package ru.seoTracker


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class SiteStateController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SiteState.list(params), model: [siteStateInstanceCount: SiteState.count()]
    }

    def show(SiteState siteStateInstance) {
        respond siteStateInstance
    }

    def create() {
        respond new SiteState(params)
    }

    @Transactional
    def save(SiteState siteStateInstance) {
        if (siteStateInstance == null) {
            notFound()
            return
        }

        if (siteStateInstance.hasErrors()) {
            respond siteStateInstance.errors, view: 'create'
            return
        }

        siteStateInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'siteStateInstance.label', default: 'SiteState'), siteStateInstance.id])
                redirect siteStateInstance
            }
            '*' { respond siteStateInstance, [status: CREATED] }
        }
    }

    def edit(SiteState siteStateInstance) {
        respond siteStateInstance
    }

    @Transactional
    def update(SiteState siteStateInstance) {
        if (siteStateInstance == null) {
            notFound()
            return
        }

        if (siteStateInstance.hasErrors()) {
            respond siteStateInstance.errors, view: 'edit'
            return
        }

        siteStateInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'SiteState.label', default: 'SiteState'), siteStateInstance.id])
                redirect siteStateInstance
            }
            '*' { respond siteStateInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(SiteState siteStateInstance) {

        if (siteStateInstance == null) {
            notFound()
            return
        }

        siteStateInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'SiteState.label', default: 'SiteState'), siteStateInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteStateInstance.label', default: 'SiteState'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
