//
//  ViewController.swift
//  15-UICollectionView
//
//  Created by 王锦涛 on 2017/5/25.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cell : UICollectionViewCell?
    var fackCell : UIView?
    var beginPoint : CGPoint?
    var beginIndexpath : IndexPath?
    
    let reuseIdentifier = "ChannelCell"
    
    let headerReuseIdentifier = "headerReuseIdentifier"
    
    var dataArr : [[ChannelModel]]!

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadData()
        self.collectionView.bounces = false
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(UINib.init(nibName: "ChannelCell", bundle: Bundle.main), forCellWithReuseIdentifier: reuseIdentifier)
        
        self.collectionView.register(UINib.init(nibName: "CollectionHeaderView", bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier)
        
        self.collectionView.isUserInteractionEnabled = true
        let long = UILongPressGestureRecognizer.init(target: self, action: #selector(longPress(recognizer:)))
        self.collectionView.addGestureRecognizer(long)
        
        // 布局对象  控制滚动方向 item大小 间距
        self.flowLayout.scrollDirection = .vertical
//        self.flowLayout.estimatedItemSize = CGSize(width: 2, height: 2)
//        self.flowLayout.itemSize = CGSize.init(width: 40, height: 40)
//        self.flowLayout.minimumInteritemSpacing = 6
//        self.flowLayout.minimumLineSpacing = 6
        self.flowLayout.headerReferenceSize = CGSize(width: 0, height: 200)
        self.flowLayout.footerReferenceSize = CGSize(width: 0, height: 200)
        self.flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func loadData() {
        var asdf = [[ChannelModel]]()
        for i in 0..<3 {
            var arr = [ChannelModel]()
            for j in 0..<10 {
                
                let model = ChannelModel.init(section: i, row: j)
                arr.append(model)
            }
            asdf.append(arr)
        }
        self.dataArr = asdf
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func longPress(recognizer: UILongPressGestureRecognizer) {
        
        if recognizer.state == .began {

            let indexPath = self.collectionView.indexPathForItem(at: recognizer.location(in: self.collectionView))
            if indexPath == nil {
                return
            }
            if #available(iOS 9.0, *) {
                self.collectionView.beginInteractiveMovementForItem(at: indexPath!)
            } else {
                beginPoint = recognizer.location(in: self.collectionView)
                beginIndexpath = indexPath
                cell = self.collectionView.cellForItem(at: indexPath!)
                if cell == nil {
                    return
                }
                fackCell = copyView(from: cell!)
                cell!.isHidden = true
                fackCell!.frame = cell!.frame
                self.collectionView.addSubview(fackCell!)
            }
            
            
        }else if recognizer.state == .changed {
            if #available(iOS 9.0, *) {
                self.collectionView.updateInteractiveMovementTargetPosition(recognizer.location(in: self.collectionView))
            } else {
                
                let location = recognizer.location(in: self.collectionView)
                let moveX = location.x - beginPoint!.x
                let moveY = location.y - beginPoint!.y
                fackCell!.center = CGPoint.init(x: fackCell!.center.x + moveX, y: fackCell!.center.y + moveY)
                beginPoint = location
                var nowIndexPath = self.collectionView.indexPathForItem(at: recognizer.location(in: self.collectionView))
                if nowIndexPath == nil {
                    return
                }
                let nowView = self.collectionView.cellForItem(at: nowIndexPath!)
                if nowView == nil {
                    return
                }
                if nowIndexPath!.section == 0 && nowIndexPath!.row == 0 &&  nowView == nil{
                    nowIndexPath = IndexPath.init(row: self.collectionView.numberOfItems(inSection: beginIndexpath!.section) - 1, section: beginIndexpath!.section)
                }
                
                
                moveModelFrom(sourceIndexPath: beginIndexpath!, to: nowIndexPath!)
                self.collectionView.moveItem(at: beginIndexpath!, to: nowIndexPath!)
                beginIndexpath = nowIndexPath
                
            }
        }else if recognizer.state == .ended {
            
            if #available(iOS 9.0, *) {
                self.collectionView.endInteractiveMovement()
            } else {
                // Fallback on earlier versions
                fackCell?.removeFromSuperview()
                fackCell = nil
                cell?.isHidden = false
            }
        }else{
            if #available(iOS 9.0, *) {
                self.collectionView.endInteractiveMovement()
            } else {
                // Fallback on earlier versions
                fackCell?.removeFromSuperview()
                fackCell = nil
                cell?.isHidden = false
            }
        }
    }
    
    // MARK: 复制view的方法
    func copyView(from: UIView) -> UIView {
        
        UIGraphicsBeginImageContext(from.bounds.size)
        from.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return UIImageView.init(image: image)
    }
    // MARK: 操作数据源方法
    func moveModelFrom(sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath){
        let model = self.dataArr[sourceIndexPath.section].remove(at: sourceIndexPath.row)
        self.dataArr[destinationIndexPath.section].insert(model, at: destinationIndexPath.row)
    }
}


// MARK: - UICollectionViewDataSource
extension ViewController : UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.dataArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let subArr = self.dataArr[section]
        return subArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ChannelCell
        cell.model = self.dataArr[indexPath.section][indexPath.row]
        cell.closure = {
            // 移动cell到第三组 第一个
            let model = self.dataArr[indexPath.section].remove(at: indexPath.row)
            self.dataArr[2].insert(model, at: 0)
            self.collectionView.moveItem(at: indexPath, to: IndexPath(row: 0, section: 2))
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
//        let model = self.dataArr[sourceIndexPath.section].remove(at: sourceIndexPath.row)
//        var dataArrayCopy = Array(self.dataArr)
//        let subArr = self.dataArr[sourceIndexPath.section]
//        dataArrayCopy[sourceIndexPath.section] = Array(subArr)
//        
//        var subArrDes = self.dataArr[destinationIndexPath.section]
//        subArrDes.insert(model, at: destinationIndexPath.row)
//        dataArrayCopy[destinationIndexPath.section] = Array(subArrDes)
        
//        self.dataArr = dataArrayCopy
        
//        let model = self.dataArr[sourceIndexPath.section].remove(at: sourceIndexPath.row)
//        self.dataArr[destinationIndexPath.section].insert(model, at: destinationIndexPath.row)
        
        moveModelFrom(sourceIndexPath: sourceIndexPath, to: destinationIndexPath)
    }
    
    
    
    // header  footer 数据源 
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        if kind == UICollectionElementKindSectionHeader {
            
           let reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerReuseIdentifier, for: indexPath) as! CollectionHeaderView
            reuseView.delegate = self
            return reuseView
        }else{
//            reuseView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: headerReuseIdentifier, for: indexPath)
        }
        return UICollectionReusableView()
        
    }
}



extension ViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    @available(iOS 6.0, *)
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        
        print("\(indexPath.section)-\(indexPath.row)")
        
    }
}
extension ViewController : CollectionHeaderViewDelegate {
    
    func didClickMore() {
        print("诶呀妈呀   你点我了")
    }
}

// MARK: - UICollectionViewDelegate 如果需要根据section动态改变布局 可以实现代理方法
extension ViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        if section == 0 {
            return 10
        }else{
            return 10
        }
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat{
        if section == 0 {
            return 0
        }else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 80, height: 60)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{
        
        if section == 2 {
            return CGSize(width: 0, height: 0)
        }
        return CGSize(width: 0, height: 0)
    }
}

