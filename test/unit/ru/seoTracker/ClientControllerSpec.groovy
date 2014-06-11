package ru.seoTracker


import grails.test.mixin.*
import spock.lang.*

@TestFor(ClientController)
@Mock(Client)
class ClientControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        params["name"] = "name"
        params["surname"] = "surname"
        params["patronymic"] = "patron"
        params["email"] = "email@mail.ru"
        params["city"] = "city"
        params["phone"] = "534534534"
        params["info"] = "some.."
        params["icq"] = 123456

        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.clientInstanceList
        model.clientInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.clientInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        def client = new Client()
        client.validate()
        controller.save(client)

        then: "The create view is rendered again with the correct model"
        model.clientInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        client = new Client(params)

        controller.save(client)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/client/show/1'
        controller.flash.message != null
        Client.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def client = new Client(params)
        controller.show(client)

        then: "A model is populated containing the domain instance"
        model.clientInstance == client
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def client = new Client(params)
        controller.edit(client)

        then: "A model is populated containing the domain instance"
        model.clientInstance == client
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/client/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def client = new Client()
        client.validate()
        controller.update(client)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.clientInstance == client

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        client = new Client(params).save(flush: true)
        controller.update(client)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/client/show/$client.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/client/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def client = new Client(params).save(flush: true)

        then: "It exists"
        Client.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(client)

        then: "The instance is deleted"
        Client.count() == 0
        response.redirectedUrl == '/client/index'
        flash.message != null
    }
}
