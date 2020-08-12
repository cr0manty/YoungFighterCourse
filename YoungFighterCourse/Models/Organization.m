//
//  Organization.m
//  YoungFighterCourse
//
//  Created by Денис on 22.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import "Organization.h"
#import "Employee.h"
#import "DatabaseController.h"

@implementation Organization(Custom)


+ (instancetype)initWithName:(NSString*)orgName{
    Organization *organization = [NSEntityDescription insertNewObjectForEntityForName:@"Organization" inManagedObjectContext:[DatabaseController sharedInstance].context];
    organization.name = orgName;
    return organization;
}

-(void)addEmployee:(Employee*)employee {
    [self addEmployeesObject:employee];
}

-(void)addEmployeeWithName:(NSString*)employeeName {
    NSArray *names = [employeeName componentsSeparatedByString:@" "];
    int salary = (int)10 + arc4random() % (490+1) * 10;
    NSString *lastName = names.count > 1 ? names[1] : nil;
    
    Employee *employee = [Employee initWithFirstName:names[0] AndLastName:lastName AndSalary:salary];
    
    [self addEmployeesObject:employee];
}

-(float)calculateAverageSalary {
    int avgSalary = 0;
    
    for (Employee* employee in self.employees) {
        avgSalary += employee.salary;
    }
    
    return avgSalary / self.employees.count;
}

-(Employee*)employeeWithLowestSalary {
    Employee *lowest = nil;
    
    for (Employee *employee in self.employees) {
        if (!lowest || employee.salary < lowest.salary) {
            lowest = employee;
        }
    }
    
    return lowest;
}

-(NSArray<Employee*>*) employeesWithSalary:(int)salary Tolerance:(int)tolerance {
    NSMutableArray *newEmployees = [[NSMutableArray alloc] init];
    
    for (Employee * employee in self.employees) {
        if (salary - tolerance <= employee.salary && employee.salary <= salary + tolerance) {
            [newEmployees addObject:employee];
        }
    }
    
    return newEmployees;
}

-(NSInteger) employeeAmount {
    return self.employees.count;
}

-(Employee*) getEmployeeAtIndex:(NSInteger)index {
    NSArray *array = [self.employees allObjects];
    return array[index];
}

-(void)removeEmployeeAtIndex:(int)index {
    Employee *employee = [self getEmployeeAtIndex: index];
    if (employee != nil) {
        [self removeEmployeesObject: employee];
    }
}

@end
