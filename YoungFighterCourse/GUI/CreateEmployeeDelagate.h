//
//  Protocol.h
//  YoungFighterCourse
//
//  Created by Денис on 26.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Employee.h"


// Protocol definition starts here
@protocol CreateEmployeeDelagate <NSObject>

@required
-(void)addEmployee:(Employee*) employee;

@end

