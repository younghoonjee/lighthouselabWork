//
//  GameModel.m
//  2PlayerMath
//
//  Created by Younghoon jee on 2017. 2. 13..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import "GameModel.h"
#import "Player.h"
#import "ViewController.h"


@interface GameModel ()




@property int answer;

@property (nonatomic, copy) NSString* playerTurn;

@property int randomNum1, randomNum2;



@property Player* currentPlayer;

@property(weak) ViewController* viewcontroller;





@end




@implementation GameModel



- (instancetype)init
{
    self = [super init];
    if (self) {
        

        
        _playerOne = [[Player alloc] init];
        _playerTwo = [[Player alloc] init];
        
        _playerOne.name = @"Player 1";
        _playerTwo.name = @"Player 2";

        
        _currentPlayer = _playerOne;
        
        
        [self nextQuestion];

        
        
    }
    return self;
}



-(void)nextQuestion {
    
 
    
    self.randomNum1 = arc4random_uniform(20)+10;
    self.randomNum2 = arc4random_uniform(20)+10;
    
    
    self.answer = self.randomNum1 +self.randomNum2;
    
    self.question = [[NSString alloc] initWithFormat: @"%@: %i + %i ?", self.currentPlayer.name ,self.randomNum1,self.randomNum2];
}

-(void)checkAns:(NSInteger)answer {
    
    if (self.answer == answer) {
        
        self.currentPlayer.score++;
        
    } else{
        
        if (self.currentPlayer.lives == 0) {
            
            [self.viewcontroller warning];
            
        } else {
            
            self.currentPlayer.lives--;
            
        }
    }
    
    if (self.currentPlayer == self.playerTwo){
        
        self.currentPlayer = self.playerOne;
    }
    
    else{
        
        self.currentPlayer = self.playerTwo;

    }

    
    [self nextQuestion];


}





@end
