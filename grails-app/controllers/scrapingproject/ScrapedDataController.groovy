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
        def data = webScrapService?.scrapFromStaff(params?.searchedWord)
        data = data.html()

        respond scrapedDataService.list(params), model:[scrapedDataCount: scrapedDataService.count(), data:data]
    }
    def searchResults(Integer max) {
        def data = webScrapService?.scrapChartDataFromStaff()
        def keysArr = data.keysArr
        def valuesArr = data.valuesArr
        respond scrapedDataService.list(params), model:[scrapedDataCount: scrapedDataService.count(), keysArr:keysArr, valuesArr:valuesArr]
    }

    def show(Long id) {
        respond scrapedDataService.get(id)
    }

    def create() {
        respond new ScrapedData(params)
    }

    def save(ScrapedData scrapedData) {
        if (scrapedData == null) {
            notFound()
            return
        }

        try {
            scrapedDataService.save(scrapedData)
        } catch (ValidationException e) {
            respond scrapedData.errors, view:'create'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'scrapedData.label', default: 'ScrapedData'), scrapedData.id])
                redirect scrapedData
            }
            '*' { respond scrapedData, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond scrapedDataService.get(id)
    }

    def update(ScrapedData scrapedData) {
        if (scrapedData == null) {
            notFound()
            return
        }

        try {
            scrapedDataService.save(scrapedData)
        } catch (ValidationException e) {
            respond scrapedData.errors, view:'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'scrapedData.label', default: 'ScrapedData'), scrapedData.id])
                redirect scrapedData
            }
            '*'{ respond scrapedData, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        scrapedDataService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'scrapedData.label', default: 'ScrapedData'), id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
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
