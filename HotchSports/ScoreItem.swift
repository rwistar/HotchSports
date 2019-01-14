//
//  ScoreItem.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/17/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import Foundation

var myScoreItems = [ScoreItem]()

struct ScoreItem: Equatable, Comparable {
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
        if let month = myScoreDate.month, let day = myScoreDate.day {
            return String(month) + "/" + String(day)
        } else {
            return ""
        }
    }
    
    var shortTime: String {
        if let hour = myScoreDate.hour, let minute = myScoreDate.minute {
            if hour > 12 {
                return String(hour - 12) + ":" + String(format: "%02d", minute) + " PM"
            } else {
                return String(hour) + ":" + String(format: "%02d", minute) + " AM"
            }
        } else {
            return ""
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

    static func == (lhs: ScoreItem, rhs: ScoreItem) -> Bool {
        return (lhs.myScoreTeam.myTeamName == rhs.myScoreTeam.myTeamName
            && lhs.myScoreLoc == rhs.myScoreLoc
            && lhs.myScoreOpp.myOppName == rhs.myScoreOpp.myOppName
            && lhs.myScoreResult == rhs.myScoreResult
            && lhs.myScoreText == rhs.myScoreText
            && lhs.myScoreDate.date == rhs.myScoreDate.date)
    }
    
    static func < (lhs: ScoreItem, rhs: ScoreItem) -> Bool {
//        if lhs.myScoreDate.year != rhs.myScoreDate.year {
//            return lhs.myScoreDate.year! < rhs.myScoreDate.year!
//        } else if lhs.myScoreDate.month != rhs.myScoreDate.month {
//            return lhs.myScoreDate.month! < rhs.myScoreDate.month!
//        } else if lhs.myScoreDate.day != rhs.myScoreDate.day {
//            return lhs.myScoreDate.day! < rhs.myScoreDate.day!
//        } else if lhs.myScoreDate.hour != rhs.myScoreDate.hour {
//            return lhs.myScoreDate.hour! < rhs.myScoreDate.hour!
//        } else if lhs.myScoreDate.minute != rhs.myScoreDate.minute {
//            return lhs.myScoreDate.minute! < rhs.myScoreDate.minute!
//        } else {
//            return false
//        }
        
        if let lhYear = lhs.myScoreDate.year, let rhYear = rhs.myScoreDate.year {
            return lhYear < rhYear
        } else if let lhMonth = lhs.myScoreDate.month, let rhMonth = rhs.myScoreDate.month {
            return lhMonth < rhMonth
        } else if let lhDay = lhs.myScoreDate.day, let rhDay = rhs.myScoreDate.day {
            return lhDay < rhDay
        } else if let lhHour = lhs.myScoreDate.hour, let rhHour = rhs.myScoreDate.hour {
            return lhHour < rhHour
        } else if let lhMinute = lhs.myScoreDate.minute, let rhMinute = rhs.myScoreDate.minute {
            return lhMinute < rhMinute
        } else {
            return false
        }
    }
    

}
