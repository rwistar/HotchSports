//
//  PlayerLayer.swift
//  HotchSportsProto
//
//  Created by Roger Wistar on 11/4/18.
//  Copyright © 2018 Roger Wistar. All rights reserved.
//

import UIKit
import AVKit;
import AVFoundation;

class PlayerView: UIView {
    override static var layerClass: AnyClass {
        return AVPlayerLayer.self;
    }
    
    var playerLayer: AVPlayerLayer {
        return layer as! AVPlayerLayer;
    }
    
    var player: AVPlayer? {
        get {
            return playerLayer.player;
        }
        set {
            playerLayer.player = newValue;
        }
    }
}
