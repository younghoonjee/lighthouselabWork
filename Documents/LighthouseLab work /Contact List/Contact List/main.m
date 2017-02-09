//
//  main.m
//  Contact List
//
//  Created by Younghoon jee on 2017. 2. 8..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        ContactList *contactList = [[ContactList alloc] init];
        
        while(true){
            
            InputCollector *inputCollector = [[InputCollector alloc] init];
            Contact *setting = [[Contact alloc] init];
            
            NSString *userInput = [inputCollector inputForPrompt:@"Enter your command"];
            
            
            if ([userInput isEqualToString:@"quit"]) {
                
                NSLog(@"Program terminated, Adieu");
            }
            else if ([userInput isEqualToString:@"new"]) {
                
                NSString *username = [inputCollector inputForPrompt:@"Enter your username"];
                NSLog(@"Username You Enetered was %@",username);
                
                NSString *eMail = [inputCollector inputForPrompt:@"Enter your e-mail address"];
                NSLog(@"Username You Enetered was %@",eMail);
                
                setting.name = username;
                setting.email = eMail;
                
                [contactList addContact:setting];
                
            }else if([userInput isEqualToString:@"list"]){
                    
                    [contactList contactIndex];
            }
            
                
        }
        
            
            
    }
    
    
    return 0;
}
