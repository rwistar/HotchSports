//
//  RecordItem.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/24/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import Foundation

struct TeamRecordItem {
    var myRecordTeam: Team
    var myRecordWins: Int
    var myRecordLosses: Int
    var myRecordTies: Int
    
    var shortRecord: String {
        var recordStr = "\(myRecordWins)-\(myRecordLosses)"
        
        if myRecordTies > 0 {
            recordStr += "-\(myRecordTies)"
        }
        
        return recordStr
    }
}
