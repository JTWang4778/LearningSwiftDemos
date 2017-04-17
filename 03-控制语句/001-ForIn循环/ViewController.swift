//
//  ViewController.swift
//  001-ForIn循环
//
//  Created by 王锦涛 on 2017/4/17.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        testSwitch()
        testGuard()
        
    }
    
    func testGuard() {
        /*
            1,和if语句一样  guard语句也需要一个Bool值的条件  
            2，guard语句后面 一般跟一个包含return的else语句  
            3，只有当条件为假的时候  才会执行else里面的语句 不然执行else后面的语句   和if语句相反
         */
        let a = 12
        // 保证a < 10
        guard a < 10 else {
            print("a > 10")
            return
        }
        print("a < 10")
    }
    func testSwitch() {
        /*
         OC中 switch语句的特点
         1，默认是穿透的  所以一般会在后面加上break
         2，OC的选择值  仅限于int类型
         3，
         
         swift 的switch语句
         1，不仅可以选择 int类型  可以对任何类型的数据进行选择
         2，默认不是穿透的  自带break  如果想要穿透  有两种实现方式  使用fallthrough 关键字  或者 多个case写在一起 用逗号分隔
         3，
         */
        
        // 重复匹配
//        for i in 1...10 {
//            let a = i / 1
//            switch a {
//            case 0,1,2,3,4,5:
//                print("不及格")
//            case 6,7:
//                print("及格")
//            case 8,9:
//                print("优秀")
//            default:
//                print("满分")
//            }
//        }
        
//        for i in 1...10 {
//            let a = i / 1
//            switch a {
//            case 0...5: // 也可以匹配范围
//                print("不及格")
//            case 6,7:
//                print("及格")
//            case 8,9:
//                print("优秀")
//            default:
//                print("满分")
//            }
//        }
        
        // fallthrough 关键字的使用
        
        for i in 1...10 {
            switch i {
            case 1,2,3:
                fallthrough
            case 4,5:
                print("不及格")
            default:
                print("及格")
            }
        }

    }
    
    func whileTest() {
        // while 循环  先判断条件  然后执行循环体 不满足条件结束循环
        var i = 2
        while i < 100 {
            i = i * i
        }
        print(i)
        
        // repeat while  先执行循环体 然后判断条件是否满足 如果不满足 结束循环
        var a = 6
        repeat {
            a = a * 2
        } while (a < 100)
        print(a)

    }
    
    func forinTest() {
        //forin循环可以遍历集合中的所有元素 例如 可以遍历  Range范围 Array数组  和 String中的字符
        
        // 遍历范围
        for i in 1...5 {
            print(i)
        }
        
        
        
        // 遍历数组
        let arr = ["Eggs","Apple","Pigs"]
        for item in arr {
            print(item)
        }
        
        
        // 遍历字典
        let dict = ["1":"1111", "2":"2222", "3":"333333"]
        for (key, value) in dict {
            print("\(key) = \(value)")
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

