//
//  ViewController.swift
//  01-myFirstSwiftDemo
//
//  Created by 王锦涛 on 2016/11/8.
//  Copyright © 2016年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var panView : UIView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
            这里主要测试了  使用swift 中  各种手势的使用方法 和 按钮的创建和使用
         */
        
        let view1 = UIView(frame: CGRect(x: 0, y: 20, width: 100, height: 100))
        view1.backgroundColor = UIColor.red
        self.view.addSubview(view1)
        
        
        
        let view2 = UIView(frame: CGRect(x: 100, y: 100, width: 20, height: 20))
        view2.backgroundColor = UIColor.yellow
        self.view.addSubview(view2)
        
        
        
        let button1 = UIButton(type: .custom)
        button1.setTitle("喜欢我就点我", for: .normal)
        button1.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
        button1.setTitleColor(UIColor.black, for: .normal)
        button1.backgroundColor = UIColor.gray
        // 添加带参数的点击事件
        button1.addTarget(self, action:#selector(didClickButton(sender:)), for:UIControlEvents.touchUpInside)
        self.view.addSubview(button1)
        
        
        
        let button2 = UIButton()
        button2.setBackgroundImage(UIImage(named: "chat"), for: .normal)
//        button2.setImage(UIImage(named: "chat"), for: .highlighted)
        button2.frame = CGRect(x: 200, y: 200, width: 100, height: 100)
        //  设置高亮状态下 是否调整图片的显示
        button2.adjustsImageWhenHighlighted = false
        
        // 添加点击事件 不传值
//        button2.addTarget(self, action: #selector(didClickButton2), for: .touchUpInside)
//        button2.addTarget(self, action: #selector(didClickButtonsd(sender:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(ViewController.didClickButton2), for: .touchUpInside);
        self.view.addSubview(button2)
        
        
        
        
        let view3 = UIView(frame: CGRect(x: 200, y: 300, width: 200, height: 200));
        view3.backgroundColor = UIColor.orange;
        view3.isUserInteractionEnabled = true;
        self.view.addSubview(view3);
        
//        let swipeRight : UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: #selector(ViewController.receiveSwipe(sender:)))
//        // 设置检测的滑动方向  默认是向右划
////        swipe.direction = .left
//        view3.addGestureRecognizer(swipeRight)
//        
//        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(receiveSwipe(sender:)))
//        swipeLeft.direction = .left
//        view3.addGestureRecognizer(swipeLeft)
        
        
        // addTapGesture
//        let tap = UITapGestureRecognizer(target: self, action: #selector(receiveTap(sender:)))
//        view3.addGestureRecognizer(tap)
        
        
        // addPinchGesture 
//        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(receivePinch(sender:)))
//        view3.addGestureRecognizer(pinch)
        
        // addRotationGesture
//        let rotation = UIRotationGestureRecognizer(target: self, action: #selector(receiveRotation(sender:)))
//        view3.addGestureRecognizer(rotation)
        
        
        // addPanGesture 添加拖动手势
//        let pan = UIPanGestureRecognizer(target: self, action: #selector(receivePan(sender:)))
//        panView = view3
//        pan.maximumNumberOfTouches = 1;
//        view3.addGestureRecognizer(pan)
        
        
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(receiveLongPress(sender:)))
        longPress.numberOfTapsRequired = 0; // 默认为0
        longPress.numberOfTouchesRequired = 1; // 默认为1
        longPress.minimumPressDuration = 3 // 长按触发事件  默认是0，5秒
        view3.addGestureRecognizer(longPress)
        
        
        
        
        
        
        
    }
    
    
    func receiveSwipe(sender : UISwipeGestureRecognizer) -> Void {
        
        if sender.direction == .left {
            print("向左滑动了")
        }else{
            print("向右滑动了")
        }
        
    }
    
    func receiveTap(sender : UITapGestureRecognizer) -> Void {
        print("诶呀  你点了我")
    }
    
    func receivePinch(sender: UIPinchGestureRecognizer) -> Void {
        print("%f,%f",sender.scale,sender.velocity)
    }
    
    
    func receiveRotation(sender: UIRotationGestureRecognizer) -> Void {
        print(sender.rotation)
        print(sender.velocity)
    }
    
    func receivePan(sender: UIPanGestureRecognizer) -> Void {
        
        let point = sender.location(in: sender.view)
        panView?.center = point
    }
    
    func receiveLongPress(sender: UILongPressGestureRecognizer) -> Void {
        print(sender.minimumPressDuration)
    }
    
    func didClickButton(sender : UIButton) -> Void {
        print("诶呀   你点到我了")
    }
    
    func didClickButton2(){
        print("诶呀 妈呀  你有点我啦")
    }
    
    func didClickButtonsd(sender : UIButton) -> Void {
        print("阿斯蒂芬")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

