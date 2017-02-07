//
//  main.m
//  WordEffects
//
//  Created by Younghoon jee on 2017. 2. 6..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    
    while(true){
        
        char inputChars[255];
        
        NSLog(@"input a string: ");
        
        fgets(inputChars, 255, stdin);
        
        NSLog(@"Your string is %s\n ",inputChars);
        
        NSString *inputString = [NSString stringWithUTF8String:inputChars];
        
        //NSString *replacementString = [inputString stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
        
        
        NSLog(@"1. Uppercase\n 2.Lowercase\n 3.Numberize\n 4.Canadianize\n 5.Respond\n 6.De-Space-It\n");
        NSLog(@"Enter the Operation Number You desire \n");


        char num[3]; // why 3? input character, new line (\n), terminator(\0)
        fgets(num,3,stdin);
        
        int choice = (int)strtol(num, NULL,10);
        
        switch(choice)
        {
    
            case 1:
            {
            
                NSString *uppercase = inputString.uppercaseString;
                NSLog(@"Your Uppercase string is %@\n ", uppercase);
                break;
            }

            case 2:
            {
                NSString *lowercase = [inputString lowercaseString];
                NSLog(@"Your Lowercase string is %@\n ", lowercase);
                break;

            }

            case 3:
            {
                int integerValue = inputString.intValue;
                NSLog(@"Your coversion of string into number is %i\n ", integerValue);
                break;

            }
        
        
            case 4:
            {
                NSString *canadianize = @",eh?";
                NSString *AppendingString = [inputString stringByAppendingString: canadianize];
                NSLog(@"Your appending string is %@\n ", AppendingString);
                break;

            }
        
            case 5:
            {
                if ([inputString hasSuffix:@"?\n"]){
                NSLog(@"I don't know");
                }
            
                else if([inputString hasSuffix:@"!\n"]){
                NSLog(@"Whoa, calm down");
                }
                break;

            }
            
            case 6:
            {
                NSString *replacement = [inputString stringByReplacingOccurrencesOfString:@" " withString:@"-"];
                NSLog(@"Your whitespace replacement with - is  %@\n ", replacement);
                break;

            }

                
                
            default:
                if(inputString == nil){
                    
                    NSLog(@"Invalid String, Please Input Valid String Again");
                    ;
                }
                break;
        }
    
        
                
    }
    
  

    return 0;
}
