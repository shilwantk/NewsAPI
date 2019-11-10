//
//  ContentViewController.swift
//  json
//
//  Created by Esha Gundeti on 22/09/19.
//  Copyright © 2019 Felix Felicis. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    var singleReport = [SingleReport]()
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var contentLabel: UILabel!
    
    @IBOutlet weak var articleURL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("2")
        
        if let title = singleReport[0].title {
            self.titleLabel.text = title
        } else {
            self.titleLabel.text = "Title not found"
        }
        
        if let author = self.singleReport[0].author {
            self.authorLabel.text = "Author : \(author)"
        } else {
            self.authorLabel.text = "Author not found"
        }

        if let date = self.singleReport[0].publishedAt {
            self.dateLabel.text = "Published at : \(date)"
        } else {
            self.dateLabel.text = "Publishing date not found"
        }
    
        if let content = self.singleReport[0].content {
            self.contentLabel.text = content
        } else {
            self.contentLabel.text = "Content not found"
        }
        
        if let url = self.singleReport[0].url {
            self.articleURL.text = "Find article here : \(url)"
        } else {
            self.articleURL.text = "URL not found"
        }
        
        if let img = self.singleReport[0].urlToImage {
            print("in image")
            let url = URL.init(string: img)
            if url != nil {
                let data = try? Data(contentsOf: url!)
                if data != nil {
                    self.imgView.image = UIImage(data: data!)
                }
            } else {
                print("error")
            }
        }
    }
}
