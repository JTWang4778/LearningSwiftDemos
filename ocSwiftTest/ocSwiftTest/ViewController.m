//
//  ViewController.m
//  ocSwiftTest
//
//  Created by 王锦涛 on 2017/5/3.
//  Copyright © 2017年 JTWang. All rights reserved.
//

#import "ViewController.h"
#import "GNSegment.h"

#import "ocSwiftTest-Swift.h"

@interface ViewController ()

@end

/*
    OC中混编swift
  1，在OC的项目中 创建swift文件的时候 会自动提示创建桥接文件。创建即可目的是告诉swift 哪些OC的文件可以使用 。在swift中用到OC的类的时候 把头文件引入到桥接文件即可
 2，当项目中有swift文件时，  工程会自动创建一个名字叫 项目名-Swift.h  的文件  里面有所有swift类的声明。 但是默认情况下 这个文件是隐藏的。  当OC类需要引用swift文件的时候 需要先引入带头文件 然后才能正常使用
 3，当项目名字中 有中文或者 - 的时候  导入项目名-Swift.h的时候 有可能出错
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    GNSegment *se = [[GNSegment alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    se.backgroundColor = [UIColor grayColor];
    [self.view addSubview:se];
    
    
    NoteListView *listView = [[NoteListView alloc] initWithFrame:CGRectMake(0, 200, 400, 400)];
    [self.view addSubview:listView];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
