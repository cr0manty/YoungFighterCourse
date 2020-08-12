//
//  CreateEmployeeViewController.h
//  YoungFighterCourse
//
//  Created by Денис on 26.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HSDatePickerViewController.h"

@class Employee;

@protocol CreateEmployeeDelagate <NSObject>

@required
-(void)addEmployee:(NSString*) firstName LastName:(NSString*) lastName Salary: (int32_t) salary  BirthDate : (NSDate *) date;

@end


@protocol HSDatePickerViewControllerDelegate <NSObject>
- (void)hsDatePickerPickedDate:(NSDate *)date;
@optional
- (void)hsDatePickerWillDismissWithQuitMethod:(HSDatePickerQuitMethod)method;
- (void)hsDatePickerDidDismissWithQuitMethod:(HSDatePickerQuitMethod)method;
@end

NS_ASSUME_NONNULL_BEGIN

@interface CreateEmployeeViewController : UIViewController

@property (weak, nonatomic) id<CreateEmployeeDelagate> delegate;

@end

NS_ASSUME_NONNULL_END
