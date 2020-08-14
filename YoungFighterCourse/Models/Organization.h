//
//  Organization.h
//  YoungFighterCourse
//
//  Created by Денис on 22.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Organization+CoreDataClass.h"

@class Employee;

@interface Organization(Custom)

@property (readonly, getter=employeeAmount) NSInteger employeesAmount;

@property (nonatomic, readwrite) NSString* name;

+(instancetype)initWithName:(NSString*)orgName;

+ (instancetype)createFromJson:(NSDictionary *)data;

-(void)addEmployee:(Employee*)employee;

-(void)addEmployeeWithName:(NSString*)employeeName;

-(void)removeEmployeeAtIndex:(int)index;

-(float)calculateAverageSalary;

-(Employee*)employeeWithLowestSalary;

-(NSArray<Employee*>*) employeesWithSalary:(int)salary Tolerance:(int)tolerance;

-(NSInteger) employeeAmount;

-(Employee*) getEmployeeAtIndex:(NSInteger)index;

- (NSArray<Employee *> *)employeesWithOrder;

- (void)shuffleEmployees;

@end

