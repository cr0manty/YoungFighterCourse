//
//  Employee.m
//  YoungFighterCourse
//
//  Created by Денис on 22.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import "Employee.h"
#import "DatabaseController.h"


@implementation Employee(Custom)


- (NSString*)getFullName {
    if (!self.lastName) {
        return self.firstName;
    } else if(!self.firstName) {
        return self.lastName;
    } else {
        return [self.firstName stringByAppendingFormat:@" %@", self.lastName];
    }
}

+ (instancetype)initWithFirstName:(NSString*)first AndLastName:(NSString*)last AndSalary:(int)sal {
    Employee *employee = [NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:[DatabaseController sharedInstance].context];
    
    employee.firstName = first;
    employee.lastName = last;
    employee.salary = sal;
    
    return employee;
}

@end
