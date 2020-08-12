//
//  CreateEmployeeViewController.m
//  YoungFighterCourse
//
//  Created by Денис on 26.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import "CreateEmployeeViewController.h"

@interface CreateEmployeeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *salary;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveClick;
@property (weak, nonatomic) IBOutlet UIButton *datePicker;
@property (weak, nonatomic) IBOutlet UITextField *birthDate;

@property (copy, nonatomic) NSDate *birthDateValue;

@end

@implementation CreateEmployeeViewController

- (IBAction)openDatePicker:(id)sender {
    HSDatePickerViewController *hsdpvc = [[HSDatePickerViewController alloc] init];
    hsdpvc.delegate = self;

    [self presentViewController:hsdpvc animated:YES completion:nil];
}


- (IBAction)createEmployee:(id)sender {
    [self.delegate addEmployee: self.firstName.text LastName:self.lastName.text Salary: self.salary.text.intValue BirthDate:NSDate.now];
    [self.navigationController popViewControllerAnimated:true];
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)hsDatePickerPickedDate:(NSDate *)date
{
    self.birthDateValue = date;
    self.birthDate.text = self.birthDateValue.description;
//    [self.dateOfBirthButton setTitle:self.dateOfBirth.description forState:UIControlStateNormal];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
