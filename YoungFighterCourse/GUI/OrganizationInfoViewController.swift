//
//  SumSalary.swift
//  YoungFighterCourse
//
//  Created by Денис on 12.08.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

import UIKit

class OrganizationInfoViewController : UIViewController
{
    var organization: Organization!
    var salarySum: Int32?
    
    @IBAction func calculateSalary(_ sender: Any) {
        self.salarySum = 0
        
        for employee in self.organization.employees! {
            self.salarySum! += employee.salary
        }
        
        let alertController = UIAlertController(title: nil, message: "Salary sum is \(self.salarySum!)", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
}
