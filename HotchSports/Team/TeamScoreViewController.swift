//
//  TeamScoreViewController.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/26/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import UIKit

class TeamScoreTableViewCell: UITableViewCell {
    @IBOutlet weak var lblScoreEvent: UILabel!
    @IBOutlet weak var lblScoreOpp: UILabel!
    @IBOutlet weak var lblScoreValue: UILabel!
    
}

class TeamScoreViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tblTeamScores: UITableView!
    @IBOutlet weak var lblTeamName: UILabel!
    @IBOutlet weak var lblTeamRecord: UILabel!
    
    var filteredScores = [ScoreItem]()
    
    var teamName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblTeamScores.dataSource = self
        tblTeamScores.delegate = self
        
        tblTeamScores.rowHeight = 60.0
        
        // Do any additional setup after loading the view.
        
        if let team = teamName {
            filterRecordScores(team)
            filteredScores.sort(by: <)
        }

        updateLabels()
      
    }
    
    /// update filteredScores to include only selected teams from myScoreTeams
    func filterRecordScores(_ teamName: String) {
        filteredScores = [ScoreItem]()
        
        for scoreItem in myScoreItems {
            if scoreItem.myScoreTeam.myTeamName == teamName {
                print("Found \(teamName)")
                filteredScores.append(scoreItem)
            }
        }
    }
    
    func updateLabels() {
        if let name = teamName {
            lblTeamName.text = name
            
            var record = TeamRecordItem(myRecordTeam: Team(myTeamName: name), myRecordWins: 0, myRecordLosses: 0, myRecordTies: 0)
            
            for scores in filteredScores {
                switch scores.myScoreResult {
                case .win: record.myRecordWins += 1
                case .lose: record.myRecordLosses += 1
                case .tie: record.myRecordTies += 1
                default: break
                }
            }
            
            let recordStr = record.shortRecord
            
            lblTeamRecord.text = "Overall Record: \(recordStr)"

        }
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
        return filteredScores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableItemScore", for: indexPath) as! TeamScoreTableViewCell
        
        // Configure the cell...
        
        if indexPath.row % 2 == 1 {
            cell.backgroundColor = UIColor(red: 15/255, green: 43/255, blue: 91/255, alpha: 0.2)
        } else {
            cell.backgroundColor = .white
        }
        
        if teamName != nil {
            let scoreItem = filteredScores[indexPath.row]
            
            let date = scoreItem.shortDate
            
            let team = scoreItem.myScoreTeam
            
            let loc = scoreItem.myScoreLoc
            var locText = ""
            switch loc {
            case .away: locText = "@ "
            case .home: locText = "vs. "
            default: locText = ""
            }
            locText += scoreItem.myScoreOpp.myOppName
            
            var result = ""
            if scoreItem.myScoreResult == .future {
                result = scoreItem.shortTime
            } else {
                result = scoreItem.shortResult
            }
            
            cell.lblScoreEvent.text = "\(date) \(team)"
            cell.lblScoreOpp.text = locText
            cell.lblScoreValue.text = result
            
        }

        return cell
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//
//    }
    
}
