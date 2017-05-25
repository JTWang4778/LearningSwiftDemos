//
//  ChannelModel.swift
//  15-UICollectionView
//
//  Created by 王锦涛 on 2017/5/25.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ChannelModel: NSObject {
    
    var section : Int = 0
    var row : Int = 0
    var title : String {
        get{
            return "\(section)-\(row)"
        }
    }
    
    init(section : Int, row : Int) {
        self.section = section
        self.row = row
        super.init()
    }
}
