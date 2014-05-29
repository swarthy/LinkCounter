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
        email email: true, unique: true, blank: false
        phone nullable: true, blank: true
        city nullable: true, blank: true
        info nullable: true, blank: true
        icq nullable: true, size: 6..9
    }
}
