//
//  ViewController.m
//  ScrollViewImageGallery
//
//  Created by Younghoon jee on 2017. 2. 20..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import "ListViewController.h"
#import "DetailViewController.h"

@interface ListViewController () <UIScrollViewDelegate, UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic, readonly) NSArray <UIImage *> *lighthouseImage;

@property (strong, nonatomic) UIImage* tappedImage;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation ListViewController





- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.scrollView.delegate = self;
    self.scrollView.translatesAutoresizingMaskIntoConstraints = YES;
    
    CGFloat scrollWidth = CGRectGetWidth(self.scrollView.frame);
    CGFloat scrollHeight = CGRectGetHeight(self.scrollView.frame);
    CGFloat contentWidth = 0;

//    self.pageControl.layer.zPosition = self.scrollView.layer.zPosition + 1;
//    self.pageControl.numberOfPages = 100;
    
    for (int i = 0; i < [self.lighthouseImage count]; i++) {
        
        
        UIImageView *lighthouseImageView =[[UIImageView alloc] initWithImage: [self.lighthouseImage objectAtIndex:i]];
                
        lighthouseImageView.frame =  CGRectMake(scrollWidth * i, 0, scrollWidth, scrollHeight);

        lighthouseImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        lighthouseImageView.userInteractionEnabled = YES;
        
        [self.scrollView addSubview:lighthouseImageView];
        
        contentWidth += lighthouseImageView.frame.size.width;
    }
    
    self.scrollView.contentSize = CGSizeMake(contentWidth, scrollHeight);

    self.scrollView.pagingEnabled = YES;
    
    self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
    
    self.tapGestureRecognizer.delegate = self;
    [self.view addGestureRecognizer:self.tapGestureRecognizer];
    
    self.pageControl.pageIndicatorTintColor = [UIColor greenColor];
    self.pageControl.currentPageIndicatorTintColor  = [UIColor redColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    int pageIndex =  self.scrollView.contentOffset.x / CGRectGetWidth(self.scrollView.frame);
    

    self.pageControl.currentPage = pageIndex;

}


-(NSArray <UIImage *> *)lighthouseImage{
    return @[
             [UIImage imageNamed:@"Lighthouse-in-Field"],
             [UIImage imageNamed:@"Lighthouse-night"],
             [UIImage imageNamed:@"Lighthouse"]
             ];
}


- (IBAction)tapped:(id)sender {
    
    CGPoint point = [self.tapGestureRecognizer locationInView:self.scrollView];
    
    UIImageView* imageView = (UIImageView *)[self.scrollView hitTest:point withEvent:nil];
    
    self.tappedImage = imageView.image;
    
    [self performSegueWithIdentifier: @"tapToDetail" sender: self];
    
    
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    DetailViewController* vc = [segue destinationViewController];
    
    vc.image = self.tappedImage;

}
@end
