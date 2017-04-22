//
//  ViewController.swift
//  06-枚举
//
//  Created by 王锦涛 on 2017/4/22.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    enum Plante {
        case mercury, venus, earth, asdf
    }

    indirect enum ArthmeticExpression{
        case Number(Int)
        case Addition(ArthmeticExpression,ArthmeticExpression)
        case Multiplication(ArthmeticExpression,ArthmeticExpression)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            1, 枚举的定义
            2，枚举的关联值
            3，枚举的原始值   
            4，递归枚举
         */
//        test3()
        test4()
    }
    
    func test4() {
        /*
            递归枚举： 是一种枚举类型，它有一个或者多个枚举成员使用该枚举类型的实例作为关联值。
            使用关键字indirect 来表示该成员可递归
         */
        
//        enum ArthmeticExpression {
//            case Number(Int)
//            indirect case Addition(ArthmeticExpression,ArthmeticExpression)
//            indirect case Multiplication(ArthmeticExpression,ArthmeticExpression)
//        }
        
        // 可以在枚举类型的前面
        
        let five = ArthmeticExpression.Number(5)
        let four = ArthmeticExpression.Number(4)
        let sun  = ArthmeticExpression.Addition(five, four)
        let product = ArthmeticExpression.Multiplication(sun, ArthmeticExpression.Number(2))
        
        print(evaluate(expression: product))
    }
    func evaluate(expression: ArthmeticExpression) -> Int {
        switch expression {
        case .Number(let n):
            return n
        case .Addition(let n1, let n2):
            return evaluate(expression:n1) + evaluate(expression:n2)
        case .Multiplication(let n1, let n2):
            return evaluate(expression:n1) * evaluate(expression:n2)
        }
    }
    
    func test3() {
        // 原始值n
        enum ASCControlCharacter: Character {
            case Tab = "\t"
            case LineFeed = "\n"
            case CarrageReturn = "\r"
        }
        /*
            原始值和关联值不同  
            1，原始值是在定义枚举类型的时候 预先填充的  而关联值对应于一个枚举类型的常量或者变量 
            2， 对于特定类型的枚举  只要定义过  枚举类型的原始值不能再改变。 而关联值 可以在创建枚举变量后更改
         */
        
        
        
        //  C 中会为枚举类型 自动设置整数类型的原始值 。 在swift中 如果定义枚举类型的原始值为整数和字符串形式时，swift也会自动赋值
        
        
        enum Plant: Int {
            case Mercury = 1 , Earth, Mars
        }
        
//        let a = Plant.Earth
//        print(a.rawValue)
        
        // 当使用字符串作为枚举类型的原始值时，每一个枚举成员的隐式原始值就是他本身
        enum CompassPoint: String {
            case North, South, East, West
        }
        
        let  asd = CompassPoint.East
        print(asd.rawValue)
        
        
        // 使用原始值初始化枚举实例：  如果枚举类型在定义的时候 使用了原始值，那么会自动获得一个利用初始值创建枚举实例的可失败的构造放方法。
        let adfasdf = CompassPoint.init(rawValue: "South")
        if let insta = adfasdf {
            print(insta.rawValue)
        }else{
            print("nil")
        }
    }
    
//    2，枚举的关联值  和C语言中的共用体类似 声明枚举变量可以设置的不同的值类型 但是一个变量 同一时间只能设置成某个类型的值
    func test2() {
        
        enum Barcode {
            case UPCA(Int, Int, Int)
            case QRCode(String)
        }
        
        // 定义一个枚举类型的变量 并赋值 为二维码的形式
        var productBarcode = Barcode.UPCA(8, 778, 32)
        // 从新设置成条形码
        productBarcode = .QRCode("条形码")
        
        
        
        // 对于之前的普通枚举  使用switch  语句 可以检查不同类型的条形码类型 （不同的枚举类型 ）  而对于关联值枚举 switch语句可以提取出来关联值
        switch productBarcode {
        case Barcode.QRCode(let str):
            print("QRcode : \(str)")
        case Barcode.UPCA(let n1, let n2, let n3):
            print("二维码\(n1) \(n2) \(n3)")
        }
        
        
        // 如果一个枚举成员的所有关联值都被提取为常量或者变量，为了简洁  可以只在成员名称前 加上let 或者 var 
        switch productBarcode {
        case let .QRCode(str):
            print(str)
        case let .UPCA(n1, n2, n3):
            print("\(n1) \(n2) \(n3)")
        }
        
        
    }
    
    func test1() {
        // 1，枚举就是为一组相关的值定义了一个共同的类型， C语言中会 为枚举类型的分配整型的原始值，在swift中 枚举成员的原始值类型可以是 字符串  字符 或者 整数 浮点数。
        // 2, swift3.0 的语法风格  枚举名要大写 枚举类型的成员类型名称要小写  如： let color = UIColor.black
        
        enum Compass {
            case north
            case esat
            case west
            case south
        }
        let sd = Compass.esat
        
        
        // 创建枚举类型的常量或者变量的时候  如果已经声明为某个类型  赋值的时候可以直接用 . 出来枚举成员 不用写枚举类型
        var asd = Plante.earth
        let asdfa: Plante = .earth
        
        
        // 使用switch语句的时候 一定要穷举完所有的情况 不然会编译报错
        switch asd {
        case .asdf:
            print("asdf")
        case .earth:
            print("earth")
        case .mercury:
            print("mercury")
        default:
            print("mercury")
        }
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

