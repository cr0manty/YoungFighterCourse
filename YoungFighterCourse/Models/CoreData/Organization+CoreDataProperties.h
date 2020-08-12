//
//  Organization+CoreDataProperties.h
//  YoungFighterCourse
//
//  Created by Денис on 12.08.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//
//

#import "Organization+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Organization (CoreDataProperties)

+ (NSFetchRequest<Organization *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) NSSet<Employee *> *employees;

@end

@interface Organization (CoreDataGeneratedAccessors)

- (void)addEmployeesObject:(Employee *)value;
- (void)removeEmployeesObject:(Employee *)value;
- (void)addEmployees:(NSSet<Employee *> *)values;
- (void)removeEmployees:(NSSet<Employee *> *)values;

@end

NS_ASSUME_NONNULL_END
