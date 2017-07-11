//
//  ChannelCell.swift
//  15-UICollectionView
//
//  Created by 王锦涛 on 2017/5/25.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ChannelCell: UICollectionViewCell {

    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    
    var closure : (() -> ())?

    
    var model : ChannelModel! {
        didSet{
            self.label.text = model.title
        }
    }
    
    @IBAction func didClickCloseButton(_ sender: Any) {
        
        self.closure!()
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
