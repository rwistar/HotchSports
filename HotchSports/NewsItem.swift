//
//  NewsItem.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/30/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import Foundation

var myNewsItems = [NewsItem]()

var newsItems = [String: NewsItem]()

struct NewsItem {
    var myNewsTeam: Team
    var myNewsHead: String
    var myNewsURL: String
    
    static func == (lhs: NewsItem, rhs: NewsItem) -> Bool {
        return (lhs.myNewsTeam.myTeamName == rhs.myNewsTeam.myTeamName
            && lhs.myNewsHead == rhs.myNewsHead
            && lhs.myNewsURL == rhs.myNewsURL)
    }
    
    static func >= (lhs: NewsItem, rhs: NewsItem) -> Bool {
        return !(lhs < rhs)
    }
    
    static func < (lhs: NewsItem, rhs: NewsItem) -> Bool {
        return lhs.myNewsTeam.myTeamName < rhs.myNewsTeam.myTeamName        
    }
}
