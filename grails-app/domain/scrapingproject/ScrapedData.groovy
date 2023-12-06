package scrapingproject

class ScrapedData {
    String searchedKey
    String jobTitle
    String companyName
    String deadline
    String location
    Date archiveDate

    static constraints = {
        jobTitle(nullable: false)
        companyName(nullable: false)
        deadline(nullable: false)
        location(nullable: false)
        searchedKey(nullable: true)
        archiveDate(nullable: false)
    }
}