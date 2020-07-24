//
//  Organization.m
//  YoungFighterCourse
//
//  Created by Денис on 22.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Organization.h"

@implementation Organization

@synthesize name;

-(id)initWithName:(NSString*)orgName {
    if (self = [super init]) {
        name = orgName;
        employees = [[NSArray alloc]init];
    }
    return self;
}

-(void)addEmployee:(Employee*)employee {
    employees = [employees arrayByAddingObject:employee];
}

-(void)addEmployeeWithName:(NSString*)employeeName {
    NSArray *names = [employeeName componentsSeparatedByString:@" "];
    int salary = (int)10 + arc4random() % (490+1) * 10;
    NSString *lastName = names.count > 1 ? names[1] : nil;
    
    Employee *employee = [[Employee alloc]initWithFirstName:names[0] AndLastName:lastName AndSalary:salary];
    
    [self addEmployee:employee];
}

-(float)calculateAverageSalary {
    int avgSalary = 0;
    
    for (Employee* employee in employees) {
        avgSalary += employee.salary;
    }
    
    return avgSalary / employees.count;
}

-(Employee*)employeeWithLowestSalary {
    Employee *lowest = nil;
    
    for (Employee *employee in employees) {
        if (!lowest || employee.salary < lowest.salary) {
            lowest = employee;
        }
    }
    
    return lowest;
}

-(NSArray<Employee*>*) employeesWithSalary:(int)salary Tolerance:(int)tolerance {
    NSMutableArray *newEmployees = [[NSMutableArray alloc] init];
    
    for (Employee * employee in employees) {
        if (salary - tolerance <= employee.salary && employee.salary <= salary + tolerance) {
            [newEmployees addObject:employee];
        }
    }
    
    return newEmployees;
}

@end
