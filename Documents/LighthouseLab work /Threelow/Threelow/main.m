//
//  main.m
//  Threelow
//
//  Created by Younghoon jee on 2017. 2. 15..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dice.h"
#import "Input.h"
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        Input* input = [[Input alloc] init];
        
        GameController* gameController = [[GameController alloc] init];

        NSLog(@"Enter how many numbers of dice you want to play with");
        
        NSUInteger diceNum  = [[input inputString] integerValue];
        
        [gameController diceInit:diceNum];
        

      
        while(true)
        {
         
            NSLog(@"Enter roll if you would like to start the game");
            
           NSString* userInput =  [input inputString];
            
            if ([userInput isEqualToString:@"roll"]) {
                [gameController rollDice];
            }
            
            else if ([userInput isEqualToString:@"reset"]) {

                [gameController resetDice];
            }
            

            NSLog(@"pick dice index number that you want to hold");
            
            NSInteger index = [[input inputString] intValue];

            
            [gameController holdDie:index];          

            NSLog(@"The score is %li",(long)[gameController sumScore]);            
        }

    }
    
    
    
    return 0;
}
