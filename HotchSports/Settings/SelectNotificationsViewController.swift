//
//  SelectNotificationsViewController.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 12/11/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import UIKit

var fallNotify: [String: Bool] = [
    "Football": true,
    "Boys Soccer": true,
    "Boys Water Polo": true,
    "Boys Cross Country": true,
    "Field Hockey": true,
    "Girls Soccer": true,
    "Volleyball": true,
    "Mountain Biking": true,
]

var winterNotify: [String: Bool] = [
    "Boys Basketball": true,
    "Boys Hockey": true,
    "Boys Squash": true,
    "Boys Swimming": true,
    "Girls Basketball": true,
    "Girls Hockey": true,
    "Girls Squash": true,
    "Girls Swimming": true,
    "Wrestling": true,
]

var notifications = [fallNotify, winterNotify]

class SelectNotificationsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var segSeason: UISegmentedControl!
    
    @IBOutlet weak var tblTeamChoice: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblTeamChoice.dataSource = self
        tblTeamChoice.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let seasonIdx = segSeason.selectedSegmentIndex
        
        if seasonIdx < notifications.count {
            return notifications[seasonIdx].keys.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "notifyTeamItem", for: indexPath)
    
        let seasonIdx = segSeason.selectedSegmentIndex
        
        let seasonFlags = notifications[seasonIdx]
        
        let teams = seasonFlags.keys.sorted()
        let thisTeam = teams[indexPath.row]
        
        cell.textLabel?.text = thisTeam
        
        if seasonFlags[thisTeam] == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        let teamName = selectedCell!.textLabel!.text!
        
        let seasonIdx = segSeason.selectedSegmentIndex
        
        let flagVal = (notifications[seasonIdx])[teamName]
        
        (notifications[seasonIdx])[teamName] = !flagVal!
        print(notifications)
        
        tblTeamChoice.reloadData()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func segChanged(_ sender: UISegmentedControl) {
        tblTeamChoice.reloadData()
    }
    
    
    @IBAction func donePressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
