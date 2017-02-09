//
//  ContactList.m
//  Contact List
//
//  Created by Younghoon jee on 2017. 2. 8..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import "ContactList.h"
#import "Contact.h"

@implementation ContactList

-(void)addContact:(Contact *)newContact {
    
    [self.contactArray addObject: newContact];
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.contactArray = [NSMutableArray array];
    }
    return self;
}


-(void)contactIndex{
    
    int cnt = 0;
    for (Contact* eachContact in self.contactArray) {
        
        
        
        NSLog(@"%i:<%@> ()",cnt,eachContact.name);
        
        cnt++;
    }
    
    
    
    
}


@end
