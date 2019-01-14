//
//  Team.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/17/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import Foundation

//var allTeams = [Team]()

var seasonNames = ["Fall", "Winter", "Spring"]

enum Season: Int {
    case fall = 0
    case winter = 1
    case spring = 2
}

var whichSeason: Season = .winter

var fallTeams = [
    Team(myTeamName: "Varsity Field Hockey"),
//    Team(myTeamName: "JV Field Hockey"),
//    Team(myTeamName: "Thirds Field Hockey"),
    Team(myTeamName: "Girls Varsity Soccer"),
//    Team(myTeamName: "Girls JV Soccer"),
//    Team(myTeamName: "Girls Thirds Soccer"),
    Team(myTeamName: "Boys Varsity Soccer"),
//    Team(myTeamName: "Boys JV Soccer"),
//    Team(myTeamName: "Boys Thirds Soccer"),
    Team(myTeamName: "Boys Varsity Cross Country"),
    Team(myTeamName: "Girls Varsity Cross Country"),
    Team(myTeamName: "Varsity Mountain Biking"),
    Team(myTeamName: "Varsity Volleyball"),
//    Team(myTeamName: "JV Volleyball"),
//    Team(myTeamName: "Thirds Volleyball"),
    Team(myTeamName: "Boys Varsity Water Polo"),
]

var winterTeams = [
    Team(myTeamName: "Boys Varsity Basketball"),
    Team(myTeamName: "Girls Varsity Basketball"),
    Team(myTeamName: "Boys Varsity Hockey"),
    Team(myTeamName: "Girls Varsity Hockey"),
    Team(myTeamName: "Boys Varsity Squash"),
    Team(myTeamName: "Girls Varsity Squash"),
    Team(myTeamName: "Boys Varsity Swimming"),
    Team(myTeamName: "Girls Varsity Swimming"),
    Team(myTeamName: "Coed Varsity Wrestling"),
]

var whichTeams = winterTeams

var teamURLS: [String: String] =
[
    "Boys Varsity Basketball": "boys-basketball",
    "Girls Varsity Basketball": "girls-basketball",
    "Boys Varsity Hockey": "boys-hockey",
    "Girls Varsity Hockey": "girls-hockey",
    "Boys Varsity Squash": "boys-squash",
    "Girls Varsity Squash": "girls-squash",
    "Boys Varsity Swimming": "boys-swimming",
    "Girls Varsity Swimming": "girls-swimming",
    "Coed Varsity Wrestling": "wrestling",
]

struct Team: CustomStringConvertible {
    var myTeamName: String
    
    var description: String {
        return myTeamName
    }
}
