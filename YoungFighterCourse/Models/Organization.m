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


+ (instancetype)initWithName:(NSString*)orgName {
    Organization *organization = [NSEntityDescription insertNewObjectForEntityForName:@"Organization" inManagedObjectContext:[DatabaseController sharedInstance].context];
    organization.name = orgName;
    return organization;
}

+ (instancetype)createFromJson:(NSDictionary *)data {
    NSString *name = data[@"name"];
    Organization *ogranization = [Organization initWithName:name];
    
    for (NSDictionary *employee in data[@"employees"]) {
        Employee *emp = [Employee createFromJson:employee];
        emp.index = employee[@"order"];
        [ogranization addEmployeesObject:emp];
    }
    
    return ogranization;
}


-(void)addEmployee:(Employee*)employee {
    [self addEmployeesObject:employee];
}

-(void)addEmployeeWithName:(NSString*)employeeName {
    NSArray *names = [employeeName componentsSeparatedByString:@" "];
    int salary = (int)10 + arc4random() % (490+1) * 10;
    NSString *lastName = names.count > 1 ? names[1] : nil;
    
    Employee *employee = [Employee initWithFirstName:names[0] AndLastName:lastName AndSalary:salary AndDate:NSDate.now];
    
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

- (NSArray<Employee *> *)employeesWithOrder
{

    
    NSSortDescriptor *orderDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"index" ascending:true];
    return [self.employees sortedArrayUsingDescriptors:@[orderDescriptor]];
}

- (void)shuffleEmployees
{
    NSUInteger count = [self.employees count];
    if (count <= 1) return;
    NSMutableArray *newEmployees = [self.employees allObjects];
    
    [self removeEmployees:self.employees];
    
    NSMutableArray *indexes = [[NSMutableArray alloc] initWithCapacity:count];
    for (int i = 0; i < count; i++) [indexes addObject:[NSNumber numberWithInt:i]];
    NSMutableArray *shuffle = [[NSMutableArray alloc] initWithCapacity:count];
    while ([indexes count])
    {
        int index = arc4random() % [indexes count];
        [shuffle addObject:[indexes objectAtIndex:index]];
        [indexes removeObjectAtIndex:index];
    }
    
    for (int i = 0; i < count; i++) {
        int16_t exchangeIndex = [[shuffle objectAtIndex:i] intValue];
        
        Employee *employee = [newEmployees objectAtIndex:exchangeIndex];
        employee.index = exchangeIndex;
        [self addEmployeesObject:employee];
    }
}



@end
