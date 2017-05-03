//
//  NoteView.swift
//  11-循环引用解决
//
//  Created by 王锦涛 on 2017/5/2.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

protocol NoteViewDelegate {
    func didClickSubmitButton(withContent: String)
}

class NoteView: UIView {

    static func noteView() -> NoteView {
        
        return Bundle.main.loadNibNamed("NoteView", owner: self, options: nil)?.last as! NoteView
    }
    
    var delegate: NoteViewDelegate?
    
    var submitClosure: ((String) -> Void)?

    @IBOutlet weak var textField: UITextField!
    @IBAction func didClickSubmit(_ sender: Any) {
        
        
        guard (self.textField.text != nil) else {
            return
        }
        
        guard self.textField.text!.characters.count > 0 else {
            print("输入为空")
            return
        }
        
//        delegateasdf()
        self.textField.resignFirstResponder()
        if self.submitClosure != nil {
            self.submitClosure!(self.textField.text!)
        }
        
    }
    
    
    // 通过代理传值
    func delegateasdf() {
        if self.delegate != nil {
            if self.textField.text == nil {
                print(self.textField.text!)
            }else{
                print(self.textField.text!.characters.count)
            }
            self.delegate!.didClickSubmitButton(withContent:self.textField.text!)
            self.textField.text = nil
        }else{
            print("没有设置代理")
        }

    }
    
}

extension Int {
    
    func dictAtInt() -> Int {
        return 10
    }
    
}

