//
//  ViewController.swift
//  05-闭包
//
//  Created by 王锦涛 on 2017/4/20.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var success: (()->String)?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
            1,闭包：  闭包是自包含的代码块，可以在代码中被传递和使用。和OC中的block和 其他语言中的匿名函数类似。
            闭包可以捕获和存储其所在上下文中的任意常量和变量的引用。所以在闭包中引用闭包所有者 self的时候  要避免循环引用
            2，闭包表达式：是一种利用简洁的语法构建内联闭包的方式。闭包表达式有以下有点：
                # 利用上下文推断参数和返回值类型
                # 隐式返回单表达式函数， 当单表达式闭包可以省略return 关键字
                # 参数名称缩写  可以在闭包中用$0  $1  $2 代表第一个  第二 个参数  而不需要用参数名
                # 尾随闭包语法， 当函数的最后一个参数是闭包的时候 ，小调用函数的时候 可以使用尾随闭包
         */
        
        
        let arr = ["iOS","Asdf","UI","Bad","Red","OFDFF"]
        // sorted() 对数组进行排序 并返回排序后的数组  对原数组没有影响
//        let sortArr = arr.sorted()
//        print(arr)
//        print(sortArr)
        
        
        /// 1,先定义函数 然后调用的时候 传入函数名
//        let sortedArr = arr.sorted(by: backforword)
//        print(sortedArr)
        
        //2, 利用闭包表达式语法 直接
//        let sortedArr = arr.sorted(by: {
//            (s1: String, s2: String) -> Bool in
//            return s1 < s2
//        })
//        print(sortedArr)
        
        // 3， 闭包表达式 可以自动推断出函数参数和返回值类型 
//        let sortedArr3 = arr.sorted(by:{
//            (str1,str2) in
//            return str1 > str2
//        })
//        print(sortedArr3)
        
        // 4, 闭包表达式语法  单表达式隐式返回。
//        let sortedArr4 = arr.sorted(by: { (s1, s2) in s1 > s2 })
//        print(sortedArr4)
        
        // 5，参数名称缩写
//        let sortedArr5 = arr.sorted(by:{$0 < $1})
//        print(sortedArr5)
        
        // 6，尾随闭包
//        test6()
        
        // 7，值捕获  闭包是引用类型
        
        
//        let incrementByTen = makeIncrementer(amount: 10)
//        
//        print(incrementByTen())
//        print(incrementByTen())
//        print(incrementByTen())
//        
//        let incrementBy7 = makeIncrementer(amount: 10)
//        print(incrementBy7())
//        print(incrementByTen())
//        
//        let asdf = incrementByTen
//        print(asdf())
        
        // 8，逃逸闭包
        escapeClosureTest(closure: ){ return "逃逸闭包执行" }
        
        print(success!())
    }
    
    func backforword(_ str: String, _ str2: String) -> Bool {
        return str > str2
    }
    // 8，逃逸闭包 当函数参数有闭包 并且改闭包在函数返回之后才执行 这样的闭包就叫做逃逸闭包. 逃逸闭包需要在类型前面加上 @escaping 修饰(如果函数闭包参数 在闭包体中有外部引用 而没有用修饰符修饰   会编译错误 )
    func escapeClosureTest(closure: @escaping () -> String) {
        success = closure
        print("调用函数")
    }
    
    
    // 7,值捕获  闭包可以在其定义的上下文中 捕获常量或者变量 即使这些常量或者变量的原作用域已经没有了
    func makeIncrementer(amount: Int) -> () -> Int {
        
        var total = 0
        func increment() -> Int {
            total = total + amount
            return total
        }
        return increment
    }
    
    func test6() {
        let arr = ["iOS","Asdf","UI","Bad","Red","OFDFF"]
        let sortedArr6 = arr.sorted(by:){$0 > $1}
        print(sortedArr6)
        
        
        let digitalNames = [0:"Zero",1:"One",2:"Two",3:"Three",4:"Four",5:"Five",6:"Six",7:"Seven",8:"Eight",9:"Nine"]
        let numbers = [345,56,88]
        let strings = numbers.map { (nu) -> String in
            var number = nu
            var output = ""
            repeat {
                output = digitalNames[number % 10]! + output
                number = number / 10
            } while number > 0
            return output
        }
        
        print(strings)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

