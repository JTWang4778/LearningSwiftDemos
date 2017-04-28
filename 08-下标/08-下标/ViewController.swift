//
//  ViewController.swift
//  08-下标
//
//  Created by 王锦涛 on 2017/4/28.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        /*
            1,下标 [] 提供了一种快速存取值得方式。可以用在类、结构体和枚举中
            2，语法： 定义的时候用subscript 表示    实例名称[]
         */
        /// 'subscript' functions may only be declared within a type
        
        testMatrix()
    }
    func testTimesTabel() {
        
        var aasd = TimesTable.init(multiplier: 3)
        print(aasd[6])
        aasd[6] = 234
        //        print(aasd[6,3])
    }
    
    struct TimesTable {
        var multiplier: Int
        
        // 定义语法
//        subscript (a:Int) -> Int {
        // 只读下标
//            return a * multiplier
//        }
        
        // 类似于计算型属性 可以
        subscript (a:Int) -> Int {
            // 获取值
            get{
                return a * multiplier
            }
            
            // 设置值 默认参数名newValue
            set{
                print(newValue)
            }
        }
        
//        subscript (a:Int,b: Int) -> Int {
//            return a * multiplier * b;
//        }
        
        subscript (a:Int,b: Int) -> String {
            return "\(a * multiplier * b) str";
        }
    }
    
    
    struct Matrix {
        let rows: Int, colums: Int
        var grid: [Double]
        
        init(row: Int, colum:Int) {
            self.rows = row
            self.colums = colum
            grid = Array(repeating: 0.0, count: row * colum)
        }
        
        func indexIsValidForRow(row: Int,colum: Int) -> Bool {
            return row >= 0 && row < self.rows && colum >= 0 && colum < self.colums
        }
        
        subscript (row: Int, colum: Int) -> Double {
            get{
                assert(indexIsValidForRow(row: row, colum: colum), "Index out of range")
                return grid[row * self.colums + colum]
            }
            
            set{
               assert(indexIsValidForRow(row: row, colum: colum), "Index out of range")
                grid[row * self.colums + colum] = newValue
            }
        }
    }

    func testMatrix() {
        
        var mat = Matrix.init(row: 3, colum: 3)
//        for i in 0..<3 {
//            for j in 0..<3{
//                print(mat.grid[i*3+j])
//            }
//        }
        
        mat[0,0] = 12.2
        print(mat[0,0])
        
        // assert  断言 当条件不成立的时候 在debug下会崩溃
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

