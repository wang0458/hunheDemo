//
//  TwoViewController.m
//  hunheDemo
//
//  Created by 江清清 on 16/6/5.
//  Copyright © 2016年 Facebook. All rights reserved.
//

#import "TwoViewController.h"
#import "RCTRootView.h"
#import "ThreeViewController.h"
@implementation TwoViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.title=@"RN界面";
  NSURL *jsCodeLocation=[NSURL URLWithString:@"http://localhost:8081/index.ios.bundle?platform=ios&dev=true"];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL:jsCodeLocation
                                                      moduleName:@"hunheDemo"
                                               initialProperties:nil
                                                   launchOptions:nil];
  self.view=rootView;
  [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(receivedMsg) name:@"RNOpenVC" object:nil];
}

-(void)receivedMsg{
  NSLog(@"receivedMsg...");
  [self.navigationController pushViewController:[ThreeViewController new] animated:YES];
}
-(void)dealloc{
  [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end