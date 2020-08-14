//
//  MainViewController.m
//  YoungFighterCourse
//
//  Created by Денис on 24.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import "MainViewController.h"
#import "DetailViewController.h"
#import "CreateEmployeeViewController.h"
#import "Organization.h"
#import "Employee.h"
#import "DatabaseController.h"
#import "YoungFighterCourse-Swift.h"



@interface MainViewController () <CreateEmployeeDelagate>

@property (strong, nonatomic) Organization *organization;
@property (weak, nonatomic) Employee *selectedEmployee;
//@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

@synthesize organization = _organization;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initOrganization];
    self.title = self.organization.name;
}

- (void)initOrganization {
    self.organization = [DatabaseController requestResultsForPredicate:nil sortDescriptors:nil entity:@"Organization"].firstObject;
    
    if (!self.organization) {
        _organization = [Organization initWithName:@"FaiFly"];
        [_organization addEmployeeWithName:@"Alexey Bondarchuk"];

        Employee *denis = [Employee initWithFirstName:@"Denis" AndLastName:@"Dudka" AndSalary:2600 AndDate:NSDate.now];
        Employee *ihor = [Employee initWithFirstName:@"Ihor" AndLastName:@"Embaievskyi" AndSalary:4000 AndDate:NSDate.now];

        [_organization addEmployee:denis];
        [_organization addEmployee:ihor];
        [DatabaseController saveContext];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.organization.employees.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    Employee *employee = [_organization getEmployeeAtIndex:indexPath.row];
    cell.textLabel.text = employee.fullName;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.organization removeEmployeeAtIndex:(int)indexPath.row];
        [tableView reloadData];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [super prepareForSegue:segue sender:sender];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    if ([segue.identifier isEqualToString:@"CellDetails"]) {
        DetailViewController *viewController = segue.destinationViewController;
        viewController.employee = [_organization getEmployeeAtIndex:indexPath.row];
    } else if ([segue.identifier isEqualToString:@"CreateEmployee"]) {
        CreateEmployeeViewController *viewController = segue.destinationViewController;
        viewController.delegate = self;
    } else if ([segue.identifier isEqualToString:@"SalarySum"]) {
        OrganizationInfoViewController *organizationInfoViewController = segue.destinationViewController;
        organizationInfoViewController.organization = self.organization;
    }
}

-(void)addEmployee:(NSString*) firstName LastName:(NSString*) lastName Salary: (int32_t) salary BirthDate : (NSDate *) date {
    Employee *employee = [Employee initWithFirstName:firstName AndLastName:lastName AndSalary:salary AndDate:date];
    [self.organization addEmployee: employee];
    [DatabaseController saveContext];
    [self.tableView reloadData];
}

@end
