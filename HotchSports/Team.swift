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
    Team(myTeamName: "Girls Varsity Soccer"),
    Team(myTeamName: "Boys Varsity Soccer"),
    Team(myTeamName: "Boys Varsity Cross Country"),
    Team(myTeamName: "Girls Varsity Cross Country"),
    Team(myTeamName: "Varsity Mountain Biking"),
    Team(myTeamName: "Varsity Volleyball"),
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

var allTeams = [fallTeams, winterTeams]

var whichTeam = allTeams[whichSeason.rawValue]

var fallScoreTeams: [String : Bool] = [
    "Boys Cross Country": true,
    "Girls Cross Country": true,
    "Field Hockey": true,
    "Mountain Biking": true,
    "Football": true,
    "Boys Soccer": true,
    "Girls Soccer": true,
    "Volleyball": true,
    "Water Polo": true,
]

var winterScoreTeams: [String: Bool] = [
    "Boys Basketball": true,
    "Girls Basketball": true,
    "Boys Hockey": true,
    "Girls Hockey": true,
    "Boys Squash": true,
    "Girls Squash": true,
    "Boys Swimming": true,
    "Girls Swimming": true,
    "Coed Wrestling": true,
]

var scoreTeams = [fallScoreTeams, winterScoreTeams]

var myScoreTeams = scoreTeams[whichSeason.rawValue]

var teamURLS: [String: String] =
[
    "Varsity Field Hockey": "field-hockey",
    "Girls Varsity Soccer": "girls-soccer",
    "Boys Varsity Soccer": "boys-soccer",
    "Boys Varsity Cross Country": "boys-cross-country",
    "Girls Varsity Cross Country": "girls-cross-country",
    "Varsity Mountain Biking": "mountain-biking",
    "Varsity Volleyball": "volleyball",
    "Boys Varsity Water Polo": "boys-water-polo",
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
