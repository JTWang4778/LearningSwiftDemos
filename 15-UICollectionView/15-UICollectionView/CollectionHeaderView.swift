//
//  CollectionHeaderView.swift
//  15-UICollectionView
//
//  Created by 王锦涛 on 2017/5/31.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

protocol CollectionHeaderViewDelegate {
    func didClickMore()
}

class CollectionHeaderView: UICollectionReusableView {
    
    var delegate : CollectionHeaderViewDelegate?
    
    @IBAction func didClickMoreButton(_ sender: Any) {
        
        self.delegate?.didClickMore()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        print("asdf")
        
    }
    
}
