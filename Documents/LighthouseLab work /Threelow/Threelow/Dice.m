//
//  Dice.m
//  Threelow
//
//  Created by Younghoon jee on 2017. 2. 15..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import "Dice.h"

@implementation Dice

-(NSString *)description {
    return [NSString stringWithFormat:@"<Dice: %i>", self.diceValue];
}


-(void)randomNum{
    
    self.diceValue = arc4random_uniform(6)+1;
    
    NSLog(@"Random dice value is %i", self.diceValue);
 
    
}


@end
