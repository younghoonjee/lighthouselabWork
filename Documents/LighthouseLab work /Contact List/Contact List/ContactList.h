//
//  ContactList.h
//  Contact List
//
//  Created by Younghoon jee on 2017. 2. 8..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"


@interface ContactList : NSObject

@property NSMutableArray *contactArray;

-(void)addContact:(Contact *)newContact;

-(void)contactIndex;

@end

