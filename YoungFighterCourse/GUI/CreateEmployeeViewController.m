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

@end

@implementation CreateEmployeeViewController



- (IBAction)createEmployee:(id)sender {
    [self.delegate addEmployee: self.firstName.text LastName:self.lastName.text Salary: self.salary.text.intValue];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
