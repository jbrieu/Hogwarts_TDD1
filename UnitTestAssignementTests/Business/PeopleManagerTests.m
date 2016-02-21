//
//  PeopleManagerTests.m
//  PeopleManagerTests
//
//  Created by JbRieu on 2/19/16.
//  Copyright © 2016 JbRieu. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PeopleManager.h"

@interface PeopleManagerTests : XCTestCase

@end

@implementation PeopleManagerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

#pragma mark Test Init

- (void)testInitWithFileName_NormalCase {
    PeopleManager *peopleManager = [[PeopleManager alloc] initWithJsonFileNamed:@"people_1000_correct"];
    
    XCTAssertNotNil(peopleManager);
    XCTAssertEqual([peopleManager numberOfPeople], (NSUInteger)1000, @"Should load 1000 people exactly");
    XCTAssertEqual([[peopleManager allPeople] count], (NSUInteger)1000, @"Should load 1000 people exactly");
    
}

- (void)testInitWithFileName_MalformedFile {
    PeopleManager *peopleManager = [[PeopleManager alloc] initWithJsonFileNamed:@"people_malformed_file"];
    
    XCTAssertNotNil(peopleManager);
    XCTAssertEqual([peopleManager numberOfPeople], (NSUInteger)0, @"Should load no people but not crashing");
    XCTAssertEqual([[peopleManager allPeople] count], (NSUInteger)0, @"Should load no people but not crashing");
}

- (void)testInitWithFileName_MissingSomeFirstnames {
    PeopleManager *peopleManager = [[PeopleManager alloc] initWithJsonFileNamed:@"people_missing_some_firstnames"];
    
    XCTAssertNotNil(peopleManager);
    XCTAssertEqual([peopleManager numberOfPeople], (NSUInteger)4, @"Should load 4 people only. Rule is : firstname is mandatory, you cannot create Person without first firstname of or nil firstname");
    XCTAssertEqual([[peopleManager allPeople] count], (NSUInteger)4, @"Should load 4 people only. Rule is : firstname is mandatory, you cannot create Person without first firstname of or nil firstname");
}

- (void)testInitWithFileName_MissingFirstnames {
    PeopleManager *peopleManager = [[PeopleManager alloc] initWithJsonFileNamed:@"people_missing_all_firstnames"];
    
    XCTAssertNotNil(peopleManager);
    XCTAssertEqual([peopleManager numberOfPeople], (NSUInteger)0, @"Should load no people. Rule is : firstname is mandatory, you cannot create Person without first firstname of or nil firstname");
    XCTAssertEqual([[peopleManager allPeople] count], (NSUInteger)0, @"Should load no people. Rule is : firstname is mandatory, you cannot create Person without first firstname of or nil firstname");
}


#pragma mark Test numberOfPeople


#pragma mark Test numberOfPeopleWithFirstname


#pragma mark Test allPeople


@end
