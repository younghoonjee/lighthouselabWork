//
//  ViewController.m
//  2PlayerMath
//
//  Created by Younghoon jee on 2017. 2. 13..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import "ViewController.h"
#import "GameModel.h"
#import "Player.h"


@interface ViewController ()

@property (nonatomic,strong) GameModel* gameModel;
@property (nonatomic,strong) NSMutableArray* numArray;

@end

@implementation ViewController


-(int)answerSum {
    int sum = 0;
    
    for (NSNumber *num in self.numArray) {
        sum = sum * 10 + [num intValue];
    }
    
    return sum;
}

- (void)updateLabels {
  ;
        
    self.player1Score.text =  [NSString stringWithFormat: @"%ld:%d", (long)self.gameModel.playerOne.score, self.gameModel.playerOne.lives];
    
    self.player2Score.text = [NSString stringWithFormat: @"%ld:%d", (long)self.gameModel.playerTwo.score, self.gameModel.playerTwo.lives];
    
    self.ansDisplay.text = [NSString stringWithFormat:@"%d", [self answerSum]];
    
    
    self.currentStatus.text = self.gameModel.question;

}

- (IBAction)number0:(UIButton*)sender {
    
    if (sender.tag < 10) {
        
        [self.numArray addObject:@(sender.tag)];
        
    } else if (sender.tag == 10) {
        
        
        NSLog(@"Number You Entered for answer is %i" , [self answerSum]);
        
        
        [self.gameModel checkAns: [self answerSum]];
        
        [self.numArray removeAllObjects];

        
    } else if (sender.tag == 11) {
        
        [self.numArray removeAllObjects];
        
    }
    
        [self updateLabels];

}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.numArray = [NSMutableArray array];
    
    self.gameModel = [[GameModel alloc] init];

    [self updateLabels];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)warning{
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Warning"
                                                                   message:@"no life left, GG "
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}



@end
