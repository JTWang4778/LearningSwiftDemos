//
//  ClassMethodTestSubClass.swift
//  07-方法
//
//  Created by 王锦涛 on 2017/5/22.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ClassMethodTestSubClass: ClassMethodTest {
    
//    override static func classMethodTypeOne(){
//        print("重写的方法")
//        /// Cannot override static method 不能重写static定义的类方法
//    }

    // 1，子类可以重写父类用class定义的类型方法，，不能重写用static定义的类型方法
//       2，子类可以将父类中定义的类型方法重写为static类型的类型方法  这样它的子类就不能重写该方法了
    override static func classMethodTypeTwo() {
        
        print("子类重写 class 方式定义的类方法 ")
    }
    
}
