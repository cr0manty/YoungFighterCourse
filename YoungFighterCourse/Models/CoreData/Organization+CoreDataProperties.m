//
//  Organization+CoreDataProperties.m
//  YoungFighterCourse
//
//  Created by Денис on 12.08.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//
//

#import "Organization+CoreDataProperties.h"

@implementation Organization (CoreDataProperties)

+ (NSFetchRequest<Organization *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"Organization"];
}

@dynamic name;
@dynamic employees;

@end
