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
    XCTAssertEqual([peopleJsonArray count], (NSUInteger)1000, @"File should be an array with 1000 items (dictionaries actually)");
    
    PeopleManager *peopleManager = [[PeopleManager alloc] initWithJsonArray:peopleJsonArray];
    
    XCTAssertNotNil(peopleManager);
    XCTAssertEqual([peopleManager numberOfPeople], (NSUInteger)1000, @"Should load 1000 people exactly");
    
}

- (void)testInitWithJsonArray_Performance {
    NSString *filePath = [self pathForTestResource:@"people_1000_correct" ofType:@"json"];
    NSData *peopleJsonData = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    NSArray *peopleJsonArray = [NSJSONSerialization JSONObjectWithData:peopleJsonData options:NSJSONReadingAllowFragments error:&error];
    
    XCTAssertNil(error);
    XCTAssertEqual([peopleJsonArray count], (NSUInteger)1000, @"File should be an array with 1000 items (dictionaries actually)");
    
    [self measureBlock:^{
        PeopleManager *peopleManager = [[PeopleManager alloc] initWithJsonArray:peopleJsonArray];
        XCTAssertNotNil(peopleManager);
    }];
    
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
}


#pragma mark Test numberOfPeople

- (void)testNumberOfPeople {
    PeopleManager *peopleManager = [[PeopleManager alloc] initWithJsonArray:@[]];
    
    XCTAssertEqual([peopleManager numberOfPeople], (NSUInteger)0, @"Given nobody, count should be zero");
    
    NSDictionary *person1 = @{@"first_name" : @"Alice"};
    
    peopleManager = [[PeopleManager alloc] initWithJsonArray:@[person1]];
    
    XCTAssertEqual([peopleManager numberOfPeople], (NSUInteger)1, @"Given one person, count should be one person");
    
    // Try to find what can go wrong, ignore implementation, imagine that implementation is very complex
    // Other combination possible : what if I change the order ? What if I call other methods first ? What if I give one million people ? If I change the firstname key what happens ? Should not insert people because of strict rules ?
    // Try to use Setup, Tear Down for people creation if multiple methods needs it
    // Carreful not to spend to much time on a simple method, only normal and extreme cases, not intermediary
    // Don't test Init but test NumberOfPeople
}

#pragma mark Test numberOfPeopleWithFirstname


#pragma mark Test allPeople


#pragma Private Test Tooling
- (NSString *)pathForTestResource:(NSString *)resource ofType:(NSString *)type{
    return [[NSBundle bundleForClass:self.class] pathForResource:resource ofType:type];
}

@end
