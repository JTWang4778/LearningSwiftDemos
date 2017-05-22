//
//  ViewController.swift
//  06-属性
//
//  Created by 王锦涛 on 2017/4/26.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        /*
            1,存储属性 就是存储在特定类型的结构体和类中的常量或者变量。存储属性能用在结构体和类中，
            2，计算属性： 不存储具体的值
            3，属性观察器
            4, 类型属性
         */
        
//        test1()
        
//        test2()
        
//       test3()
        
        test4()
    }
    // 4, 类型属性
    func test4() {
        
        struct SomeStruct {
            // 存储型类型 属性
            static var p = "asdf"
            // 计算型类型属性
            static var computedP: Int{
                return 1
            }
        }
        
        
        enum SomeEnum{
            // 枚举类型不可以定义存储型属性 可以包含存储型类型属性
            static var p = "asdf"
            static var computedP: Int {
                return 6
            }
        }
        
        class SomeClass{
            static let p = "asdfasdf"
            static var computedP : Int {
                return 44
            }
            
            // 可以使用class  定义  可以被子类重写的计算型类型属性
            class  var overridedComputedP: Int {
                return 108
            }
        }
        
        class SomeClassSubClass : SomeClass{
            
           override class var overridedComputedP : Int {
                return 31
            }
        }
        
        
        // 使用
        print(SomeStruct.p)
        SomeStruct.p = "重新赋值"
        print(SomeStruct.p)
        
        
        
        struct AudioChannel{
            static let shouldLevel = 10
            static var maxInputLevel = 0
            
            var currentLevel: Int = 0 {
                didSet{
                    if currentLevel >  AudioChannel.shouldLevel{
                        currentLevel = AudioChannel.shouldLevel
                    }
                    
                    if currentLevel > AudioChannel.maxInputLevel {
                        AudioChannel.maxInputLevel = currentLevel
                    }
                }
            }
        }
        
        var leftChannnel = AudioChannel()
        
        leftChannnel.currentLevel = 8
        print(AudioChannel.maxInputLevel)
        var rightChannel = AudioChannel()
        rightChannel.currentLevel = 88
        print(AudioChannel.maxInputLevel)
        
    }
    
    // 3,属性观察器
    func test3() {
        
        class StepCounter {
            
            var totalSteps: Int = 0{
                
                willSet{
                    print(newValue)
                    // 在设置新值之前  
                }
                didSet{
                    print(oldValue)
                }
            }
        }
        
        let counter = StepCounter()
        print(counter.totalSteps)
        counter.totalSteps = 100
        print(counter.totalSteps)
        
    }
    // 2，计算属性: 不存储具体的值，，而是通过getter  或者 一个可选的settter  来间接的获取或者设置变量值得属性。  计算属性可以用在  类 结构体和枚举中
    func test2() {
        
        struct Point {
            var x = 0.0,y = 0.0
        }
        
        struct Size {
            var width = 0.0,height = 0.0
        }
        
        struct Rect {
            var origin = Point()
            var size = Size()
            var center: Point{
                
                get {
                    return Point.init(x: origin.x + size.width * 0.5, y: origin.y + size.height * 0.5)
                }
                
                
//                set {
//                    //  计算属性  set方法 默认参数名newValue  也可以指定参数名
//                    origin.x = newValue.x - size.width * 0.5
//                    origin.y = newValue.y - size.height * 0.5
//                }
                
                //  自己指定set方法 参数名
                set (new){
                    origin.x = new.x - size.width * 0.5
                    origin.y = new.y - size.height * 0.5
                }
            }
        }
        
        
        
        var rect = Rect()
        rect.origin = Point.init(x: 100, y: 100)
        rect.size = Size.init(width: 400, height: 400)
        print(rect.center)
        
        
        
        // 计算属性在声明的时候必须用var 声明成变量 以为计算型属性的值是变的  如果声明成常量，在初始化之后就不能再修改了
        
        
        struct Cuboid {
            var width = 0.0, height = 0.0, depth = 0.0
            
            var volume: Double {
                return width * height * depth
            }
        }
        
        let asdf = Cuboid.init(width: 100, height: 2, depth: 2)
        print(asdf.volume)
        
        
    }
    
    // 1,存储属性
    func test1() {
        
        struct Range {
            var firstValue:Int
            let length: Int
        }
        
        var range = Range.init(firstValue: 4, length: 2)
        range.firstValue = 8
        //        range.length = 3  因为在定义的时候 length 被声明成了常量 所以创建之后 不能更改length属性的值
        print("firstValue = \(range.firstValue)")
        
        
        // 结构体常量中的存储属性  及时定义成变量 也不能更改其中属性的值 否则会报错
        let range2 = Range.init(firstValue: 0, length: 4)
//        range2.firstValue = 3  Cannot assign to property: 'range2' is a 'let' constant
        print("firstValue = \(range2.firstValue)")
        
        
        // 延迟存储属性 或者叫懒加载  用lazy 声明在定义的前面
        let lazy = lazyTestClass()
        print(lazy)
        print(lazy.view)
        print(lazy.view)
        print(lazy.view)
        
        
    }
    
    
    class lazyTestClass: NSObject {
        
        // 注意： 延迟储存属性要声明成var  变量。 因为属性的初始值可能在实例构造完成后才能得到，而常量在构造完成之前必须要有初始值，所以要声明成变量
        lazy var view:UIView = {
            print("懒加载")
            return UIView()
        }()
    
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

