package scrapingproject

import grails.testing.mixin.integration.Integration
import grails.gorm.transactions.Rollback
import spock.lang.Specification
import org.hibernate.SessionFactory

@Integration
@Rollback
class ScrapedDataServiceSpec extends Specification {

    ScrapedDataService scrapedDataService
    SessionFactory sessionFactory

    private Long setupData() {
        // TODO: Populate valid domain instances and return a valid ID
        //new ScrapedData(...).save(flush: true, failOnError: true)
        //new ScrapedData(...).save(flush: true, failOnError: true)
        //ScrapedData scrapedData = new ScrapedData(...).save(flush: true, failOnError: true)
        //new ScrapedData(...).save(flush: true, failOnError: true)
        //new ScrapedData(...).save(flush: true, failOnError: true)
        assert false, "TODO: Provide a setupData() implementation for this generated test suite"
        //scrapedData.id
    }

    void "test get"() {
        setupData()

        expect:
        scrapedDataService.get(1) != null
    }

    void "test list"() {
        setupData()

        when:
        List<ScrapedData> scrapedDataList = scrapedDataService.list(max: 2, offset: 2)

        then:
        scrapedDataList.size() == 2
        assert false, "TODO: Verify the correct instances are returned"
    }

    void "test count"() {
        setupData()

        expect:
        scrapedDataService.count() == 5
    }

    void "test delete"() {
        Long scrapedDataId = setupData()

        expect:
        scrapedDataService.count() == 5

        when:
        scrapedDataService.delete(scrapedDataId)
        sessionFactory.currentSession.flush()

        then:
        scrapedDataService.count() == 4
    }

    void "test save"() {
        when:
        assert false, "TODO: Provide a valid instance to save"
        ScrapedData scrapedData = new ScrapedData()
        scrapedDataService.save(scrapedData)

        then:
        scrapedData.id != null
    }
}
