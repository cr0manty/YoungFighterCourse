//
//  Employee.h
//  YoungFighterCourse
//
//  Created by Денис on 22.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#ifndef Employee_h
#define Employee_h

@interface Employee : NSObject {
    NSString *firstName;
    NSString *lastName;
}

@property (nonatomic, readwrite) int salary;
@property (readonly, getter=getFullName) NSString* fullName;

-(NSString*)getFullName;

-(id)initWithFirstName:(NSString*)first AndLastName:(NSString*)las AndSalary:(int)sal;

@end


#endif /* Employee_h */
