package ru.seoTracker
import grails.transaction.Transactional

@Transactional
class MetricsCollectorService {
    PageRankService pageRankService

    def init() {
        //SAXParserFactory spf = SAXParserFactory.newInstance();
        //spf.setFeature(XMLConstants.FEATURE_SECURE_PROCESSING, true);
        //spf.setFeature("http://apache.org/xml/features/disallow-doctype-decl", false);
        pageRankService = new PageRankService();
    }

    def getTcy(Site site) {
        if (site == null)
            return -1;
        return new XmlSlurper().parse('http://bar-navig.yandex.ru/u?show=31&url=' + site.url).tcy.@value.toInteger()
        //.@rang - количетсво полосок в яндекс баре
    }

    def getPR(Site site) {
        if (site == null)
            return -1;
        if (pageRankService==null)
            pageRankService = new PageRankService();
        return pageRankService.getPR(site.url)
    }
}
