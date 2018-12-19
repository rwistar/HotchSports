//
//  NewsViewController.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/17/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import UIKit

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
        
        tblNewsItems.rowHeight = 100.0
        
        
        // Do any additional setup after loading the view.
        
        loadTestNewsItems()
        filterNewsItems()
        
        if #available(iOS 10.0, *) {
            tblNewsItems.refreshControl = refreshControl
        } else {
            tblNewsItems.addSubview(refreshControl)
        }
        
        refreshControl.addTarget(self, action: #selector(refreshNewsItems(_:)), for: .valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing News Items")
        
    }
    
    func loadTestNewsItems() {
        for newsText in testNewsTexts {
            print(newsText)

            let team = newsText[0]
            let head = newsText[1]
            let URL = newsText[2]
            
            let newsItem = NewsItem(myNewsTeam: Team(myTeamName: team), myNewsHead: head, myNewsURL: URL)
            
            myNewsItems.append(newsItem)
        }

//        print(myNewsItems)
    }

    @objc
    private func refreshNewsItems(_ sender: Any) {
        print("refresh called")
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.stopRefresh), userInfo: nil, repeats: false)
    }
    
    @objc
    func stopRefresh() {
    
        if myNewsItems.count < 4 {
            myNewsItems.append(NewsItem(myNewsTeam: Team(myTeamName: "Varsity Field Hockey"), myNewsHead: "Jennings '15 Named MOP, Middlebury Repeats", myNewsURL: "https://www.hotchkiss.org/athletics/news-post/~post/jennings-15-named-mop-middlebury-repeats-as-ncaa-champs-20181118"))
            
            filterNewsItems()
            tblNewsItems.reloadData()
        }
    
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
        return filteredNews.count
//        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableItemNews", for: indexPath) as! NewsTableViewCell
        
        // Configure the cell...
        
//        if indexPath.row % 2 == 0 {
//            cell.backgroundColor = UIColor(red: 15/255, green: 43/255, blue: 91/255, alpha: 0.4)
//        } else {
//            cell.backgroundColor = .white
//        }
        
        let newsItem = filteredNews[indexPath.row]
        
        let head = newsItem.myNewsHead
        let teamName = newsItem.myNewsTeam.myTeamName
        
        cell.lblNewsHead.text = head
        cell.lblNewsTeam.text = teamName
        
        return cell
    }
    
    /// update filteredScores to include only selected teams from myScoreTeams
    func filterNewsItems() {
        filteredNews = [NewsItem]()
        
//        filteredScores = [ScoreItem]()
//
        for newsItem in myNewsItems {
            for team in myNewsTeams.keys {
                //                print(teamWords)
                if myNewsTeams[team] == true && newsItemMatch(team: newsItem.myNewsTeam.myTeamName, key: team) {
                    //                    print("Found \(team) in \(scoreItem.myScoreTeam.myTeamName)")
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
//
//        //        print(myScoreTeams)
//
        filterNewsItems()
//        //        print(filteredScores)
//
        tblNewsItems.reloadData()
    }
}
