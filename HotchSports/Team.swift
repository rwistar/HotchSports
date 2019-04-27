//
//  Team.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/17/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import Foundation

//var allTeams = [Team]()

var seasonNames = ["Fall", "Winter", "Spring", "Auto"]

enum Season: Int {
    case fall = 0
    case winter = 1
    case spring = 2
    case auto = 3
}

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

var springTeams = [
    Team(myTeamName: "Baseball"),
    Team(myTeamName: "Boys Golf"),
    Team(myTeamName: "Girls Golf"),
    Team(myTeamName: "Boys Lacrosse"),
    Team(myTeamName: "Girls Lacrosse"),
    Team(myTeamName: "Sailing"),
//    Team(myTeamName: "Softball"),
    Team(myTeamName: "Boys Tennis"),
    Team(myTeamName: "Girls Tennis"),
    Team(myTeamName: "Boys Track"),
    Team(myTeamName: "Girls Track"),
    Team(myTeamName: "Ultimate Frisbee"),
//    Team(myTeamName: "Girls Water Polo"),
]

var allTeams = [fallTeams, winterTeams, springTeams]

var whichTeam: [Team] = []

var fallScoreTeams: [String : Bool] = [
    "Boys Cross Country": true,
    "Girls Cross Country": true,
    "Field Hockey": true,
    "Mountain Biking": true,
    "Football": true,
    "Boys Soccer": true,
    "Girls Soccer": true,
    "Volleyball": true,
    "Boys Water Polo": true,
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

var springScoreTeams: [String: Bool] = [
    "Baseball": true,
    "Boys Golf": true,
    "Girls Golf": true,
    "Boys Lacrosse": true,
    "Girls Lacrosse": true,
    "Sailing": true,
//    "Softball": true,
    "Boys Tennis": true,
    "Girls Tennis": true,
    "Boys Track": true,
    "Girls Track": true,
    "Ultimate Frisbee": true,
//    "Girls Water Polo": true,
]

var scoreTeams = [fallScoreTeams, winterScoreTeams, springScoreTeams]

var myScoreTeams : [String: Bool] = [:]

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
    "Baseball": "baseball",
    "Boys Golf": "boys-golf",
    "Girls Golf": "girls-golf",
    "Boys Lacrosse": "boys-lacrosse",
    "Girls Lacrosse": "girls-lacrosse",
    "Sailing": "sailing",
    "Softball": "softball",
    "Boys Tennis": "boys-tennis",
    "Girls Tennis": "girls-tennis",
    "Boys Track": "boys-track-and-field",
    "Girls Track": "girls-track-and-field",
    "Ultimate Frisbee": "ultimate-frisbee",
    "Girls Water Polo": "girls-water-polo",
]

struct Team: CustomStringConvertible {
    var myTeamName: String
    
    var description: String {
        return myTeamName
    }
}
