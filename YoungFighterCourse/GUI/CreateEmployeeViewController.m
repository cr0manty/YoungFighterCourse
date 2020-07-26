//
//  CreateEmployeeViewController.m
//  YoungFighterCourse
//
//  Created by Денис on 26.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import "CreateEmployeeViewController.h"
#import "Employee.h"

@interface CreateEmployeeViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *salary;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveClick;

@end

@implementation CreateEmployeeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)createEmployee:(id)sender {
    Employee *employee = [[Employee alloc] initWithFirstName:self.firstName.text AndLastName:self.lastName.text AndSalary:self.salary.text.intValue];
    [self.delegate addEmployee: employee];
    [self.navigationController popViewControllerAnimated:true];

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
