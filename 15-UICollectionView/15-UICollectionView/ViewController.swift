//
//  ViewController.swift
//  15-UICollectionView
//
//  Created by 王锦涛 on 2017/5/25.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let reuseIdentifier = "ChannelCell"
    
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
        
        self.collectionView.isUserInteractionEnabled = true
        let long = UILongPressGestureRecognizer.init(target: self, action: #selector(longPress(recognizer:)))
        self.collectionView.addGestureRecognizer(long)
        
        // 布局对象  控制滚动方向 item大小 间距
        self.flowLayout.scrollDirection = .vertical
//        self.flowLayout.estimatedItemSize = CGSize(width: 2, height: 2)
//        self.flowLayout.itemSize = CGSize.init(width: 40, height: 40)
//        self.flowLayout.minimumInteritemSpacing = 6
//        self.flowLayout.minimumLineSpacing = 6
        self.flowLayout.headerReferenceSize = CGSize(width: 0, height: 20)
        self.flowLayout.footerReferenceSize = CGSize(width: 0, height: 20)
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

    func longPress(recognizer: UILongPressGestureRecognizer) {
        
        if recognizer.state == .began {
            print(NSStringFromCGPoint(recognizer.location(in: self.collectionView)))

            let indexPath = self.collectionView.indexPathForItem(at: recognizer.location(in: self.collectionView))
            if indexPath == nil {
                return
            }
            print(self.collectionView.beginInteractiveMovementForItem(at: indexPath!))
            
            
        }else if recognizer.state == .changed {
            self.collectionView.updateInteractiveMovementTargetPosition(recognizer.location(in: self.collectionView))
        }else if recognizer.state == .ended {
            
            self.collectionView.endInteractiveMovement()
        }else{
            self.collectionView.endInteractiveMovement()
        }
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
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        
        let model = self.dataArr[sourceIndexPath.section].remove(at: sourceIndexPath.row)
//        var dataArrayCopy = Array(self.dataArr)
//        let subArr = self.dataArr[sourceIndexPath.section]
//        dataArrayCopy[sourceIndexPath.section] = Array(subArr)
//        
//        var subArrDes = self.dataArr[destinationIndexPath.section]
//        subArrDes.insert(model, at: destinationIndexPath.row)
//        dataArrayCopy[destinationIndexPath.section] = Array(subArrDes)
//        
//        self.dataArr = dataArrayCopy
        
        self.dataArr[destinationIndexPath.section].insert(model, at: destinationIndexPath.row)
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
        return CGSize(width: 80, height: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize{
        
        if section == 2 {
            return CGSize(width: 0, height: 30)
        }
        return CGSize(width: 0, height: 0)
    }
}

