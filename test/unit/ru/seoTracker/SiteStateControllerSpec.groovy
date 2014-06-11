package ru.seoTracker


import grails.test.mixin.*
import org.joda.time.DateTime
import spock.lang.*

@TestFor(SiteStateController)
@Mock([SiteState, Site])
class SiteStateControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        def site = new Site(url: "http://test.com")
        params["site"] = site;
        params["tcy"] = 1000
        params["pr"] = 10
        params["dateCreated"] = DateTime.now()
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.siteStateInstanceList
        model.siteStateInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.siteStateInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        def siteState = new SiteState()
        siteState.validate()
        controller.save(siteState)

        then: "The create view is rendered again with the correct model"
        model.siteStateInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        siteState = new SiteState(params)

        controller.save(siteState)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/siteState/show/1'
        controller.flash.message != null
        SiteState.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def siteState = new SiteState(params)
        controller.show(siteState)

        then: "A model is populated containing the domain instance"
        model.siteStateInstance == siteState
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def siteState = new SiteState(params)
        controller.edit(siteState)

        then: "A model is populated containing the domain instance"
        model.siteStateInstance == siteState
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/siteState/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def siteState = new SiteState()
        siteState.validate()
        controller.update(siteState)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.siteStateInstance == siteState

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        siteState = new SiteState(params).save(flush: true)
        controller.update(siteState)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/siteState/show/$siteState.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/siteState/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def siteState = new SiteState(params).save(flush: true)

        then: "It exists"
        SiteState.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(siteState)

        then: "The instance is deleted"
        SiteState.count() == 0
        response.redirectedUrl == '/siteState/index'
        flash.message != null
    }
}
