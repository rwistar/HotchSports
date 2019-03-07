//
//  ScoreItem.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/17/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import Foundation

var myScoreItems = [ScoreItem]()
var scoreSeasonChanged = false

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
    
    static func >= (lhs: ScoreItem, rhs: ScoreItem) -> Bool {
        return !(lhs < rhs)
    }
    
    static func < (lhs: ScoreItem, rhs: ScoreItem) -> Bool {
        if let lhYear = lhs.myScoreDate.year, let rhYear = rhs.myScoreDate.year {
            if lhYear != rhYear {
                return lhYear < rhYear
            }
        }
        if let lhMonth = lhs.myScoreDate.month, let rhMonth = rhs.myScoreDate.month {
            if lhMonth != rhMonth {
                return monthIsBefore(lh: lhMonth, rh: rhMonth)
            }
        }
        if let lhDay = lhs.myScoreDate.day, let rhDay = rhs.myScoreDate.day {
            if lhDay != rhDay {
                return lhDay < rhDay
            }
        }
        if let lhHour = lhs.myScoreDate.hour, let rhHour = rhs.myScoreDate.hour {
            if lhHour != rhHour {
                return lhHour < rhHour
            }
        }
        if let lhMinute = lhs.myScoreDate.minute, let rhMinute = rhs.myScoreDate.minute {
            if lhMinute != rhMinute {
                return lhMinute < rhMinute
            }
        }
        return false
        
    }
    
    static func monthIsBefore(lh: Int, rh: Int) -> Bool {
        if lh >= 9 && rh < 9 {
            return true
        } else if lh < 9 && rh >= 9 {
            return false
        } else if lh < rh {
            return true
        } else {
            return false
        }
    }
    

}
