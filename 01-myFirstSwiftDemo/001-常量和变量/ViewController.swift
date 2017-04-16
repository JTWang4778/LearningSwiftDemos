//
//  ViewController.swift
//  001-常量和变量
//
//  Created by 王锦涛 on 2017/4/13.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
            1,自动类型推断
            2，类型安全检查
            3,变量命名
         */
        
        var constant = 123
        constant = 23
        print(" 我要打印啦 \(constant)");
        
        var variable = 123
        variable = Int(22.5)
        print(" 我要打印啦 \(variable)");
        
        let 💗 = "心心"
        print(💗)
        
        
        
        let asdf : Int?
        asdf = 23
        print(asdf ?? 0)
        print(asdf!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

