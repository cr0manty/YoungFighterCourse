//
//  Organization.h
//  YoungFighterCourse
//
//  Created by Денис on 22.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#ifndef Organization_h
#define Organization_h
#import "Employee.h"

@interface Organization : NSObject {
    NSArray<Employee*> *employees;
}

@property (readonly, getter=employeeAmount) NSInteger employeesAmount;

@property (nonatomic, readwrite) NSString* name;

-(id)initWithName:(NSString*)orgName;

-(void)addEmployee:(Employee*)employee;

-(void)addEmployeeWithName:(NSString*)employeeName;

-(float)calculateAverageSalary;

-(Employee*)employeeWithLowestSalary;

-(NSArray<Employee*>*) employeesWithSalary:(int)salary Tolerance:(int)tolerance;

-(NSInteger) employeeAmount;

-(Employee*) getEmployeeAtIndex:(NSInteger)index;

@end


#endif /* Organization_h */
