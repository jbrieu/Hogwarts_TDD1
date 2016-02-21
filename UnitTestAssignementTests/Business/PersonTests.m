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

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark Test InitWithFirstname
- (void)testInitWithFileName_NormalCase {
    Person *person = [[Person alloc] initWithFirstname:@"Mickael"];
    
    XCTAssertNotNil(person);
    XCTAssertEqualObjects([person firstname], @"Mickael", @"Should have the firstname given");
}

- (void)testInitWithFileName_EmptyName {
    Person *person = [[Person alloc] initWithFirstname:@""];
    
    XCTAssertNil(person, @"Our specification is : do not init if name is empty");
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
