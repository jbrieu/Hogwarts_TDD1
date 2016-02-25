//
//  PersonTests.m
//  PersonTests
//
//  Created by JbRieu on 2/19/16.
//  Copyright © 2016 JbRieu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Person.h"

@interface PersonTests : XCTestCase

@end

@implementation PersonTests

#pragma mark Test InitWithFirstname
- (void)testInitWithFileName_NormalCase {
    Person *person = [[Person alloc] initWithFirstname:@"Mickael"];
    
    XCTAssertNotNil(person);
    XCTAssertEqualObjects([person firstname], @"Mickael", @"Should have the firstname given");
}

- (void)testInitWithFileName_EmptyName {
    Person *person = [[Person alloc] initWithFirstname:@""];
    
    XCTAssertNil(person, @"Our specification is : do not init if name is empty");
    
    person = [[Person alloc] initWithFirstname:@"             "];
    XCTAssertNotNil(person, @"Our specification is : do not init if name is made of empty space");
}

- (void)testInitWithFileName_NilName {
    Person *person = [[Person alloc] initWithFirstname:nil];
    
    XCTAssertNil(person, @"Our specification is : do not init if name is nil");
}

#pragma mark Test firstname
- (void)testFirstname_NormalCase {
    Person *person = [[Person alloc] initWithFirstname:@"Bob"];
    
    XCTAssertEqualObjects([person firstname], @"Bob", @"Should have the firstname given");
}



@end
