//
//  ScoreItem.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/17/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import Foundation

var myScoreItems = [ScoreItem]()

struct ScoreItem {
    enum GameResult {
        case win, lose, tie, scrimmage, cancel, postpone, other, future
    }
    
    enum Location {
        case home, away, other
    }
    
    var myScoreTeam: Team
    var myScoreDate: DateComponents
    var myScoreLoc: Location
    var myScoreOpp: Opponent
    var myScoreResult: GameResult
    var myScoreText: String
    
    var shortDate: String {
        return String(myScoreDate.month!) + "/" + String(myScoreDate.day!)
    }
    
    var shortTime: String {
        if myScoreDate.hour! > 12 {
            return String(myScoreDate.hour! - 12) + ":" + String(format: "%02d", myScoreDate.minute!) + " PM"
        } else {
            return String(myScoreDate.hour!) + ":" + String(format: "%02d", myScoreDate.minute!) + " AM"
        }
        
    }
    
    var shortResult: String {
        var result = ""
        
        switch myScoreResult {
        case .win: result = "W "
        case .lose: result = "L "
        case .tie: result = "T "
        case .postpone: result = "Ppd"
        case .cancel: result = "Cancel"
        default: result = ""
        }
        
        result += myScoreText
        return result
    }
    
}
