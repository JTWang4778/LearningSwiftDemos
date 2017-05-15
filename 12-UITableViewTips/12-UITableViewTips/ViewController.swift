//
//  ViewController.swift
//  12-UITableViewTips
//
//  Created by 王锦涛 on 2017/5/15.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var dataDict: [String : String] = [ "0":"0"]
    
    let content = "这是一段测试文字\n这是一段测试文字\n这是一段测试文字\n这是一段测试文字\n这是一段测试文字\n这是一段测试文字\n这是一段测试文字\n这是一段测试文字\nv这是一段测试文字\n"

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 去除底部多余分割线
        self.tableView.tableFooterView = UIView()
        
        
        // 对于 自动布局的cell，可以设置tableView 动态适应cell的高度  不用再计算cell的高度
        self.tableView.estimatedRowHeight = 66
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        // 准备数据源
        for i in 0..<40 {
            self.dataDict["\(i)"] = "1"
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "asdf", for: indexPath)
        let label = cell.contentView.viewWithTag(200) as! UILabel
        label.text = content
        if self.dataDict[String(indexPath.row)] == "0" {
            label.numberOfLines = 0
        }else{
            label.numberOfLines = 1
        }
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // 取消选中
//        tableView.deselectRow(at: indexPath, animated: false)
        
        let cell = tableView.cellForRow(at: indexPath)!
        tableView.beginUpdates()
        if let asdf = cell.contentView.viewWithTag(200){
            let label = asdf as! UILabel
            if label.numberOfLines == 0  {
                label.numberOfLines = 1
                self.dataDict[String(indexPath.row)] = "1"
            }else{
                label.numberOfLines = 0
                self.dataDict[String(indexPath.row)] = "0"
            }
        }
        tableView.endUpdates()
//        tableView.reloadData()
    }
    
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        
//        
//        // 计算cell的高度 返回
//        
//        return 80
//    }
    
    
    // 设置tableView自带分割线  边距
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.tableView.separatorInset = UIEdgeInsets.zero
        self.tableView.layoutMargins = UIEdgeInsets.zero
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
    }
    


}

