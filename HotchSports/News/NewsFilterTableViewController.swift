//
//  NewsFilterTableViewController.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/30/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import UIKit

protocol NewsFilterDelegate: class {
    func updateNewsTable(teamFlags: [String: Bool])
}


class NewsFilterTableViewController: UITableViewController {

    var teamFlags: [String: Bool]?
    
    weak var delegate: NewsFilterDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let flags = teamFlags {
            return flags.count + 1
        } else {
            return 0
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableItemNewsFilter", for: indexPath)
        
        // Configure the cell...
        
        if let flags = teamFlags {
            var teamNames: [String] = ["SELECT ALL TEAMS", "CLEAR ALL TEAMS"]
            teamNames += flags.keys.sorted()
            let team = teamNames[indexPath.row]
            
            cell.textLabel!.text = team
            cell.textLabel!.textColor = UIColor(red: 16/255, green: 40/255, blue: 91/255, alpha: 1.0)

            if team != "SHOW ALL TEAMS" && flags[team] == true {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            

        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath)
        
        if let teamName = selectedCell?.textLabel?.text {
            if teamName == "SELECT ALL TEAMS" {
                if teamFlags != nil {
                    for team in teamFlags!.keys {
                        teamFlags![team] = true
                    }
                }
            } else if teamName == "CLEAR ALL TEAMS" {
                if teamFlags != nil {
                    for team in teamFlags!.keys {
                        teamFlags![team] = false
                    }
                }
            } else {
                if teamFlags != nil {
                    teamFlags![teamName] = !teamFlags![teamName]!
                }
            }
            
        }
        
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if let flags = teamFlags {
            delegate?.updateNewsTable(teamFlags: flags)
        }
    }
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
