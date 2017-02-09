//
//  InputCollector.m
//  Contact List
//
//  Created by Younghoon jee on 2017. 2. 8..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector



-(NSString *)inputForPrompt:(NSString *)promptString {
    
    while(true)
    {
    NSLog(@"%@", promptString);
    
    char charString[255];
    fgets(charString, 255, stdin);
    
    NSString *inputString = [NSString stringWithCString: charString encoding:NSUTF8StringEncoding];
    
    NSCharacterSet *newLineCharacter = [NSCharacterSet characterSetWithCharactersInString:@"\n"];
    
    NSString *strippedString = [inputString stringByTrimmingCharactersInSet:newLineCharacter];
    
    


    
    return strippedString;
    
    
    }
    
}


@end
