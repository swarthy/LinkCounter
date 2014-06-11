import org.joda.time.DateTime
import ru.seoTracker.*

class BootStrap {

    final int clientsCount = 50
    final int sitesCount = 1
    final int statesCount = 5


    def metricsCollectorService
    Random rand = new Random()
    def init = { servletContext ->
        environments {
            development {
                metricsCollectorService.init()
                createTestData()
            }
            production {
                metricsCollectorService.init()
                createTestData()
            }
        }
    }
    def destroy = {
    }

    def createTestData() {

        createUsers()



        def client1 = new Client(name: 'Ivan', surname: 'Antonov', patronymic: 'Petrovich', email: 'horroshow@mail.ru', phone: 89225533222, icq: 123456).save(failOnError: true, flush: true);

        def site11 = new Site(url: 'http://www.osu.ru', client: client1).save(failOnError: true, flush: true);
        def site12 = new Site(url: 'http://google.ru', client: client1).save(failOnError: true, flush: true);
        def site13 = new Site(url: 'http://ya.ru', client: client1).save(failOnError: true, flush: true);

        def site21 = new Site(url: 'http://www.phlagman.com', client: client1).save(failOnError: true, flush: true);
        def site22 = new Site(url: 'http://www.youtube.com', client: client1).save(failOnError: true, flush: true);

        createStates(site11)
        createStates(site12)
        createStates(site13)

        createStates(site21)
        createStates(site22)

        createClients()
    }

    def createClients() {
        for (int i = 0; i < clientsCount; i++) {
            def client = new Client(name: 'client' + (i + 1), surname: 'client' + (i + 1), patronymic: 'client' + (i + 1), email: 'client' + (i + 1) + '@fake.com', phone: rand.nextInt(999999), icq: rand.nextInt(999999999))
            client.save(failOnError: true, flush: true)
            createSites(client)
        }
    }

    def createSites(Client client) {
        for (int i = 0; i < sitesCount; i++) {
            def site = new Site(url: String.format("http://%ssite%d.com", client.surname, i), client: client)
            site.save(failOnError: true, flush: true)
            createStates(site)
        }
    }

    def createStates(Site site) {
        for (int i = 0; i < statesCount; i++) {
            new SiteState(pr: rand.nextInt(10), tcy: rand.nextInt(160000), site: site, dateCreated: DateTime.now().minusDays(i + 1)).save(flush: true, failOnError: true);
        }
    }

    def createUsers() {
        def adminRole = new UserRole(authority: 'ROLE_ADMIN').save(flush: true)

        def admin = new User(username: 'admin', password: 'admin')
        admin.save(flush: true)
        UserUserRole.create admin, adminRole, true
    }
}
