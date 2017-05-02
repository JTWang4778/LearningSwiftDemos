//
//  ViewController.swift
//  12-类型转换
//
//  Created by 王锦涛 on 2017/5/2.
//  Copyright © 2017年 JTWang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        testAntAndAnyobject()
        
    }
    func testAntAndAnyobject() {
        /*
         Any : 代表任何数据类型 包括值类型和 类类型
         AnyObject:  代表任何类类型的实例
         */
        
        var movies:[AnyObject]
        movies = [Movie(name: "千与千寻", director: "宫崎骏"),Movie(name: "阿萨德", director: "宫ads骏"),Movie(name: "熟读与激情", director: "宫崎骏")]
        // 当已经知道数组中存放的什么类型的实例时  可以强制转换
        for item in movies {
            let movie = item as! Movie
            print("\(movie.name)  \(movie.director)")
        }
        
        for movie in movies as! [Movie] {
            print("\(movie.name)  \(movie.director)")
        }
    }
    
    func testIsAndAs() {
        let arr = [Movie(name: "千与千寻", director: "宫崎骏"),Movie(name: "千与千寻", director: "宫崎骏"),Movie(name: "熟读与激情", director: "宫崎骏"),Song(name: "You are beautiful!", artist: "James blunt"),Song(name: "朵", artist: "赵雷")]
        
        var movieCount = 0
        var songCount = 0
        
        // 判断类型  is
        for item in arr {
            
            
            if item is Movie {
                movieCount += 1
            }else if item is Song {
                songCount += 1
            }
        }
        
        print("Movie:\(movieCount)  Song:\(songCount)")
        
        // 向下转型  as    as?    as!
        for item in arr {
            if let movie = item as? Movie {
                print(movie.director)
            }else if let song = item as? Song {
                print(song.artist)
            }
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

