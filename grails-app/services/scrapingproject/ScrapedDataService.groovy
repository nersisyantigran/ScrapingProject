package scrapingproject

import grails.gorm.services.Service

@Service(ScrapedData)
interface ScrapedDataService {

    ScrapedData get(Serializable id)

    List<ScrapedData> list(Map args)

    Long count()

    void delete(Serializable id)

    ScrapedData save(ScrapedData scrapedData)

}