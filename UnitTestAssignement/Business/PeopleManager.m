//
//  PeopleManager.m
//  UnitTestAssignement
//
//  Created by JbRieu on 2/20/16.
//  Copyright © 2016 JbRieu. All rights reserved.
//

#import "PeopleManager.h"
#import "Person.h"

@interface PeopleManager ()

@property (nonatomic, strong) NSArray *people;

@end

@implementation PeopleManager

- (instancetype)initWithJsonDictionary:(NSDictionary *)filename{
    self = [super init];
    if (self) {
        NSMutableArray *parsingArray = [[NSMutableArray alloc] init];
        
        
        
        _people = [NSArray arrayWithArray:parsingArray];
        
    }
    return self;
}

- (NSUInteger)numberOfPeople{
#warning  NOT IMPLEMENTED YET. IMPLEMENT TEST FIRST.
    return 0;
}

- (NSUInteger)numberOfPeopleWithFirstname:(NSString *)firstname{
#warning  NOT IMPLEMENTED YET. IMPLEMENT TEST FIRST.
    return 0;
}

- (Person *)personWithFirstname:(NSString *)firstname{
#warning  NOT IMPLEMENTED YET. IMPLEMENT TEST FIRST.
    return nil;
}

- (NSArray *)allPeople{
#warning  NOT IMPLEMENTED YET. IMPLEMENT TEST FIRST.
    return nil;
}

@end
