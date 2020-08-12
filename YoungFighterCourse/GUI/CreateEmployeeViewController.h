//
//  CreateEmployeeViewController.h
//  YoungFighterCourse
//
//  Created by Денис on 26.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Employee;

@protocol CreateEmployeeDelagate <NSObject>

@required
-(void)addEmployee:(NSString*) firstName LastName:(NSString*) lastName Salary: (int32_t) salary;


@end

NS_ASSUME_NONNULL_BEGIN

@interface CreateEmployeeViewController : UIViewController

@property (weak, nonatomic) id<CreateEmployeeDelagate> delegate;

@end

NS_ASSUME_NONNULL_END
