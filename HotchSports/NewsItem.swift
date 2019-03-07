//
//  NewsItem.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 10/30/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import Foundation

var myNewsItems = [NewsItem]()
var newsSeasonChanged = false

struct NewsItem {
    var myNewsTeam: Team
    var myNewsHead: String
    var myNewsURL: String
}
