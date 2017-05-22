//
//  ClassMethodTest.swift
//  07-方法
//
//  Created by 王锦涛 on 2017/5/22.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ClassMethodTest: NSObject {
    
    // 定义类型方法有两种方式   static  和  class
    static func classMethodTypeOne() {
        print("static 方式定义的类方法  不能被其子类重写")
    }
    
    
    class func classMethodTypeTwo() {
        
        print("class 方式定义的类方法  能被其子类重写")
    }

}
