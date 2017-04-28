//
//  ViewController.swift
//  09-继承
//
//  Created by 王锦涛 on 2017/4/28.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            1,子类可以继承的东西
            2，重写方法
            3，重写属性  getter  和 setter
            4，给集成来的属性  添加属性观察器
            5，防止重写
         */
        
//        let asdf = Vehicle()
//        asdf.currentSpeed = 88
//        print(asdf.description)
        
        // 子类 可以继承父类的所有 方法  实例属性  下标，并且可以自己定制实现。
//        let train = Train()
//        train.currentSpeed = 300
//        print(train.description)
//        train.makeNoise()
        
        
        // // 重写属性的getter   可以把父类的只读属性 重写为读写属性。但是不能把父类的读写属性 重写为只读属性。 当给重写的属性添加setter的时候  一定要添加getter  不能单独添加setter
//        let car = Car()
//        car.currentSpeed = 120
//        print(car.description)
        
        // 给继承来的属性添加属性观察器
        let autoCar = AutomaticCar()
        autoCar.currentSpeed = 120
        print(autoCar.gear)
        
    }
    func testFinal() {
        
        class Vehicle{
            
            final var currentSpeed = 0.0
            
            final var descre: String {
                return "asdfa"
            }
            
            final func makeNoise() {
                print("wowowow")
            }
        }
        
        /*
            final 防止被重写
         */
        
        class Car : Vehicle {
//            asdfasdfasdfasdf
//            override func makeNoise(){
//                print("asf")
//            }
        }
        
    }
    
    // 给继承来的属性添加属性观察器
    class AutomaticCar: Car {
        
        /*
            注意： 
            1，不要给集成来的常量属性 或者  只读属性添加属性观察器  因为他们的值是不能更改的，即使添加了也不会触发
            2，不能同时给继承来的属性 添加getter setter 和属性观察器， 如果需要同时使用 可以不添加观察期 在getter setter方法中可以添加值得改变
        */
        override var currentSpeed: Double
            {
            
            willSet{
                gear = Int(newValue / 10.0) + 1
            }
        }
    }
    
    
    // 重写属性的getter 和 setter
    class Car: Vehicle {
        
        var gear = 0
        override var description: String
            {
            return "\(super.description) + Car 重写"
        }
    }
    
    // 子类
    class Train: Vehicle {
        
        // 重写方法
        override func makeNoise() {
            print("呜呜呜。。。。")
        }
    }
    
    // 基类
    class Vehicle {
        
        var currentSpeed = 0.0
        
        var description: String {
            return "当前速度为\(currentSpeed)km/h"
        }
        
        func makeNoise() {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

