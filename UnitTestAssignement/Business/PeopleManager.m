//
//  PeopleManager.m
//  UnitTestAssignement
//
//  Created by JbRieu on 2/20/16.
//  Copyright © 2016 JbRieu. All rights reserved.
//

#import "PeopleManager.h"
#import "Person.h"

#define PEOPLE_FIRSTNAME_KEY @"first_name"

@interface PeopleManager ()

@property (nonatomic, strong) NSArray *people;

@end

@implementation PeopleManager

- (instancetype)initWithJsonArray:(NSArray *)jsonArray {

    self = [super init];
    if (self) {
        NSMutableArray *parsingArray = [[NSMutableArray alloc] init];
        
        for (NSDictionary *personDictionary in jsonArray)
        {
            Person *person = [[Person alloc] initWithFirstname:[personDictionary objectForKey:PEOPLE_FIRSTNAME_KEY]];
            if(person) {
                [parsingArray addObject:person];
            }
        }
        
        _people = [NSArray arrayWithArray:parsingArray];
        
    }
    return self;
}

- (NSUInteger)numberOfPeople {
    return [_people count];
}


- (NSUInteger)numberOfPeopleWithFirstname:(NSString *)firstname {
#warning  NOT IMPLEMENTED YET. IMPLEMENT TEST FIRST.
    return 0;
}


- (Person *)personWithFirstname:(NSString *)firstname {
#warning  NOT IMPLEMENTED YET. IMPLEMENT TEST FIRST.
    return nil;
}

- (NSArray *)allPeople {
#warning  NOT IMPLEMENTED YET. IMPLEMENT TEST FIRST.
    return nil;
}

@end
