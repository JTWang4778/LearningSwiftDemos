//
//  ViewController.swift
//  002-Dictionary
//
//  Created by 王锦涛 on 2017/4/16.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        creatDictionary()
//        readAndWriteDict()
        enumateDict()
    }
    
    func enumateDict() {
        let dict3: [Int:String] = [1:"11",2:"22222",3:"3333333"]
        for (key, value) in dict3 {
            print("key = \(key), value = \(value)")
        }
        
        
        // 遍历keys
        for key in dict3.keys {
            print(key)
        }
        
        // 遍历valus
        for value in dict3.values {
            print(value)
        }
        
        // 按照键值递增遍历
        for key in dict3.keys.sorted() {
             print("key = \(key), value = \(dict3[key]!)")
        }
    }
    
    func readAndWriteDict() {
        var dict3: [Int:String] = [1:"1",2:"2",3:"3"]
        if dict3.isEmpty {
            print("字典是空的")
        }else{
            print("字典有 \(dict3.count) 个键值对")
        }
        
        // 修改字典中的值
        dict3[1] = "111111"
        print(dict3)
        
        // 如果当前字典中 没有该键  则自动添加键值
        dict3[6] = "6"
        print(dict3)
        
        // 另外一种修改方法  该方法返回一个可选值 如果之前有值的话 就返回 没有的话就返回 nil
        let oldValueOptional = dict3.updateValue("66666", forKey: 6)
        print(dict3)
        
        if let oldVaule = oldValueOptional {
            print(oldVaule)
        }
        
        
        
        // 删除键值 方法1
        dict3[1] = nil
        print(dict3)
        
        // 方法2
        if let oldValue = dict3.removeValue(forKey: 65) {
            print(oldValue)
        }else{
            print("字典中没有该键")
        }
        
        
        
        
    }
    
    func creatDictionary() {
        
        // 创建空字典
        var dict = [Int: String]()
        dict[2] = "222"
        print(dict)
        
        // 利用字面量创建字典
        var dict3: [Int:String] = [1:"1",2:"2",3:"3"]
        print(dict3)
    }

    


}

