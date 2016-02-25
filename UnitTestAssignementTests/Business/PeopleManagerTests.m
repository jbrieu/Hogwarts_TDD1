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

#pragma mark Test Init

- (void)testInitWithJsonArray_NormalCase {
    NSString *filePath = [self pathForTestResource:@"people_1000_correct" ofType:@"json"];
    NSData *peopleJsonData = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    NSArray *peopleJsonArray = [NSJSONSerialization JSONObjectWithData:peopleJsonData options:NSJSONReadingAllowFragments error:&error];

    XCTAssertNil(error);
    
    PeopleManager *peopleManager = [[PeopleManager alloc] initWithJsonArray:peopleJsonArray];
    
    XCTAssertNotNil(peopleManager);
    XCTAssertEqual([peopleManager numberOfPeople], (NSUInteger)1000, @"Should load 1000 people exactly");
    XCTAssertEqual([[peopleManager allPeople] count], (NSUInteger)1000, @"Should load 1000 people exactly");
    
}

- (void)testInitWithJsonArray_MalformedFile {
    NSString *filePath = [self pathForTestResource:@"people_malformed_file" ofType:@"json"];
    NSData *peopleJsonData = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    NSArray *peopleJsonArray = [NSJSONSerialization JSONObjectWithData:peopleJsonData options:NSJSONReadingAllowFragments error:&error];
    
    XCTAssertNil(error);
    
    PeopleManager *peopleManager = [[PeopleManager alloc] initWithJsonArray:peopleJsonArray];
    
    XCTAssertNotNil(peopleManager);
    XCTAssertEqual([peopleManager numberOfPeople], (NSUInteger)0, @"Should load no people but not crashing");
    XCTAssertEqual([[peopleManager allPeople] count], (NSUInteger)0, @"Should load no people but not crashing");
}

- (void)testInitWithJsonArray_MissingSomeFirstnames {
    NSString *filePath = [self pathForTestResource:@"people_missing_some_firstnames" ofType:@"json"];
    NSData *peopleJsonData = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    NSArray *peopleJsonArray = [NSJSONSerialization JSONObjectWithData:peopleJsonData options:NSJSONReadingAllowFragments error:&error];
    
    XCTAssertNil(error);
    
    PeopleManager *peopleManager = [[PeopleManager alloc] initWithJsonArray:peopleJsonArray];
    XCTAssertNotNil(peopleManager);
    XCTAssertEqual([peopleManager numberOfPeople], (NSUInteger)4, @"Should load 4 people only. Rule is : firstname is mandatory, you cannot create Person without first firstname of or nil firstname");
    XCTAssertEqual([[peopleManager allPeople] count], (NSUInteger)4, @"Should load 4 people only. Rule is : firstname is mandatory, you cannot create Person without first firstname of or nil firstname");
}

- (void)testInitWithJsonArray_MissingAllFirstnames {
    NSString *filePath = [self pathForTestResource:@"people_missing_all_firstnames" ofType:@"json"];
    NSData *peopleJsonData = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    NSArray *peopleJsonArray = [NSJSONSerialization JSONObjectWithData:peopleJsonData options:NSJSONReadingAllowFragments error:&error];
    
    XCTAssertNil(error);
    
    PeopleManager *peopleManager = [[PeopleManager alloc] initWithJsonArray:peopleJsonArray];
    
    XCTAssertNotNil(peopleManager);
    XCTAssertEqual([peopleManager numberOfPeople], (NSUInteger)0, @"Should load no people. Rule is : firstname is mandatory, you cannot create Person without first firstname of or nil firstname");
    XCTAssertEqual([[peopleManager allPeople] count], (NSUInteger)0, @"Should load no people. Rule is : firstname is mandatory, you cannot create Person without first firstname of or nil firstname");
}


#pragma mark Test numberOfPeople


#pragma mark Test numberOfPeopleWithFirstname


#pragma mark Test allPeople


#pragma Private Test Tooling
- (NSString *)pathForTestResource:(NSString *)resource ofType:(NSString *)type{
    return [[NSBundle bundleForClass:self.class] pathForResource:resource ofType:type];
}

@end
