//
//  Team.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/17/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import Foundation

//var allTeams = [Team]()

var allTeams = [
    Team(myTeamName: "Varsity Field Hockey"),
    Team(myTeamName: "JV Field Hockey"),
    Team(myTeamName: "Thirds Field Hockey"),
    Team(myTeamName: "Girls Varsity Soccer"),
    Team(myTeamName: "Girls JV Soccer"),
    Team(myTeamName: "Girls Thirds Soccer"),
    Team(myTeamName: "Boys Varsity Soccer"),
    Team(myTeamName: "Boys JV Soccer"),
    Team(myTeamName: "Boys Thirds Soccer"),
    Team(myTeamName: "Boys Varsity Cross Country"),
    Team(myTeamName: "Girls Varsity Cross Country"),
    Team(myTeamName: "Varsity Mountain Biking"),
    Team(myTeamName: "Varsity Volleyball"),
    Team(myTeamName: "JV Volleyball"),
    Team(myTeamName: "Thirds Volleyball"),
    Team(myTeamName: "Boys Varsity Water Polo"),
]


struct Team: CustomStringConvertible {
    var myTeamName: String
    
    var description: String {
        return myTeamName
    }
}
