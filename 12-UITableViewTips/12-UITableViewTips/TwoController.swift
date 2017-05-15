//
//  TwoController.swift
//  12-UITableViewTips
//
//  Created by 王锦涛 on 2017/5/15.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class TwoController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = true
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "twocell", for: indexPath)
        let bottomView = cell.contentView.viewWithTag(2000) as! UIView
        let img = bottomView.viewWithTag(2001)
        let rect = bottomView.convert(bottomView.bounds, to: nil)
        var y = UIScreen.main.bounds.size.height - rect.origin.y - 150
        if y > 0  {
            y = 0
        }
        
        if y < -50  {
            y = -50
        }
        
        img?.frame.origin.y = y
        return cell
        
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //        // 取消选中
//        //        tableView.deselectRow(at: indexPath, animated: false)
//        
//        let cell = tableView.cellForRow(at: indexPath)!
//        tableView.beginUpdates()
//        if let asdf = cell.contentView.viewWithTag(200){
//            let label = asdf as! UILabel
//            if label.numberOfLines == 0  {
//                label.numberOfLines = 1
//                self.dataDict[String(indexPath.row)] = "1"
//            }else{
//                label.numberOfLines = 0
//                self.dataDict[String(indexPath.row)] = "0"
//            }
//        }
//        tableView.endUpdates()
//        //        tableView.reloadData()
//    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        for cell in self.tableView.visibleCells{
            let bottomView = cell.contentView.viewWithTag(2000) as! UIView
            let img = bottomView.viewWithTag(2001)
            let rect = bottomView.convert(bottomView.bounds, to: nil)
           var y = UIScreen.main.bounds.size.height - rect.origin.y - 150
            if y > 0  {
                y = 0
            }
            
            if y < -50  {
                y = -50
            }
            
            img?.frame.origin.y = y
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}
