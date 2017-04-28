//
//  ViewController.swift
//  07-方法
//
//  Created by 王锦涛 on 2017/4/28.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            1,方法： 方法是与特定类型的实例 或者  类型相关联的函数。swift中 类、结构体和枚举都能定义类型或者实例方法。而在OC中只有类能够定义方法。
            2,实例方法
            3,self
            4， mutating : 默认情况下  值类型（结构体和枚举）的实例方法中是不允许修改属性的。如果想要修改的话 需要在方法前面加上mutating 关键修饰 否则编译不通过
            5,在 mutating  方法中修改self
         
            6,类型方法: 与类型关联的函数。只能由类型调用。形式是func前面加上  static 。可以使用关键字class 表示子类可以重写父类的类型方法
         */
        
//        testInstanceMethod()
        
//        testMutating()
        
        testMutatingSelf()
    }
    func testClassMethod() {
        
        struct LevelTracker {
            
            static var heightestUnlockLevel = 1
            
            static func unlockLevel(level:Int){
                if level >  heightestUnlockLevel{
                    heightestUnlockLevel = level
                }
            }
            
            static func levelIsUnlocked(level:Int) -> Bool {
                return level <= heightestUnlockLevel
            }
            
            
            var currentLevel = 1
            
            mutating func addvanceTo(level:Int) -> Bool {
                if LevelTracker.levelIsUnlocked(level: level) {
                    currentLevel = level
                    return true
                }else{
                    return false
                }
            }
            
        }
    }
    
    func testMutatingSelf() {
        
        enum ThreeStateSwitch {
            
            case Off,On,Heigh
            
            mutating func next(){
                switch self {
                case .Off:
                    self = .On
                case .On:
                    self = .Heigh
                default:
                    self = .Off
                }
            }
        }
        
        
        var e = ThreeStateSwitch.Heigh
        e.next()
        print(e)
    }
    // 4， mutating
    func testMutating() {
        
        struct Point {
            var x = 0.0,y = 0.0
            
            // 定义
            mutating func moveByX(x:Double, y: Double) -> Void {
                self.x += x
                self.y += y
            }
            
            // 在mutating 方法中修改self
            mutating func moveBy(_ x:Double,y: Double) -> Void {
                self = Point.init(x: self.x + x, y: self.y + y)
            }
        }
        
        var point = Point()
        // 使用  使用时 值类型的常量属性不能调用可变方法 因为结构体的常量属性 不能修改  不然会报错Cannot use mutating member on immutable value: 'point' is a 'let' constant
        point.moveByX(x: 3, y: 4)
        print("x = \(point.x), y = \(point.y)")
        
        point.moveBy(4, y: 3)
        print("x = \(point.x), y = \(point.y)")
        
        
        
    }
    // 3,self
    func testSelf() {
        
        struct Point{
            var x = 0.0
            var y = 0.0
            
            func isToTheRightOf(x:Double) -> Bool {
                // 当方法参数名和实例的属性名同名的时候 在方法内部 参数名优先级比较高 这时候 self就派上用场了
                return self.x > x
            }
        }
    }
    
    //  2,实例方法
    func testInstanceMethod() {
        
        class Counter {
            var count = 0
            
            func increment() {
                count = count + 1
            }
            
            func incrementBy(_ amount: Int) {
                count = count + amount
            }
            
            func reset() {
                count = 0
            }
        }
        
        
        let counter = Counter()
        print(counter.count)
        counter.increment()
        print(counter.count)
        counter.incrementBy(6)
        print(counter.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

