//
//  NoteListView.swift
//  ocSwiftTest
//
//  Created by 王锦涛 on 2017/5/3.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class NoteListView: UIView {

    
    var segment: GNSegment!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        setupChildViews()
        loadData()
    }
    
    func loadData() {
        let paramsDict = ["planId":"5389","videoStatus":"3","uId":SandboxHelper.getUserID()]
        HttpRequest_AFNet.requestPOST_JSONwithURLstring(NetworkPort.getAPI(.PLAY_GETNOTES), parameters: NetworkPort.getParams(paramsDict), success: { (jsonInfo) in
            print(jsonInfo!)
        }) { (error) in
            print(error!)
        }
    }
    
    func setupChildViews() {
        
        let asdf = GNSegment.init(frame: CGRect.init(x: 0, y: 0, width: 300, height: 40))
        asdf.selectedIndex = 0
        asdf.addTarget(self, action: #selector(self.didClickSegment))
        segment = asdf
        asdf.center = self.center
        self.addSubview(asdf)
        
    }
    func didClickSegment() -> Void {
        if  segment.selectedIndex == 0{
            segment.selectedIndex = 1
        }else{
            segment.selectedIndex = 0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}
