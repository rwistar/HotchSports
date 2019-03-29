
//
//  SettingsViewController.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 12/10/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var segSeason: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSegment()

        // Do any additional setup after loading the view.
    }
    
    func setSegment() {
        segSeason.selectedSegmentIndex = whichSeason.rawValue
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
            let date = Date()
            let calendar = Calendar.current
            
            let month = calendar.component(.month, from: date)
            let dayNum = calendar.component(.day, from: date)
            
            if month == 11 && dayNum >= 25 {
                whichSeason = Season(rawValue: 1)!
            } else if month == 12 {
                whichSeason = Season(rawValue: 1)!
            } else if month < 3 {
                whichSeason = Season(rawValue: 1)!
            } else if month == 3 && dayNum <= 15 {
                whichSeason = Season(rawValue: 1)!
            } else if month == 3 && dayNum > 15 {
                whichSeason = Season(rawValue: 2)!
            } else if month > 3 && month < 9 {
                whichSeason = Season(rawValue: 2)!
            } else {
                whichSeason = Season(rawValue: 0)!
            }            
        } else {
            let choice = sender.selectedSegmentIndex - 1
            whichSeason = Season(rawValue: choice)!
        }
        
        print(seasonNames[whichSeason.rawValue])
        
        whichTeam = allTeams[whichSeason.rawValue]
        myScoreTeams = scoreTeams[whichSeason.rawValue]
        scoreSeasonChanged = true
        newsSeasonChanged = true
    }
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func bugPressed(_ sender: UIBarButtonItem) {
        guard let url = URL(string: "https://tinyurl.com/HotchSportsbugs") else { return }
        UIApplication.shared.open(url)
    }
    
    
}
