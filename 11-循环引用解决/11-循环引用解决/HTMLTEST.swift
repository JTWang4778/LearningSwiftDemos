//
//  HTMLTEST.swift
//  11-循环引用解决
//
//  Created by 王锦涛 on 2017/5/2.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class HTMLTEST {
    
    let name: String
    
    lazy var colure:() -> String = {
        // 值捕获列表  当闭包中引用self时  会自动提示会捕获 需要添加捕获列表  原则和之前一样   对于一直有值得  用unowned  对于可能没有值得用weak
        [unowned self] in
        return "\(self.name) + 默认值"
    }
    
    init(name: String) {
        self.name = name
    }
    
    
    deinit {
        print("销毁了 ")
    }


}
