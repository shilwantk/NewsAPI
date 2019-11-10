//
//  ViewController.swift
//  json
//
//  Created by Esha Gundeti on 22/09/19.
//  Copyright © 2019 Felix Felicis. All rights reserved.
//

import UIKit
import SideMenu

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    
    //initial table view with country set to the user prefernces and category set to general
    var allReports = [SingleReport]()
    var count : Int = 0
    var selectedCountry = String()
    
    //for segue to the ContentVC
    var selectedRow : Int = 0
    
    //to store the category selected by the user from the SideVC
    var category = String()
    var backFromOptions = false
    
    //components for url session
    var components = URLComponents()
    
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting resizeable table views
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        self.navigationController?.isNavigationBarHidden = true
        
        self.setURL()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.setURL()
    }
    
    func setURL() {
        
        self.components.scheme = "https"
        self.components.host = "newsapi.org"
        self.components.path = "/v2/top-headlines"
        
        if backFromOptions {
            self.components.queryItems = [URLQueryItem(name: "country", value: "us"),
                                          URLQueryItem(name: "category", value: self.category)]
            
            backFromOptions = !backFromOptions
            self.downloadTask()
            
        } else {
            self.components.queryItems = [URLQueryItem(name: "country", value: "us"),
                                          URLQueryItem(name: "category", value: "general")]
            self.downloadTask()
        }
    }
    
    func downloadTask() {
        
        let url = self.components.url
        
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["X-Api-Key" : "d88af395776d46f1854950766990cec3"]
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil, response != nil else {
                print("error in downloading")
                return
            }
            print("data recieved")
            do {
                let decoder = JSONDecoder()
                let downloadedArticles = try decoder.decode(Articles.self, from: data)

                self.count = downloadedArticles.totalResults
                self.allReports = downloadedArticles.articles
                
                //updating table view in main thread
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            } catch {
                print("error in decoding")
            }
        }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ArticleCell else { return UITableViewCell() }
        
        if let title = self.allReports[indexPath.row].title {
            cell.titleLabel.text = self.allReports[indexPath.row].title!
        } else {
            print("error")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedRow = indexPath.row
        performSegue(withIdentifier: "content", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ContentViewController {
            let vc = segue.destination as? ContentViewController
            vc?.singleReport = [self.allReports[self.selectedRow]]
        }
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        performSegue(withIdentifier: "search", sender: nil)
    }

    @IBAction func unwindSegue(_ sender: UIStoryboardSegue){ }
}
