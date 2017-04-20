//
//  ViewController.swift
//  0501-逃逸闭包
//
//  Created by 王锦涛 on 2017/4/20.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var x = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 逃逸闭包 当函数参数有闭包 并且改闭包在函数返回之后才执行 这样的闭包就叫做逃逸闭包. 逃逸闭包需要在类型前面加上 @escaping 修饰(如果函数闭包参数 在闭包体中有外部引用 而没有用修饰符修饰   会编译错误 )
        
        //  2.逃逸闭包在使用的时候  闭包函数体内如果要访问外部的常量或者变量  需要使用self显示指明
        let instance = NewClass()
        instance.doSomething()
        print(instance.x)
        instance.handlers.first!()
        print(instance.x)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

