//
//  Movie.swift
//  11-循环引用解决
//
//  Created by 王锦涛 on 2017/5/2.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class Movie: MediaItem {
    
    let director: String
    
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }

}
