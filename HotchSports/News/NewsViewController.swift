//
//  NewsViewController.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/17/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import UIKit
import SwiftSoup

class NewsTableViewCell: UITableViewCell {
    @IBOutlet weak var lblNewsHead: UILabel!
    @IBOutlet weak var lblNewsTeam: UILabel!
    
}

class NewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewsFilterDelegate {
    
    @IBOutlet weak var tblNewsItems: UITableView!
    
    private let refreshControl = UIRefreshControl()
    
    var timer = Timer()
    
    var testNewsTexts = [
        ["Varsity Sailing", "Petersen '22 Places Second at Singlehanded Nationals", "https://www.hotchkiss.org/athletics/news-post/~post/petersen-22-places-second-at-singlehanded-nationals-20181029"],
        ["Boys Varsity Cross Country", "Sidamon-Eristoff '19 Powers Boys Cross Country Past Choate", "https://www.hotchkiss.org/athletics/news-post/~post/sidamon-eristoff-19-powers-boys-cross-country-past-choate-20181022"],
        ["Girls Varsity Soccer", "Girls Soccer Draws With Choate in Prime Time", "https://www.hotchkiss.org/athletics/news-post/~post/girls-soccer-draws-with-choate-in-prime-time-20181021"],
    ]
    
    var filteredNews = [NewsItem]()
    
    var myNewsTeams: [String : Bool] = [
        "Boys Cross Country": true,
        "Girls Cross Country": true,
        "Field Hockey": true,
        "Mountain Biking": true,
        "Football": true,
        "Boys Soccer": true,
        "Girls Soccer": true,
        "Volleyball": true,
        "Water Polo": true
    ]
    
    var selectedURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblNewsItems.dataSource = self
        tblNewsItems.delegate = self
        
        tblNewsItems.rowHeight = 80.0
        
        loadNewsItems()
        
        if #available(iOS 10.0, *) {
            tblNewsItems.refreshControl = refreshControl
        } else {
            tblNewsItems.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(refreshNewsItems(_:)), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing News Items")
        
    }
    
    func loadNewsItems() {
        myNewsItems = []
        
        var doneTeams: [String: Bool] = [:]
    
        for team in whichTeams {
            doneTeams[team.myTeamName] = false
        
            let teamURL = teamURLS[team.myTeamName]
        
            let url = URL(string: "https://www.hotchkiss.org/athletics/our-teams/\(teamURL!)/varsity")!
            print(url)
            
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                } else {
                    let htmlContent = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
                    
                    do {
                        let doc: Document = try SwiftSoup.parse(htmlContent as! String)
                        let body: Element = doc.body()!

                        let postsHTML: Elements = try body.getElementsByClass("fsPostLink")
                        
                        let posts: [Element] = postsHTML.array()
                        
                        for post in posts {
                            //print(post)
                            
                            let headline = try? post.getElementsByAttribute("href").array()[0].text()
                            let urlPart = try? post.attr("href")
                            
//                            print(urlPart!)
                            
                            let newsItem = NewsItem(myNewsTeam: team, myNewsHead: headline!, myNewsURL: urlPart!)
                            print(newsItem)
                            myNewsItems.append(newsItem)
                        }
                        
                        doneTeams[team.myTeamName] = true
                        print("\(team.myTeamName) is done!")
                        
                        var allDone = true
                        for teamName in doneTeams.keys {
                            allDone = allDone && doneTeams[teamName]!
                        }
                        
                        if allDone == true {
                            print("Time to sort!")
                            self.filterNewsItems()
                            
                            DispatchQueue.main.async {
                                self.tblNewsItems.reloadData()
                            }
                        }
                    } catch Exception.Error(let type, let message) {
                        print(message)
                    } catch {
                        print("error")
                    }
                }
            }
            task.resume()
        }
    }


//    func loadTestNewsItems() {
//        for newsText in testNewsTexts {
//            print(newsText)
//
//            let team = newsText[0]
//            let head = newsText[1]
//            let URL = newsText[2]
//
//            let newsItem = NewsItem(myNewsTeam: Team(myTeamName: team), myNewsHead: head, myNewsURL: URL)
//
//            myNewsItems.append(newsItem)
//        }
//    }

    @objc
    private func refreshNewsItems(_ sender: Any) {
        print("refresh called")
        loadNewsItems()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.stopRefresh), userInfo: nil, repeats: false)
    }
    
    @objc
    func stopRefresh() {
        refreshControl.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if filteredNews.count == 0 {
            return 1
        } else {
            return filteredNews.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableItemNews", for: indexPath) as! NewsTableViewCell
        
        // Configure the cell...
        
//        if indexPath.row % 2 == 0 {
//            cell.backgroundColor = UIColor(red: 15/255, green: 43/255, blue: 91/255, alpha: 0.4)
//        } else {
//            cell.backgroundColor = .white
//        }
        
        if filteredNews.count == 0 {
            cell.lblNewsHead.text = "News items loading..."
            cell.lblNewsTeam.text = ""
        } else {
            let newsItem = filteredNews[indexPath.row]
            
            let head = newsItem.myNewsHead
            let teamName = newsItem.myNewsTeam.myTeamName
            
            cell.lblNewsHead.text = head
            cell.lblNewsTeam.text = teamName
        }
        
        return cell
    }
    
    /// update filteredScores to include only selected teams from myScoreTeams
    func filterNewsItems() {
        filteredNews = [NewsItem]()
        
        for newsItem in myNewsItems {
            for team in myScoreTeams.keys {
                if myScoreTeams[team] == true && newsItemMatch(team: newsItem.myNewsTeam.myTeamName, key: team) {
                    filteredNews.append(newsItem)
                }
            }
        }
    }
    
    /// checks to see if a given team matches a generic program name (e.g., does "Boys JV Soccer" contain "Boys Soccer"? --> TRUE)
    ///
    /// - Parameters:
    ///   - team: the team to check
    ///   - key: the sport to search for
    /// - Returns: true if team contains key, else false
    func newsItemMatch(team: String, key: String) -> Bool {
        let teamWords = key.split(separator: " ")
        var wordArray = [String]()
        for word in teamWords {
            wordArray.append(String(word))
        }
        
        for word in wordArray {
            if !team.contains(word) {
                return false
            }
        }
        
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? NewsTableViewCell {
            let head = cell.lblNewsHead.text!
            
            for newsItem in filteredNews {
                if newsItem.myNewsHead == head {
                    selectedURL = newsItem.myNewsURL
                }
            }
        }
        performSegue(withIdentifier: "segueNewsItem", sender: self)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "segueNewsFilter" {
            if let destination = segue.destination as? NewsFilterTableViewController {
                destination.teamFlags = myNewsTeams

                destination.tableView.reloadData()

                destination.delegate = self
            }

        } else if segue.identifier == "segueNewsItem" {
            if let destination = segue.destination as? NewsItemViewController {
                destination.myURLString = selectedURL
            }
        }
        
    }
    
    /// Delegate method to update myScoreTeams from filter page
    ///
    /// - Parameter teamFlags: new values for myScoreTeams
    func updateNewsTable(teamFlags: [String : Bool]) {
        print("\n\n\nUPDATE_SCORE_TABLE")
        
        myNewsTeams = teamFlags
        filterNewsItems()
        tblNewsItems.reloadData()
    }
}
