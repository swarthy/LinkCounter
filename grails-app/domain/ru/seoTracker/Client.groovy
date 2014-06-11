package ru.seoTracker

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
        info nullable: true, blank: true, size: 1..5000
        icq nullable: true, size: 6..9
    }

    static mapping = {
        sites sort: 'url'
    }

    static hasMany = [sites: Site]

    def toJSONArray()
    {
        return [surname, name, patronymic, email, city, phone, icq, id]
    }

    String toString(){
        return String.format("%s %s %s", surname, name, patronymic);
    }
}
