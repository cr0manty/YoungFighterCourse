//
//  Employee+CoreDataProperties.h
//  YoungFighterCourse
//
//  Created by Денис on 12.08.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//
//

#import "Employee+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Employee (CoreDataProperties)

+ (NSFetchRequest<Employee *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nonatomic) int32_t salary;
@property (nullable, nonatomic, retain) Organization *organization;

@end

NS_ASSUME_NONNULL_END
