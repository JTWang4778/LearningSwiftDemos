//
//  ViewController.swift
//  11-循环引用解决
//
//  Created by 王锦涛 on 2017/5/2.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            1,两个实例之间的循环引用以及解决
            2，闭包循环引用的解决
         */
        
//        test1()
        
//        test2()
        
        test4()
    }
    // 闭包引起的循环引用
    func test4() {
        
//        class HTMLTEST {
//            
//            let name: String
//            
//            var colure:() -> String = {
//                
//                return "默认值"
//            }
//            
//            init(name: String) {
//                self.name = name
//            }
//            
//            
//            deinit {
//                print("销毁了 ")
//            }
//            
//        }
//        
        
        let html = HTMLTEST.init(name: "dev")
        
        print(html.colure())
        
    }
    // 相互引用 并且会一直值  中间不会为nil
    func test3() {
        
//        class City{
//            let name: String
//            unowned let country: Country
//            init(name: String, coutry: Country) {
//                self.name = name
//                self.country = coutry
//            }
//        }
//
//        
//        class Country {
//            let name: String
//            let capitalCity: City!
//            
//            
//            init(name: String,capitalName: String) {
//                self.name = name
//                capitalCity = City(name: capitalName, coutry: self)
//            }
//        }
        
    }
    
    // 测试无主引用
    func test2() {
        /*
            当两个实例之间的相互引用属性  在实例的声明周期中  可能为nil  就应该使用weak  弱引用。如果实例的什么周期中 属性的值一直存在 就要用无主引用了
         */
        
        class Customer {
            let name : String
            var card: CreditCard?
            
            init(name: String) {
                self.name = name
            }
            
            deinit {
                print("Customer 销毁")
            }
            
        }
        
        class CreditCard {
            
            let number: Int64
            
            // 无主引用 用关键字 unowned 表示  和weak一样 不会引用实例
            unowned let user: Customer
            init(number: Int64,user: Customer) {
                self.number = number
                self.user = user
            }
            
            deinit {
                print("CreditCard 销毁")
            }
            
        }
        
        
        var user: Customer?
        var card: CreditCard?
        user = Customer.init(name: "tom")
        card = CreditCard.init(number: 13435456, user: user!)
        user!.card = card
        
    }
    // 对于两个实例之间 相互引用的属性 的值都有可能为nil的时候  可以使用如弱引用解决循环引用
    func test1() {
        
        class Person {
            let name: String
            
            // 弱引用 weak关键字表示  一般放在变量定义的前面 不会改变引用属性的引用计数
            weak var apartment:Apartment?
            init(name: String) {
                self.name = name
            }
            
            deinit {
                print("Person被销毁了")
            }
        }
        
        class Apartment {
            let unit: String
            init(unit: String) {
                self.unit = unit
            }
            
            weak var tenant: Person?
            
            
            deinit {
                print("Apartment 销毁")
            }
        }
        
        var p: Person?
        var a: Apartment?
        p = Person.init(name: "阿斯蒂芬")
        a = Apartment.init(unit: "23")
        p!.apartment = a
        a!.tenant = p
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

