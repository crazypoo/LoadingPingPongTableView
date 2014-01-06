//
//  ViewController.m
//  LoadingPingPongTableView
//
//  Created by crazypoo on 1/6/14.
//  Copyright (c) 2014 crazypoo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,retain)UITableView *loadingtable;
@end

@implementation ViewController
@synthesize loadingtable = _loadingtable;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.loadingtable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    self.loadingtable.dataSource = self;
    self.loadingtable.delegate = self;
    [self.view addSubview:self.loadingtable];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 30.0f;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    CGFloat alphaComponent = 1.0f - (float)(indexPath.row + 1) / (float)([tableView numberOfRowsInSection:0] + 1);
    cell.contentView.backgroundColor = [UIColor colorWithRed:0.373f green:0.820f blue:0.294f alpha:alphaComponent];
    cell.backgroundColor = [UIColor whiteColor];
    
    return cell;
}
- (void)viewDidLayoutSubviews
{
    self.pongRefreshControl = [BOZPongRefreshControl attachToTableView:self.loadingtable
                                                     withRefreshTarget:self
                                                      andRefreshAction:@selector(refreshTriggered)];
    self.pongRefreshControl.backgroundColor = [UIColor whiteColor];
    self.pongRefreshControl.foregroundColor = [UIColor blackColor];
}
- (void)refreshTriggered
{
    //Go and load some data
    
    //Finshed loading the data, reset the refresh control
    [self.pongRefreshControl finishedLoading];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [self.pongRefreshControl finishedLoading];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.pongRefreshControl scrollViewDidScroll];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.pongRefreshControl scrollViewDidEndDragging];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
