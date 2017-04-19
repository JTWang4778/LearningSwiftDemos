//
//  ViewController.swift
//  0401-函数类型
//
//  Created by 王锦涛 on 2017/4/20.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 函数类型是参数的参数类型和返回值类型共同决定的 和 其他基本数据类型一样 可以声明  定义  某个函数类型的变量或者常量。然后调用函数
        
        // 函数addSun的类型为 （Int，Int） -> Int
        
        let funName = addSum  // 把函数名赋值给funName  funName类型自动推断为 （Int，Int） -> Int
        print(funName(1,2))
        
        
        test(function: addSum(_:_:), a: 12, b: 23)
    }
    
    
    func addSum(_ a:Int, _ b:Int) -> Int {
        return a + b
    }
    
    // 函数类型 作为参数类型
    func test(function: (Int,Int) -> Int,a:Int,b:Int) -> Void {
        print(function(a,b))
    }
    
    
    // 函数类型 作为返回值类型
    func chooseStep(backword:Bool) -> (Int) -> Int {
        
        func stepForward(a: Int) -> Int{
            return a + 1
        }
        func stepBackward(a: Int) -> Int{
            return a - 1
        }
        if backword {
            return stepBackward(a:)
        }else{
            return stepForward(a:)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

