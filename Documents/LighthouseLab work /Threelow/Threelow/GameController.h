//
//  GameController.h
//  Threelow
//
//  Created by Younghoon jee on 2017. 2. 15..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property NSMutableArray* diceCollection;
@property NSMutableSet* heldDiceCollection;
@property NSInteger score;

-(void)holdDie:(NSInteger)indexDice;
-(void)resetDice;
-(void)rollDice;
-(void)diceInit:(NSUInteger)numberOfDice;
-(NSInteger)sumScore;

@end
