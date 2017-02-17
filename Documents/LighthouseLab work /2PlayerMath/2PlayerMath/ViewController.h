//
//  ViewController.h
//  2PlayerMath
//
//  Created by Younghoon jee on 2017. 2. 13..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *currentStatus;
@property (weak, nonatomic) IBOutlet UILabel *player1Score;
@property (weak, nonatomic) IBOutlet UILabel *player2Score;
@property (weak, nonatomic) IBOutlet UILabel *ansDisplay;

-(void)warning;


@end

