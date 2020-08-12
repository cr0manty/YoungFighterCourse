//
//  Employee.h
//  YoungFighterCourse
//
//  Created by Денис on 22.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee+CoreDataClass.h"

@interface Employee(Custom)

@property (readonly, getter=getFullName) NSString* fullName;

- (NSString*)getFullName;

+ (instancetype)initWithFirstName:(NSString*)first AndLastName:(NSString*)las AndSalary:(int)sal;

@end

