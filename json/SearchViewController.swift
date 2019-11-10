//
//  SearchViewController.swift
//  Pods-json
//
//  Created by Esha Gundeti on 22/09/19.
//

import UIKit
import Eureka

class SearchViewController: FormViewController {
    
    var allSources = ["The Washington Times": "the-washington-times", "Fox Sports": "fox-sports", "TalkSport": "talksport", "Mashable": "mirror", "ABC News": "abc-news", "Reuters": "rtl-nieuws", "Recode": "rt", "Google News (Italy)": "google-news-it", "Al Jazeera English": "ansa", "NRK": "new-scientist", "Entertainment Weekly": "espn-cric-info", "Mirror": "mtv-news-uk", "The Sport Bible": "the-sport-bible", "Daily Mail": "daily-mail", "Google News (Israel)": "google-news-is", "ABC News (AU)": "abc-news-au", "RT": "recode", "Associated Press": "associated-press", "Financial Post": "financial-post", "Metro": "mtv-news", "La Gaceta": "la-nacion", "The Globe And Mail": "the-globe-and-mail", "BBC Sport": "bbc-sport", "Next Big Future": "nrk", "ESPN Cric Info": "engadget", "The Huffington Post": "the-huffington-post", "Ynet": "ynet", "ESPN": "el-mundo", "Les Echos": "les-echos", "Le Monde": "lenta", "Focus": "focus", "Fortune": "fortune", "CBC News": "cbc-news", "Handelsblatt": "handelsblatt", "Lenta": "lequipe", "The Next Web": "the-next-web", "Time": "time", "Xinhua Net": "xinhua-net", "RBC": "rbc", "The Times of India": "the-times-of-india", "Google News (Australia)": "google-news-au", "Axios": "axios", "Engadget": "espn", "Hacker News": "hacker-news", "Newsweek": "nhl-news", "InfoMoney": "info-money", "MTV News": "mashable", "BBC News": "bbc-news", "Football Italia": "football-italia", "Ars Technica": "ars-technica", "RTE": "reddit-r-all", "Wired": "wired", "Buzzfeed": "buzzfeed", "Medical News Today": "msnbc", "Politico": "politico", "La Nacion": "la-repubblica", "Marca": "metro", "The Hill": "the-hill", "Google News (Russia)": "google-news-ru", "RTL Nieuws": "reuters", "The Verge": "the-verge", "Die Zeit": "die-zeit", "El Mundo": "entertainment-weekly", "Vice News": "vice-news", "Crypto Coins News": "crypto-coins-news", "Göteborgs-Posten": "gruenderszene", "The Washington Post": "the-washington-post", "Wirtschafts Woche": "wirtschafts-woche", "Australian Financial Review": "australian-financial-review", "Google News (Brasil)": "google-news-br", "FourFourTwo": "four-four-two", "Aftenposten": "al-jazeera-english", "Bild": "bild", "T3n": "t3n", "TechCrunch (CN)": "techcrunch-cn", "Independent": "independent", "MTV News (UK)": "medical-news-today", "Svenska Dagbladet": "svenska-dagbladet", "TechCrunch": "techcrunch", "The American Conservative": "the-american-conservative", "Fox News": "fox-news", "IGN": "ign", "CBS News": "cbs-news", "The Irish Times": "the-irish-times", "News24": "nfl-news", "The Hindu": "the-hindu", "La Repubblica": "le-monde", "Google News (France)": "google-news-fr", "Google News (UK)": "google-news-uk", "Wired.de": "wired-de", "Spiegel Online": "spiegel-online", "New Scientist": "news24", "The Wall Street Journal": "the-wall-street-journal", "Libération": "liberation", "NFL News": "national-review", "National Review": "news-com-au", "The Telegraph": "the-telegraph", "Business Insider (UK)": "business-insider-uk", "Reddit /r/all": "rte", "ANSA.it": "aftenposten", "Gruenderszene": "goteborgs-posten", "Infobae": "infobae", "National Geographic": "new-york-magazine", "Business Insider": "business-insider", "News.com.au": "next-big-future", "SABQ": "sabq", "Google News (Saudi Arabia)": "google-news-sa", "Il Sole 24 Ore": "il-sole-24-ore", "Bloomberg": "bloomberg", "Blasting News (BR)": "blasting-news-br", "Ary News": "ary-news", "USA Today": "usa-today", "New York Magazine": "newsweek", "Argaam": "argaam", "L\'equipe": "la-gaceta", "Globo": "globo", "NBC News": "national-geographic", "Google News (Canada)": "google-news-ca", "Bleacher Report": "bleacher-report", "Google News (India)": "google-news-in", "Google News (Argentina)": "google-news-ar", "Breitbart News": "breitbart-news", "CNBC": "cnbc", "Polygon": "polygon", "CNN Spanish": "cnn-es", "Google News": "google-news", "MSNBC": "marca", "CNN": "cnn", "NHL News": "nbc-news", "The Jerusalem Post": "the-jerusalem-post", "The Lad Bible": "the-lad-bible", "The New York Times": "the-new-york-times", "Der Tagesspiegel": "der-tagesspiegel", "TechRadar": "techradar"]
    
    var allLanguages = ["Arabic": "ar", "Deustch": "de", "English": "en", "Español": "es", "French": "fr", "Hebrew": "he", "Italian": "it", "Dutch": "nl", "Norwegian": "no", "Portuguese": "pt", "Russian": "ru", "Northern Sami": "se", "Urdu": "ud", "Chinese": "zh"]
    
    var allCountries = ["Argentina" : "ar", "Australia" : "au", "Austria" : "at", "Belgium" : "be", "Brazil" : "br", "Bulgaria" : "bg", "Canada" : "ca", "China" : "cn", "Colombia" : "co", "Cuba" : "cu", "Czech Republic" : "cz", "Egypt" : "eg", "France" : "fr", "Germany" : "de", "Greece" : "gr", "Hong Kong" : "hk", "Hungary" : "hu", "India" : "in", "Indonesia" : "id", "Ireland" : "ie", "Israel" : "il", "Italy" : "it", "Japan" : "jp", "Latvia" : "lv", "Lithuania" : "lt" , "Malaysia" : "my", "Mexico" : "mx", "Morocco" : "ma", "Netherlands" : "nl", "New Zealand" : "nz", "Nigeria" : "ng", "Norway" : "no", "Philippines" : "ph", "Poland": "pl","Portugal": "pt","Romania": "ro","Russia": "ru","Saudi Arabia":"sa","Serbia": "rs","Singapore":"sg","Slovakia": "sk","Slovenia": "si","South Africa": "za","South Korea": "kr","Sweden": "se","Switzerland": "ch","Taiwan":"tw","Thailand": "th","Turkey": "tr","UAE": "ae","Ukraine": "ua","United Kingdom": "gb","United States":"us","Venuzuela":"ve"]
    
    var keywords = String()
    var keyowrdsInTitle = String()
    var excludedKeywords = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        form
        +++ Section("Keyword")
            <<< TextRow(){
                $0.title = "Keywords in articles"
                $0.placeholder = "Enter keywords here."
        }.onChange({ (row) in
            self.keywords = row.value != nil ? row.value! : ""
        })
            
            <<< TextRow(){
                $0.title = "Keyword in title"
                $0.placeholder = "Enter keywords here."
                }.onChange({ (row) in
                    self.keyowrdsInTitle = row.value != nil ? row.value! : ""
                })
            
            <<< TextRow(){
                $0.title = "Exclude keywords"
                $0.placeholder = "Enter the keywords you want to exclude."
                }.onChange({ (row) in
                    self.excludedKeywords = row.value != nil ? row.value! : ""
                })
            
            +++ Section("News Sources")
            <<< MultipleSelectorRow <String>() {
                $0.title = "Source"
                $0.options = self.allSources.map { $0.0 }
                }
                .onPresent { from, to in
                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: from, action: #selector(SearchViewController.multipleSelectorDone(_:)))
        }
            +++ Section("Domains")
            <<< MultipleSelectorRow<String>() {
                $0.title = "Include Domains"
                $0.options = ["bbc.co.uk", "techcrunch.com", "engadget.com"]
                }
                .onPresent { from, to in
                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: from, action: #selector(SearchViewController.multipleSelectorDone(_:)))
        }
            <<< MultipleSelectorRow<String>() {
                $0.title = "Exclude Domains"
                $0.options = ["bbc.co.uk", "techcrunch.com", "engadget.com"]
                }
                .onPresent { from, to in
                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: from, action: #selector(SearchViewController.multipleSelectorDone(_:)))
        }
            +++ Section("Dates")
            <<< DateRow(){
                $0.title = "Date From"
                $0.value = Date(timeIntervalSince1970: 0)
        }
            <<< DateRow(){
                $0.title = "Date To"
                $0.value = Date(timeIntervalSince1970: 0)
        }
            +++ Section("Language")
            <<< MultipleSelectorRow<String>("Lang") { row in
                row.title = "Languages"
                row.options = self.allLanguages.map { $0.0 }
                
                row.onPresent { from, to in
                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: from, action: #selector(SearchViewController.multipleSelectorDone(_:)))
                    }
            }

            +++ Section("Country")
            <<< MultipleSelectorRow<String>() {
                $0.title = "Country"
                $0.options = self.allLanguages.map { $0.0 }
                }
                .onPresent { from, to in
                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: from, action: #selector(SearchViewController.multipleSelectorDone(_:)))
        }
    }
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func processingValues() {
        
        var includeKeywords = form.allRows[0].baseValue
        print(includeKeywords as! String)
    }
}

/*
 var new = "Plants,animals, space"
 var finalQ = [String]()
 var q = String()
 var encoded = String()
 
 override func viewDidLoad() {
 super.viewDidLoad()
 self.set()
 
 /*var pointsArr = new.components(separatedBy: ",")
 var newArr = pointsArr.map {$0.trimmingCharacters(in: .whitespaces)}
 for var item in newArr{
 var add = "+"
 add += item
 print(add)
 self.finalQ.append(add)
 self.q = self.finalQ.joined(separator: ",")
 print(self.q)
 
 var customAllowedSet =  NSCharacterSet(charactersIn:"+-,").inverted
 
 self.encoded = self.q.addingPercentEncoding(withAllowedCharacters: customAllowedSet)!
 //let postData = NSMutableData(data: self.q.data(using: String.Encoding.utf8)!)
 print(encoded)
 }*/
 }
 
 func set() {
 
 var sett = ["Daily Mail", "Google News (Israel)", "The Sport Bible"]
 var arr = [String](sett)
 var Str = sett.joined(separator: ",")
 
 
 print(Str)
 }
 */
