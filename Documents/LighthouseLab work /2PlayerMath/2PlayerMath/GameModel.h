//
//  GameModel.h
//  2PlayerMath
//
//  Created by Younghoon jee on 2017. 2. 13..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Player;

@interface GameModel : NSObject

@property (nonatomic,copy) NSString* question;

@property Player* playerOne;
@property Player* playerTwo;

-(void)checkAns:(NSInteger)answer;


@end
