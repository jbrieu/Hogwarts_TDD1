//
//  Person.m
//  UnitTestAssignement
//
//  Created by JbRieu on 2/20/16.
//  Copyright © 2016 JbRieu. All rights reserved.
//

#import "Person.h"

@interface Person()

@property (nonatomic, strong, readwrite) NSString *firstname;

@end

@implementation Person

- (instancetype)initWithFirstname:(NSString *)firstname
{
    self = [super init];
    if (self) {
#warning  NOT IMPLEMENTED YET. IMPLEMENT TEST FIRST.
    }
    return self;
}

@end
