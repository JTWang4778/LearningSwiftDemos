//
//  ViewController.swift
//  10-构造过程
//
//  Created by 王锦涛 on 2017/4/30.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    /*
        1,什么是构造过程？
            是使用类、结构体和枚举实例之前的准备过程，包括为所有的存储属性设置初始值和执行其他的初始化操作。
        2，存储属性的初始赋值
            有两种方式： 一是 在定义存储属性的时候设置默认值。 二是在构造函数中 给存储属性设置值，无论存储属性是常量还是变量 
            注意： 当给存储属性设置默认值或者在构造函数中赋值时是不会触发存储属性的属性观察器的
        3，自定义构造函数
        4, 默认构造器 和 逐一成员构造器
    */
    override func viewDidLoad() {
        super.viewDidLoad()
//        test3()
        test5()
    }
    
    func test6() {
        
        class Food {
            var name: String
            init(name: String) {
                self.name = name
            }
            
            convenience init(){
                
                self.init(name: "food")
            }
        }
        
        
        class ManTou: Food{
            var quantity: Int
            
            init(name: String, quantity:Int) {
                self.quantity = quantity
                super.init(name: name)
            }
            
            convenience override init(name: String) {
                self.init(name: name, quantity: 0)
            }
            
        }
    }
    
    func test5() {
        
        class Vehicle {
            var numberOfWheels: Int = 0
            var description: String {
                return "\(numberOfWheels) 个轮子"
            }
        }
        
        class Bicycle: Vehicle {
            
            override init() {
                // 首先调用父类的构造函数
                super.init()
                // 设置集成来的变量属性， 不能修改继承来的常量属性
                numberOfWheels = 2
            }
        }
        
        let bycicle = Bicycle()
        print(bycicle.numberOfWheels)
    }
    func test4() {
        /*
            1,默认构造器: 如果结构体或者类的所有存储型属性都有默认值，并且没有自定义构造器的话，那么这时候会自动获得一个没有参数的名字为init的默认构造器
            2，对于结构体，会有一个逐一成员构造器，即使其中的有些存储属性没有设置默认值
         */
    }
//    3，自定义构造函数
    func test3() {
        
        struct Celsia {
            var temperatureInCels: Double
            
            init(fromF F:Double) {
                temperatureInCels = (F - 32.0) / 1.8
            }
            
            init(fromK K: Double) {
                temperatureInCels = K - 273.5
            }
        }
        let c1 = Celsia.init(fromF: 23232)
        print(c1.temperatureInCels)
        let c2 = Celsia.init(fromK: 200)
        print(c2.temperatureInCels)
        
        
        //  当结构体或者类中定义了存储属性  并且没有指明默认值 也没有提供构造函数会报错： Class 'SurveryQuestion' has no initializers
        class SurveryQuestion {
            var text: String
            var answer: String?
            init(text: String) {
                // 如果构造器中没有给所有的存储属性指定初始值  会编译的时候出错 Return from initializer without initializing all stored properties
                print("asdf")
                self.text = text
            }
        }
        
        let survey = SurveryQuestion.init(text: "who are you? ")
        survey.answer = "阿斯顿发生"
        print(survey.answer!)
    }
    
    // 2，存储属性的初始赋值
    func test2() {
        
        struct Faaer {
            var temperature: Double
            
            init() {
                temperature = 12
            }
        }
        
        struct Faaer2 {
            var temperature: Double = 0.0
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

