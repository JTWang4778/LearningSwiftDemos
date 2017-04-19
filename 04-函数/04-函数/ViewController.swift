//
//  ViewController.swift
//  04-函数
//
//  Created by 王锦涛 on 2017/4/19.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        type1()
//        type2()
//        sayHelloTo(name: "Tom")
//        print(sayHello(name: "Toy"))
        
        
//        let re = minMac(arr: [12,34,45,5675,2342])
//        print("min = \(re.min), max = \(re.max)")
        
        // 5，返回可选值的函数
//        if let result = minMax2(arr:[]) {
//            print(result)
//        }else{
//            print("出错了  数组长度小于1")
//        }
        
        // 6， 函数参数标签
//        greet(to: "jintao")
//        greet("wangjintao")
        
        //7，
//        print(add(num1: 2))  // 调用的时候 没有给默认值参数 赋值 则第二个参数使用的是默认值 1
//        print(add(num1: 2, num2: 4)) // 显示调用
        
        // 8，
//        print(arithmetic(12.3))
//        print(arithmetic(12.3,33,56))
        
        // 9,含有输入输出参数额函数 在调用的时候  也不一样
        var a = 2
        var b = 3
        swap(&a, &b) //参数必须是变量  调用的时候取地址
        print("a = \(a),b=\(b)")
    }
    
    // 1,函数的定义  func 开头 后面跟上函数名   括号里面参数列表  -> 返回值 如果没有返回值 用Void表示 可以省略  用{}表示函数体  具体代码写在里面
    func type1() -> Void {
        print("第一种 无参数 无返回值的函数")
    }
    
    // 省略形式
    func type2(){
        print("没有返回值时 定义函数时  返回值可以省略")
    }
    
    // 2，有参数 无返回值
    func sayHelloTo(name: String){
        print("Hello ! \(name)")
    }
    
    
    // 3，有参数 有返回值
    func sayHello(name: String) -> String {
        return "Hello" + name + "!"
    }
    // 4，返回多重值的函数
    func minMac(arr: [Int]) -> (min: Int,max: Int) {
        var minNumber = arr[0]
        var maxNumber = arr[0]
        for number in arr[1..<arr.count] {
            print(number)
            if number > maxNumber {
                maxNumber = number
            }else{
                if number < minNumber {
                    minNumber = number
                }
            }
        }
        return (minNumber,maxNumber)
    }
    
    // 5，返回可选值的函数
    func minMax2(arr: [Int]) -> (min: Int,max: Int)? {
        guard arr.count > 0 else {
            return nil
        }
        var minNumber = arr[0]
        var maxNumber = arr[0]
        for number in arr[1..<arr.count] {
            print(number)
            if number > maxNumber {
                maxNumber = number
            }else{
                if number < minNumber {
                    minNumber = number
                }
            }
        }
        return (minNumber,maxNumber)
    }
    
    // 6， 函数参数标签  或则叫  外部参数名  每一个函数参数 都有一个参数标签（外部参数名） 在调用函数的时候使用 写在对应参数的前面，而参数的名称在函数的内部使用 所以参数标签又叫外部参数名。   默认情况下 函数使用参数名作为参数标签  当然也可以在定义函数的时候 指定参数标签   或者 直接忽略
    func greet(to name:String) -> Void {
        // 一个参数的参数标签写在参数名的前面  用空格隔开
        print("Hello \(name) !")
    }
    
    // 如果想调用函数的时候  不想使用参数标签 可以忽略
    func greet(_ name: String) {
        print("Hello \(name) !")
    }
    
    
    
    // 7，参数带有默认值的函数  将不带默认值的参数 放在参数列表的前面。一般来说 不带默认值的参数比较重要。将带有默认值的参数放在后面 可以保证函数调用时 不带默认值的参数的顺序是一致的
    func add(num1:Int, num2: Int = 1){
        print("num1 + num2 = \(num1 + num2)")
    }

    
    // 8,可变参数  可以接收一个 或者多个相同类型的参数 不确定 表示为在参数类型后面跟上...
    func arithmetic(_ numbers: Double...) -> Double {
        var total: Double = 0
        for nu in numbers {
            total += nu
        }
        return total / Double(numbers.count)
    }
    
    
    // 9,输入输出参数 inout   函数参数默认是常量  在函数体中是不能修改值的。如果有修改参数的需要的时候 就用到了输入输出参数，定义的时候 需要在函数参数类型前面加上inout关键字即可  调用的时候 也和普通的函数不一样
    func swap(_ a: inout Int,_ b: inout Int ) -> Void {
        let temp = a
        a = b
        b = temp
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

