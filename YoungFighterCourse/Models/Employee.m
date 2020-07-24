//
//  Employee.m
//  YoungFighterCourse
//
//  Created by Денис on 22.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import <Foundation/Foundation.h>
#include "Employee.h"


@implementation Employee

@synthesize salary;

-(NSString*)getFullName {
    if (!lastName) {
        return firstName;
    } else if(!firstName) {
        return lastName;
    } else {
        return [firstName stringByAppendingFormat:@" %@", lastName];
    }
}

-(id)initWithFirstName:(NSString*)first AndLastName:(NSString*)last AndSalary:(int)sal {
    if (self = [super init]) {
        firstName = first;
        lastName = last;
        salary = sal;
    }
    return self;
}

@end
