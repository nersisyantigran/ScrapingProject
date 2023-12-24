package scrapingproject

import grails.gorm.transactions.Transactional
import org.jsoup.*;
import org.jsoup.nodes.*;
import org.jsoup.select.*
import org.openqa.selenium.json.Json;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Transactional
class WebScrapService {

    def scrapFromStaff(String seaechedWorld) {
        String url = "https://staff.am/en/jobs/categories/index?JobsFilter%5Bkey_word%5D="+seaechedWorld+"#search_list_block";
        def data = Jsoup.connect(url).get().getElementsByClass("web_item_card hs_job_list_item")
        return data
    }
    def scrapChartDataFromStaff(String byWhat) {
        String categoriesUrl = "https://staff.am/en/jobs/categories/index";
        def keysArr = []
        def valuesArr = []
        if (byWhat == "job_city"){
            def data = Jsoup.connect(categoriesUrl).get().getElementById("jobsfilter-job_city").getElementsByTag("label").removeAttr("input");
            data.each {
                keysArr.add(it.childNodes[1].toString().replaceAll("","").replaceAll("\n</en>",""))
                valuesArr.add(it.childNodes[2].toString().replaceAll("<span> \\(","").replaceAll("\\)</span>",""))
            }
            return [keysArr:keysArr,valuesArr:valuesArr]
        } else {
            def data = Jsoup.connect(categoriesUrl).get().getElementById("jobsfilter-category").getElementsByTag("label").removeAttr("input");
            data.each {
                keysArr.add(it.childNodes[1].toString().replaceAll("<en>\n","").replaceAll("\n</en>",""))
                valuesArr.add(it.childNodes[2].attributes.vals[0])
            }
            return [keysArr:keysArr,valuesArr:valuesArr]
        }
    }
}
