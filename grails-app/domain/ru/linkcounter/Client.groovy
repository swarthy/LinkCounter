package ru.linkcounter

class Client {

    String name
    String surname
    String patronymic
    String email
    String city
    String phone
    String info
    Integer icq

    static constraints = {
        name blank: false
        surname blank: false
        patronymic blank: false
        email email: true, blank: false
        phone blank: false
        icq nullable: true, size: 6..9
    }
}
