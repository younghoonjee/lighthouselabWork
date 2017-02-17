//
//  Player.m
//  2PlayerMath
//
//  Created by Younghoon jee on 2017. 2. 13..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import "Player.h"
#import "GameModel.h"



@implementation Player


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _lives = 3;
        _score = 0;
        
        

    }
    return self;
}





@end
