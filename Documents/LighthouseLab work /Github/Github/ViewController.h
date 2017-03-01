//
//  ViewController.h
//  Github
//
//  Created by Younghoon jee on 2017. 2. 28..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Repo.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

