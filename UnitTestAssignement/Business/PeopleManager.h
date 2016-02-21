//
//  PeopleManager.h
//  UnitTestAssignement
//
//  Created by Coupang on 2/20/16.
//  Copyright © 2016 Coupang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Person;

@interface PeopleManager : NSObject

- (instancetype)initWithJsonFileNamed:(NSString *)filename;

- (NSUInteger)numberOfPeople;
- (NSUInteger)numberOfPeopleWithFirstname:(NSString *)firstname;
- (Person *)personWithFirstname:(NSString *)firstname;
- (NSArray *)allPeople;


// Add More methods here : 1. add method here / 2. create unit tests / 3. implement method

@end
