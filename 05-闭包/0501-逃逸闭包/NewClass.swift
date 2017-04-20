//
//  NewClass.swift
//  05-闭包
//
//  Created by 王锦涛 on 2017/4/20.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit



class NewClass: NSObject {
    
    var x = 10
    var handlers:[() -> Void] = []
    
    func funcWithEscapeClosure(completeHandler: @escaping () -> Void) {
        self.handlers.append(completeHandler)
    }
    
    func funcWithoutEscapeClosure(completeHandler: () -> Void) {
        completeHandler()
    }
    
    func doSomething() {
        funcWithEscapeClosure {
            self.x = 100
        }
        
        funcWithoutEscapeClosure {
            x = 200
        }
    }

}
