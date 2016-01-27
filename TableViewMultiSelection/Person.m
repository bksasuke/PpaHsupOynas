//
//  Person.m
//  TableViewObjC
//
//  Created by hoang dang trung on 9/10/15.
//  Copyright (c) 2015 hoang dang trung. All rights reserved.
//

#import "Person.h"

@implementation Person
NSArray *firstNames;
NSArray *lastNames;

- (id) init {
    static dispatch_once_t dispatch_Once;
    dispatch_once (&dispatch_Once, ^ {
        firstNames = @[@"Adams", @"John", @"Blake", @"Jack", @"Anna", @"Marry", @"Mariana", @"Henry", @"Madonna", @"Elvis", @"Jacko", @"Kenedy"];
        lastNames = @[@"Tale", @"Johnson", @"Nickson", @"Ducati", @"Monster", @"Vancuver", @"Montoya", @"Garcia", @"Malinois", @"Francesco", @"Cudicini", @"Philips", @"Mecina"];
    });
    if (self = [super init]) {
        _name = [NSString stringWithFormat:@"%@ %@",
                 firstNames[arc4random_uniform((int)firstNames.count)],
                 lastNames[arc4random_uniform((int)lastNames.count)]];
        
        _age = 4 + arc4random_uniform(80);
    }
    return self;
    
}

@end


