//
//  Song.swift
//  11-循环引用解决
//
//  Created by 王锦涛 on 2017/5/2.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class Song: MediaItem {
    
    let artist: String
    
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }

}
