//
//  ViewController.swift
//  13-协议
//
//  Created by 王锦涛 on 2017/5/2.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let textView = NoteView.noteView()
        textView.frame = CGRect.init(x: 0, y: 0, width: 300, height: 300)
        textView.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        textView.delegate = self
        textView.submitClosure = {
            (content) in
            print("闭包执行成功+ \(content)")
            self.navigationController!.pushViewController(SecondViewController(), animated: true)
        }
        self.view.addSubview(textView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
//
extension ViewController: NoteViewDelegate {
    func didClickSubmitButton(withContent: String) {
        print(withContent)
    }
}

