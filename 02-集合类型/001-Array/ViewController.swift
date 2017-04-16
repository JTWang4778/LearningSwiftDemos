//
//  ViewController.swift
//  001-Array
//
//  Created by 王锦涛 on 2017/4/16.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // 1，数组的创建
//        creatArray()
        // 2,访问和修改数组
//        readAndWriteArr()
        
        //3， 插入和删除元素
//        insertAndDelete()
        
        // 4，数组的遍历
        enumerateArr()
    }
    func enumerateArr() {
        
        let arr = ["Eggs","Milk","Beef"]
        //1， 直接 遍历数组元素
        for item in arr {
            print(item)
        }
        
        // 2，需要索引的时候。 如果我们同时需要每个数据项的值和索引值，可以使用enumerate()方法来进行数组遍历。enumerate()返回一个由每一个数据项索引值和数据值组成的元组
        for (index,obj) in arr.enumerated() {
            print("arr[\(index)] = \(obj)")
        }
        
        // 2，另外一种遍历方式
        for index in 0..<arr.count {
            print("arr[\(index)] = \(arr[index])")
        }
        
    }
    
    //3， 插入和删除元素
    func insertAndDelete() {
        var arr = ["Eggs","Milk","Beef"]
        arr.insert("插入元素", at: 0)
        print(arr) // 注意 插入的位置是在索引之前

        // 删除元素
        arr.remove(at: 1)
        print(arr)
        
        // 删除最后一个元素  和 删除第一个元素 都提供了相应的方法  这样就不能再访问数组的count了
        arr.removeLast()
        print(arr)
    }
    
    // 2,访问和修改数组
    func readAndWriteArr() {
        var shoppingList = ["Eggs","Milk","Beef"]
        if shoppingList.isEmpty {
            print("数组为空")
        }else{
            print("数组长度为 =  \(shoppingList.count)")
        }
        
        shoppingList.append("红烧肉")
        
        // 可以像OC一样 用下标索引 访问数组中的元素(读取和修改)
        print(shoppingList[0])
        //  修改 
        shoppingList[0] = "修改"
        print(shoppingList)
        
        // 注意 用下标去读写数组元素的时候  一定要注意下标的范围 从0 到 count - 1 不然会报错
        // 错误写法
//        print(shoppingList[shoppingList.count])
        
    }
    
    // 1，数组的创建
    func creatArray() {
        // 创建空的数组
        var arr:[Int] = [Int]()
        print(arr)
        print(arr.count)
        arr.append(3)
        print(arr)
        // 创建带有默认值的数组
        let arr2:[Int] = [Int](repeatElement(4, count: 6))
        print(arr2)
        
        let arr3 = [Double](repeatElement(10.1, count: 3))
        print(arr3)
        
        // 如果两个数组的类型一样  可以直接使用 + 合并成一个数组
        let arr4 = arr + arr2
        print(arr4)
        
        // 利用字面量创建数组
        var strArr:[String] = ["Eggs","Milk"]  // 因为类型推断 所以可以不用声明数组的类型 可以推断出来
        strArr.append("Beef")
        print(strArr)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

