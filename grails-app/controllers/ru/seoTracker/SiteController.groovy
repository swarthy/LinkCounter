package ru.seoTracker

import grails.transaction.Transactional
import org.joda.time.DateTime

import static org.springframework.http.HttpStatus.*

@Transactional(readOnly = true)
class SiteController {

    def metricsCollectorService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Site.list(params), model: [siteInstanceCount: Site.count()]
    }

    def show(Site siteInstance) {
        respond siteInstance
    }

    def create(Client client) {
        respond new Site(params), model: [client: client]
    }

    @Transactional
    def save(Site siteInstance) {
        if (siteInstance == null) {
            notFound()
            return
        }

        if (siteInstance.hasErrors()) {
            respond siteInstance.errors, view: 'create'
            return
        }

        siteInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'siteInstance.label', default: 'Site'), siteInstance.url])
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
            respond siteInstance.errors, view: 'edit'
            return
        }

        siteInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Site.label', default: 'Site'), siteInstance.url])
                redirect siteInstance
            }
            '*' { respond siteInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Site siteInstance) {

        if (siteInstance == null) {
            notFound()
            return
        }

        siteInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Site.label', default: 'Site'), siteInstance.url])
                redirect controller: "Client", action: "show", id: siteInstance.client.id
            }
            '*' { render status: NO_CONTENT }
        }
    }

    @Transactional
    def saveState(Site site) {
        if (site == null) {
            notFound()
            return
        }
        def tcy = metricsCollectorService.getTcy(site)
        def pr = metricsCollectorService.getPR(site)
        def state = new SiteState(pr: pr, tcy: tcy, site: site, dateCreated: DateTime.now())
        state.save()
        redirect action: 'show', id: site.id
        //render ([tcy] as JSON)
        //render([tcy.toInteger(), pr] as JSON)
    }

    def sendStatsToClient(Site site) {
        def state = site.getLastStatesDiff()
        sendMail {
            async true
            to site.client.email
            subject String.format("SEO Tracker: Site: %s stats", site.url)
            body String.format("PageRank: %d, тИЦ: %d", state.prLast, state.tcyLast)
        }
        flash.message = message(code: 'seotracker.reportEmailSent', args: [site.client.email])
        redirect action: 'show', id: site.id
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'siteInstance.label', default: 'Site'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
