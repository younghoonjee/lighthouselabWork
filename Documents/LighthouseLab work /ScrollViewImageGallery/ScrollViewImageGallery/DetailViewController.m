//
//  ViewControllerMain.m
//  ScrollViewImageGallery
//
//  Created by Younghoon jee on 2017. 2. 20..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import "DetailViewController.h"
#import "ListViewController.h"

@interface DetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewMain;

@property (strong, nonatomic)UIImageView* myLighthouseImageView;


@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollViewMain.delegate = self;
    self.scrollViewMain.translatesAutoresizingMaskIntoConstraints = NO;
    
    
    self.myLighthouseImageView =[[UIImageView alloc] initWithImage: self.image];
    
    

    self.myLighthouseImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    [self.scrollViewMain addSubview:self.myLighthouseImageView];
    
    self.scrollViewMain.maximumZoomScale = 3.0;
    self.scrollViewMain.minimumZoomScale = 0.5;
    
    self.scrollViewMain.zoomScale = 1.0;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return self.myLighthouseImageView;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
