package ru.linkcounter


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class KeywordController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Keyword.list(params), model: [keywordInstanceCount: Keyword.count()]
    }

    def show(Keyword keywordInstance) {
        respond keywordInstance
    }

    def create() {
        respond new Keyword(params)
    }

    @Transactional
    def save(Keyword keywordInstance) {
        if (keywordInstance == null) {
            notFound()
            return
        }

        if (keywordInstance.hasErrors()) {
            respond keywordInstance.errors, view: 'create'
            return
        }

        keywordInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'keywordInstance.label', default: 'Keyword'), keywordInstance.id])
                redirect keywordInstance
            }
            '*' { respond keywordInstance, [status: CREATED] }
        }
    }

    def edit(Keyword keywordInstance) {
        respond keywordInstance
    }

    @Transactional
    def update(Keyword keywordInstance) {
        if (keywordInstance == null) {
            notFound()
            return
        }

        if (keywordInstance.hasErrors()) {
            respond keywordInstance.errors, view: 'edit'
            return
        }

        keywordInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Keyword.label', default: 'Keyword'), keywordInstance.id])
                redirect keywordInstance
            }
            '*' { respond keywordInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Keyword keywordInstance) {

        if (keywordInstance == null) {
            notFound()
            return
        }

        keywordInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Keyword.label', default: 'Keyword'), keywordInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'keywordInstance.label', default: 'Keyword'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
