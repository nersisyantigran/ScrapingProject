package scrapingproject

import grails.validation.ValidationException
import org.openqa.selenium.json.Json

import static org.springframework.http.HttpStatus.*
import org.jsoup.*;
import org.jsoup.nodes.*;
import org.jsoup.select.*;

class ScrapedDataController {

    ScrapedDataService scrapedDataService
    WebScrapService webScrapService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
//        def data = webScrapService?.scrapFromStaff(params?.searchedWord)
//        data = data.html()

//        respond scrapedDataService.list(params), model:[scrapedDataCount: scrapedDataService.count(), data:data]
        respond scrapedDataService.list(params), model:[scrapedDataCount: scrapedDataService.count()]
    }
    def search(Integer max) {
        respond scrapedDataService.list(params), model:[scrapedDataCount: scrapedDataService.count()]
    }
    def searchResults(Integer max) {
//        def data = webScrapService?.scrapChartDataFromStaff()
//        def keysArr = data.keysArr.toString()
//        def valuesArr = data.valuesArr.toString()
//        respond scrapedDataService.list(params), model:[scrapedDataCount: scrapedDataService.count(), keysArr:keysArr, valuesArr:valuesArr]

        def data = webScrapService?.scrapFromStaff(params?.searchedWord)
        data = data.html()

        respond scrapedDataService.list(params), model:[scrapedDataCount: scrapedDataService.count(), data:data]
    }

    def dataGraphic(Integer max) {
        def byWhat = params.byWhat
        def data = webScrapService?.scrapChartDataFromStaff(byWhat)
        def keysArr = data.keysArr.toString()
        def valuesArr = data.valuesArr.toString()
        respond scrapedDataService.list(params), model:[scrapedDataCount: scrapedDataService.count(), keysArr:keysArr, valuesArr:valuesArr]
    }


    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'scrapedData.label', default: 'ScrapedData'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
