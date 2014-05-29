package ru.linkcounter

import grails.converters.JSON
import grails.transaction.Transactional

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class SiteController {

    def metricsCollectorService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Site.list(params), model:[siteInstanceCount: Site.count()]
    }

    def show(Site siteInstance) {
        respond siteInstance
    }

    def create() {
        respond new Site(params)
    }

    @Transactional
    def save(Site siteInstance) {
        if (siteInstance == null) {
            notFound()
            return
        }

        if (siteInstance.hasErrors()) {
            respond siteInstance.errors, view:'create'
            return
        }

        siteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'siteInstance.label', default: 'Site'), siteInstance.id])
                redirect siteInstance
            }
            '*' { respond siteInstance, [status: CREATED] }
        }
    }

    def edit(Site siteInstance) {
        respond siteInstance
    }

    @Transactional
    def update(Site siteInstance) {
        if (siteInstance == null) {
            notFound()
            return
        }

        if (siteInstance.hasErrors()) {
            respond siteInstance.errors, view:'edit'
            return
        }

        siteInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Site.label', default: 'Site'), siteInstance.id])
                redirect siteInstance
            }
            '*'{ respond siteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Site siteInstance) {

        if (siteInstance == null) {
            notFound()
            return
        }

        siteInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Site.label', default: 'Site'), siteInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    def getMetrics(Site site)
    {
        if (site == null) {
            notFound()
            return
        }
        def tcy = metricsCollectorService.getTcy(site)
        def pr = metricsCollectorService.getPR(site)
        //render ([tcy] as JSON)
        render ([tcy.toInteger(), pr] as JSON)
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteInstance.label', default: 'Site'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
