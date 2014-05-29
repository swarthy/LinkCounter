import ru.linkcounter.*
class BootStrap {
    def metricsCollectorService
    Random rand = new Random()
    def init = { servletContext ->
        environments {
            development {
                metricsCollectorService.init()
                createTestData()
            }
            production {}
        }
    }
    def destroy = {
    }
    def createTestData(){
        createClients(40)
        def client1 = new Client(name: 'client', surname: 'client', patronymic: 'client', email:'client@fake.com', phone: 89225533222, icq: 123456).save(failOnError: true, flush: true);

        def project1 = new Project(title: 'Project 1', client: client1).save(failOnError: true, flush: true);
        def project2 = new Project(title: 'Project 2', client: client1).save(failOnError: true, flush: true);

        def site11 = new Site(url: 'http://www.osu.ru', project: project1).save(failOnError: true, flush: true);
        def site12 = new Site(url: 'http://google.ru', project: project1).save(failOnError: true, flush: true);
        def site13 = new Site(url: 'http://ya.ru', project: project1).save(failOnError: true, flush: true);

        def site21 = new Site(url: 'http://www.phlagman.com', project: project2).save(failOnError: true, flush: true);
        def site22 = new Site(url: 'http://www.youtube.com', project: project2).save(failOnError: true, flush: true);
        def site23 = new Site(url: 'http://www.seoanalisys.tk', project: project2).save(failOnError: true, flush: true);

        createStates(20, site11)
        createStates(20, site12)
        createStates(20, site13)

        createStates(20, site21)
        createStates(20, site22)
        createStates(20, site23)

        new Keyword(value: 'Оренбургский Государственный Университет', site: site11).save(failOnError: true, flush: true);
        new Keyword(value: 'Высшее образование', site: site12).save(failOnError: true, flush: true);
        new Keyword(value: 'Обучение', site: site13).save(failOnError: true, flush: true);


    }
    def createClients(int count)
    {
        for(int i=0;i<count;i++)
            new Client(name: 'client'+(i+1), surname: 'client'+(i+1), patronymic: 'client'+(i+1), email:'client'+(i+1)+'@fake.com', phone: 89225533222, icq: 123456).save(failOnError: true, flush: true);
    }
    def createStates(int count, Site site)
    {
        for(int i=0;i<count;i++)
        {
            new SiteState(pr: rand.nextInt(10), tcy: rand.nextInt(160000), site: site).save(flush:true, failOnError: true);
        }
    }
}
