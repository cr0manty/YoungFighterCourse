//
//  ViewController.m
//  YoungFighterCourse
//
//  Created by Денис on 24.07.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

#import "DetailViewController.h"
#import "Employee.h"


@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *label;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.employee.fullName;
    NSString *text = [NSString stringWithFormat:@"%@'s salary is %i", self.employee.fullName, self.employee.salary];
    
    if (self.employee.birthDate != nil) {
        text = [text stringByAppendingFormat:@"\n\nDate of Birth:\n %@", self.employee.birthDate.description];
    }
    
    self.label.text = text;
}


@end
