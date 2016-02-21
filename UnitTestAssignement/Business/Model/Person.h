//
//  Person.h
//  UnitTestAssignement
//
//  Created by Coupang on 2/20/16.
//  Copyright © 2016 Coupang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, strong, readonly) NSString *firstname;

- (instancetype)initWithFirstname:(NSString *)firstname;

@end
