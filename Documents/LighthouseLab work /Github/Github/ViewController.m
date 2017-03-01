//
//  ViewController.m
//  Github
//
//  Created by Younghoon jee on 2017. 2. 28..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong,nonatomic) id<UITableViewDataSource> datasource;
@property (strong,nonatomic) id<UITableViewDelegate> delegate;
@property (strong,nonatomic) NSMutableArray* dataArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.dataArray = [[NSMutableArray alloc] init];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    NSURL* url = [NSURL URLWithString:@"https://api.github.com/users/lighthouse-labs/repos"];
    NSURLRequest* urlRequest = [[NSURLRequest alloc] initWithURL:url];
    
    NSURLSessionConfiguration* configure = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession* session = [NSURLSession sessionWithConfiguration:configure];
    
    NSURLSessionDataTask* dataTask = [session dataTaskWithRequest:urlRequest completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    
        if (error ) {
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSError *jsonError = nil;
        NSArray *repos = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        
        if(jsonError){
            NSLog(@"jasonError: %@", jsonError.localizedDescription);
            return;
        }
    
        
        for(NSDictionary *repoDict in repos) {
            
            NSString* name = repoDict[@"name"];
            Repo* repo = [[Repo alloc] initWithName:name];
            NSLog(@"repo : %@", repo);
            [self.dataArray addObject:repo];
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"stuff");
            [self.tableView reloadData];
        });
        
    }];
    
    
    [dataTask resume];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    
    return self.dataArray.count;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
   UITableViewCell* cell =  [tableView dequeueReusableCellWithIdentifier:@"dataCell" forIndexPath:indexPath];
    
   Repo* dataExtracted =  self.dataArray[indexPath.row];

    
    
    cell.textLabel.text = dataExtracted.name;
    
   
    return cell;
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
