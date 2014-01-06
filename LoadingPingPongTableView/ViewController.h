//
//  ViewController.h
//  LoadingPingPongTableView
//
//  Created by crazypoo on 1/6/14.
//  Copyright (c) 2014 crazypoo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BOZPongRefreshControl.h"
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
}
@property (strong, nonatomic) BOZPongRefreshControl* pongRefreshControl;

@end
