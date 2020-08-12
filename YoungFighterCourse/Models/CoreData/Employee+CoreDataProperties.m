//
//  Employee+CoreDataProperties.m
//  YoungFighterCourse
//
//  Created by Денис on 12.08.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//
//

#import "Employee+CoreDataProperties.h"

@implementation Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Employee"];
}

@dynamic firstName;
@dynamic lastName;
@dynamic salary;
@dynamic organization;

@end
