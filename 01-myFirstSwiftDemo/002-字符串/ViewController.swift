//
//  ViewController.swift
//  002-字符串
//
//  Created by 王锦涛 on 2017/4/14.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    // http://blog.csdn.net/longshihua/article/details/53883949
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 插入 删除
//        var str = "asdfgh"
//        // 在指定位置  插入 单个字符
//        str.insert("1", at: str.startIndex)
//        print(str)
//        
//        
//        // 插入一个字符串 在指定位置  注意 这个方法 接受的参数  是集合类型
//        str.insert(contentsOf: "234".characters, at: str.endIndex)
//        print(str)
//        
        
        /*
         swift学习  —   String截取子字符串
         
         1,String类型 提供的截取字符串的方法
            str.substring(with: Range<String.Index>)
            str.substring(to: String.Index)
            str.substring(from: <#T##String.Index#>)
         2，我们发现参数都和<#T##String.Index#>有关  那么<#T##String.Index#>是什么类型呢？
            因为String类型是基于UNicode标量建立的  所以不同的字符  可能占用不同数量的内存空间 （最明显的例子就是emoji字符 占用两个） 所以如果要查找字符串中指定“位置”的字符 而要从头开始 依次计算当前字符所占空间大小 找下一个字符   所以我们不能再像OC那样使用整数类型的索引  String  为我们提供了其特有的索引类型 <#T##String.Index#>  还提供了相应的计算索引的方法
         
             print(str2)
             print(str2[str2.startIndex])
             // 注意  String的 endIndex 不能作为访问其中字符的下标 因为endIndex 始终指向最后一个字符后面
             print(str2[str2.index(before: str2.endIndex)])
             print(str2[str2.index(after: str2.startIndex)])
             print(str2[str2.index(str2.startIndex, offsetBy: 2)])
         
         
         3，知道了<#T##String.Index#> 那么<#T##Range<String.Index>#>就是 字符串索引类型的范围  用...   或者 ..<  来使用
         
         4,注意点
              （1）截取字符串的时候 创建范围的时候  如果使用 ...  会报错Cannot convert value of type 'ClosedRange<String.Index>'  to expected argument type 'Range<String.Index>' 意思就是传入闭的范围  要使用..<  来表示范围
             （2） 对于一个字符串的Range  不能用于截取另外一个字符串  因为两个字符串的存储结构不一样
         
         */
        
//        str.substring(with: <#T##Range<String.Index>#>)
//        str.substring(to: <#T##String.Index#>)
//        str.substring(from: <#T##String.Index#>)
        // 请求子字符串有三个方法  其中都和<#T##String.Index#>  有关
//        let subStr = str.substring(with: <#T##Range<String.Index>#>)
        
        // 截取子字符串
        var str = "hello, world!  telephone =12345"
        let startIndex = str.startIndex
        let endIndex = str.index(str.endIndex, offsetBy: -5)
        let range = startIndex..<endIndex
        //  Cannot convert value of type 'ClosedRange<String.Index>'  to expected argument type 'Range<String.Index>'
        let subStr = str.substring(with: range)
        print(subStr)
        
        
        //
        testStrEqualAnd()
        
    }
    
    func testStrEqualAnd() {
        let str = "asdfasdf"
        let str2 = "asd"
        if str == str2 {
            print("相等")
        }else{
            if str.hasPrefix(str2) {
                print("包含前缀")
            }
        }
    }
    
    func testEmiji() {
        let myNSRange = NSRange(location: 1, length: 3)
        
        let myNSString: NSString = "abcde"
        myNSString.substring(with: myNSRange)
        print(myNSString.substring(with: myNSRange))  // bcd
        
        let myNSString2: NSString = "a😀cde"
        myNSString2.substring(with: myNSRange)
        print(myNSString2.substring(with: myNSRange)) //😀c
    }
    
    
    func test() {
        //
        let str1 = "利用字面量初始化字符串常量"
        print(str1)
        var str2 = ""
        var str3 = String()
        print("\(str2) + \(str3)")
        if str2.isEmpty {
            print("str2.isEmpty")
        }
        
        if str3.isEmpty {
            print("str3.isEmpty")
        }
        
        
        str3 = str2 + "asdf"
        print(str3)
        
        
        // 字符串的可变于不可变   在swift  可以把str类型定义成变量 这样就可变  定义成常量 这样就不可变
        
        
        // String类型是  值类型  和结构体和枚举一样  当传递函数参数是  进行值拷贝
        for char in str3.characters {
            print(char)
        }
        
        
        // 字符串拼接
        
        // 直接 +  拼接
        str3 += "pingjie"
        print(str3)
        
        // 可以调用String的 append 方法  在末尾添加单个字符   注意  是字符 不是字符串
        str3.append("3")
        print(str3)
        
        // 格式化字符串
        
        str2 = "str3 = \(str3)"
        print(str2)
        
        
        
        //  通过String  提供的索引方法   修改字符串 因为String 类型是基于UNicode标量建立的  所以不同的字符  可以占用不同数量的内存空间  不能像修改数组中某个元素一样通过指定下标去修改  而要从头开始 遍历 一次找下一个字符   String  为我们提供了寻找位置的API
        print(str2)
        print(str2[str2.startIndex])
        // 注意  String的 endIndex 不能作为访问其中字符的下标 因为endIndex 始终指向最后一个字符后面
        print(str2[str2.index(before: str2.endIndex)])
        print(str2[str2.index(after: str2.startIndex)])
        print(str2[str2.index(str2.startIndex, offsetBy: 2)])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

