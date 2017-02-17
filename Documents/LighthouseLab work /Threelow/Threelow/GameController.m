//
//  GameController.m
//  Threelow
//
//  Created by Younghoon jee on 2017. 2. 15..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"
#import "Input.h"


@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _diceCollection = [[NSMutableArray alloc] init];
        
       _heldDiceCollection = [[NSMutableSet alloc] init];
        
       
        
    }
    return self;
}


-(void)diceInit:(NSUInteger)numberOfDice{
    
   
    for (int i = 0; i <= numberOfDice; i++) {
        
        Dice* dice = [[Dice alloc] init];

        
        [self.diceCollection addObject:dice];
    }
}


-(void)rollDice{
    
    for (Dice* dice in self.diceCollection ) {
        
        if(![self.heldDiceCollection containsObject:dice])
        {
            
              [dice randomNum];
        }

        
        
        
    }
}


-(void)holdDie:(NSInteger)indexDice{
    
    
    Dice *dice = [self.diceCollection objectAtIndex:indexDice];
    

    
        if ([self.heldDiceCollection containsObject:dice]) {
            
            [self.heldDiceCollection removeObject:(dice)];
            
            NSLog(@"You already chose the number, Pick the other number");
            
        }else {
            
            [ self.heldDiceCollection addObject:dice];
        

        }
    
    NSLog(@"The collection is %@", self.heldDiceCollection);

}

-(void)resetDice{
    
    [self.heldDiceCollection removeAllObjects];
}



-(NSInteger)sumScore{
    
    NSInteger sum = 0;
    
    for (Dice* dice in self.heldDiceCollection) {
        
        sum+= dice.diceValue;
    }
    
    return sum;
    
}

@end
