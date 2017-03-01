//
//  Repo.m
//  Github
//
//  Created by Younghoon jee on 2017. 2. 28..
//  Copyright © 2017년 Younghoon jee. All rights reserved.
//

#import "Repo.h"

@implementation Repo

- (instancetype)initWithName: (NSString*) name
{
    self = [super init];
    if (self) {
        _name = name;
    }
    return self;
}
@end
