//
//  ViewController.swift
//  13-约束动画
//
//  Created by 王锦涛 on 2017/5/16.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleViewHright: NSLayoutConstraint!
    
    var itemsView : ItemsView!
    var isOpen = false
    
    var dataArr = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.separatorStyle = .none
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 60
        /*
            约束动画或者约束的方式：
            1，直接拖线  形成属性
            2，通过遍历控件的constraints 约束数组 找到对应的约束 设置值
         */
        
    }
    @IBAction func didClickOpenCloseButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.6, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.4, options: .curveEaseInOut, animations: {
            // 改变高度
            self.titleViewHright.constant = self.isOpen ? 64 : 200
            self.titleLabel.text = self.isOpen ? "Packing List" : "Select items"
            // 找到特定约束 改变
            for constraint in self.titleLabel.superview!.constraints {

                if constraint.firstItem as? NSObject == self.titleLabel && constraint.firstAttribute == .centerX{
                    constraint.constant = self.isOpen ? 0 : -100
                }
                
                if constraint.firstItem as? NSObject == self.titleLabel && constraint.firstAttribute == .centerY{
                    constraint.constant = self.isOpen ? 0 : -30
                }
            }
            // 旋转按钮
            let angle = self.isOpen ?  0.0 : CGFloat(M_PI_4)
            self.closeButton.transform = CGAffineTransform(rotationAngle: angle)
            
            // 强制重新布局 不然没有回弹效果
            self.view.layoutIfNeeded()
        }) { (finished) in
            self.isOpen = !self.isOpen
        }
        
        if self.isOpen {
            self.itemsView.removeFromSuperview()
        }else{
            self.itemsView = ItemsView.init(frame: CGRect(x: self.view.frame.size.width, y: 100, width: self.view.frame.size.width, height: 100))
            self.itemsView.selectItem = {
                (index) in
                self.dataArr.append(index)
                self.tableView.reloadData()
            }
            self.titleLabel.superview!.addSubview(self.itemsView)
        }
        
        
    }

    
    //Mark: 点击cell的时候的动画
    func showItem(_ index: Int) {
        
        let imageView  = UIImageView(image: UIImage(named: "summericons_100px_0\(index).png"))
        //    imageView.backgroundColor = UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.5)
        imageView.layer.cornerRadius = 5.0
        imageView.layer.masksToBounds = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        
        // 添加约束
        let conX = NSLayoutConstraint(
            item: imageView,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerX,
            multiplier: 1.0,
            constant: 0.0)
        conX.isActive = true
        
        let conY = NSLayoutConstraint(
            item: imageView,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 1.0,
            constant: imageView.frame.size.height)
        conY.isActive = true
        
        let conWidth = NSLayoutConstraint(
            item: imageView,
            attribute: .width,
            relatedBy: .equal,
            toItem: view,
            attribute: .width,
            multiplier: 0.33,
            constant: -50.0)
        conWidth.isActive = true
        
        let conHeight = NSLayoutConstraint(
            item: imageView,
            attribute: .height,
            relatedBy: .equal,
            toItem: imageView,
            attribute: .width,
            multiplier: 1.0,
            constant: 0.0)
//        conHeight.isActive = true
        // 约束对象创建出来  默认是不激活的 布局的时候不会计算  只有把约束加到控件上面 或者设置 isActive = true的时候 才起作用
        view.addConstraint(conHeight)
        
        view.layoutIfNeeded()
        
        
        UIView.animate(withDuration: 0.8, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: UIViewAnimationOptions.curveEaseInOut, animations: { 
            conY.constant = -imageView.frame.size.height/2
            conWidth.constant = 0.0
            self.view.layoutIfNeeded()
        }) { (finished) in
            
        }

        UIView.animate(withDuration: 0.8, animations: { 
            conY.constant = imageView.frame.size.height
            conWidth.constant = -50.0
            self.view.layoutIfNeeded()
        }) { (_) in
            imageView.removeFromSuperview()
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : UITableViewDataSource,UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.accessoryType = .none
        cell.imageView!.image = UIImage.init(named: "summericons_100px_0\(self.dataArr[indexPath.row])")
        cell.textLabel!.text = "第\(indexPath.row)张图片"
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        showItem(self.dataArr[indexPath.row])
    }
}

