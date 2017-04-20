//
//  ViewController.swift
//  0502-自动闭包
//
//  Created by 王锦涛 on 2017/4/20.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
        1,自动闭包: 自动创建的 用于包装传递给函数参数的表达式。自动闭包没有参数 有返回值 返回表达式的值
        2，自动闭包的使用 可以省略{} 
        3，可以控制代码的执行时机  比如 高消耗的代码  可以在
     */
    
    var arr = ["234","34","55","asdfsdf"]
    
    var handles: [()-> String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        print(arr.count)
//        
//        let asdf = { self.arr.remove(at: 0) }
//        print(asdf())
//        print(arr.count)
        
//        // 正常闭包
//        noAutoclosure(closure: { self.arr.remove(at: 0) })
//        
//        // 自动闭包  调用的时候 省略了花括号
//        autoclosure(closure: self.arr.remove(at: 0))
        
        
        // 自动逃逸闭包
        auto_EscapeClosure(closure: self.arr.remove(at: 0))
        auto_EscapeClosure(closure: self.arr.remove(at: 0))
        print(self.handles.count)
        for handle in self.handles {
            print(handle())
        }
    }
    
    func noAutoclosure(closure: ()-> String) {
        print(closure())
    }
    
    // 自动闭包
    func autoclosure(closure: @autoclosure ()-> String) {
        print(closure())
    }
    
    // 自动闭包 也可以逃逸 
    func auto_EscapeClosure(closure: @escaping @autoclosure ()-> String ) {
        self.handles.append(closure)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

