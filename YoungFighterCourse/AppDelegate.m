//
//  AppDelegate.m
//  YoungFighterCourse
//
//  Created by Денис on 24.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import "AppDelegate.h"
#import "Organization.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (void)applicationDidFinishLaunching:(UIApplication *)application {
    Organization *organization = [[Organization alloc]initWithName:@"FaiFly"];
    Employee *em = [[Employee alloc]initWithFirstName:@"Denis" AndLastName:@"Dudka" AndSalary:2600];
    
    NSLog(@"Add employee obj with Full Name = %@ and salary = %i", em.fullName, em.salary);
    [organization  addEmployee:em];
    
    float avgSalary = [organization calculateAverageSalary];
    NSLog(@"Avg salary for 1 employee %f", avgSalary);
    
    NSLog(@"Adding new employee");
    [organization addEmployeeWithName:@"NeDenis"];
    
    float avgSalaryForTwo = [organization calculateAverageSalary];
    NSLog(@"Avg salary for 2 employee %f", avgSalaryForTwo);
    
    Employee *lowestSalary = [organization employeeWithLowestSalary];
    NSLog(@"Employee with lowest salary = %@, salary = %i", lowestSalary.fullName, lowestSalary.salary);
    
    int searchSalary = 2500;
    int tolerance = 250;
    NSArray<Employee*> *employeesWithTolerance = [organization employeesWithSalary:searchSalary Tolerance:tolerance];
    NSLog(@"Employees with salary = %i, tolerance = %i", searchSalary, tolerance);
    
    for (Employee *eployee in employeesWithTolerance) {
        NSLog(@"%@, salary = %i", eployee.fullName, eployee.salary);
    }
}



#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
