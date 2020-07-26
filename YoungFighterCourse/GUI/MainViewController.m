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

@interface MainViewController () <CreateEmployeeDelagate>

@property (strong, nonatomic) Organization *organization;
@property (weak, nonatomic) Employee *selectedEmployee;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

@synthesize organization = _organization;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initOrganization];
    self.title = _organization.name;
}

- (void)initOrganization {
    _organization = [[Organization alloc]initWithName:@"FaiFly"];
    [_organization addEmployeeWithName:@"Alexey Bondarchuk"];
    
    Employee *denis = [[Employee alloc]initWithFirstName:@"Denis" AndLastName:@"Dudka" AndSalary:2600];
    Employee *ihor = [[Employee alloc]initWithFirstName:@"Ihor" AndLastName:@"Embaievskyi" AndSalary:4000];
    
    [_organization addEmployee:denis];
    [_organization addEmployee:ihor];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _organization.employeeAmount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BasicCell" forIndexPath:indexPath];
    
    Employee *employee = [_organization getEmployeeAtIndex:indexPath.row];
    cell.textLabel.text = employee.fullName;
    
    return cell;
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
    }
}

-(void)addEmployee:(Employee*) employee {
    [self.organization addEmployee: employee];
    [self.tableView reloadData];
}

@end
