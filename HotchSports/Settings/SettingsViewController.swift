
//
//  SettingsViewController.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 12/10/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import UIKit

var whichSeason: Season = .winter
var newsSeasonChanged = false
var scoreSeasonChanged = false


class SettingsViewController: UIViewController {

    @IBOutlet weak var segSeason: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSegment()

        // Do any additional setup after loading the view.
    }
    
    func setSegment() {
        if whichSeason == .auto {
            segSeason.selectedSegmentIndex = 0
        } else {
            segSeason.selectedSegmentIndex = whichSeason.rawValue + 1
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

    @IBAction func seasonChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            whichSeason = .auto
        } else {
            let choice = sender.selectedSegmentIndex - 1
            whichSeason = Season(rawValue: choice)!
        }
        
    print(seasonNames[whichSeason.rawValue])

        updateTeamChosen()

        scoreSeasonChanged = true
        newsSeasonChanged = true
    }
    
    func updateTeamChosen() {
        var season : Season = .auto
        
        if whichSeason == .auto {
            let date = Date()
            let calendar = Calendar.current
            
            let month = calendar.component(.month, from: date)
            let dayNum = calendar.component(.day, from: date)
            
            if month == 11 && dayNum >= 25 {
                season = .winter
            } else if month == 12 {
                season = .winter
            } else if month < 3 {
                season = .winter
            } else if month == 3 && dayNum <= 15 {
                season = .winter
            } else if month == 3 && dayNum > 15 {
                season = .spring
            } else if month > 3 && month < 9 {
                season = .spring
            } else {
                season = .fall
            }
        } else {
            season = whichSeason
        }
        
        whichTeam = allTeams[season.rawValue]
        myScoreTeams = scoreTeams[season.rawValue]
    }
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bugPressed(_ sender: UIBarButtonItem) {
        guard let url = URL(string: "https://tinyurl.com/HotchSportsbugs") else { return }
        UIApplication.shared.open(url)
    }
    
    
}
