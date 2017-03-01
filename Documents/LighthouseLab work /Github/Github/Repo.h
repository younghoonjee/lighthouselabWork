//
//  Repo.h
//  Github
//
//  Created by Younghoon jee on 2017. 2. 28..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Repo : NSObject

@property(readonly,nonatomic,copy) NSString* name;


- (instancetype)initWithName: (NSString*) name;
@end
