//
//  SumSalary.swift
//  YoungFighterCourse
//
//  Created by Денис on 12.08.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

import UIKit
import SVProgressHUD
import BigNumber


class OrganizationInfoViewController : UIViewController
{
    @objc static let kEmployeesOrderHasChanged :String = "ChangeOrderEmployees"
    @objc var organization: Organization!
    var salarySum: Int32?
    @objc var selectOrganization : ((Organization) -> Void)!
    
    func fibonachi(_ num : Int) -> BDouble {
        var first = BDouble((1 + sqrt(5)) / 2)
        first = first ** num
        var second = BDouble((1 - sqrt(5)) / 2)
        second = second ** num
        return (first - second) / BDouble(sqrt(5))
    }

    @IBAction func onFibonachiClick(_ sender: Any) {
        UIApplication.shared.beginIgnoringInteractionEvents()
        SVProgressHUD.show()
        
        DispatchQueue.global(qos: .userInitiated).async {
            let fibNum = 300 // 100 000 fibonachi number?
            let fibonachiValue = self.fibonachi(fibNum)
            DispatchQueue.main.async {
                SVProgressHUD.dismiss()
                UIApplication.shared.endIgnoringInteractionEvents()
                let alert = UIAlertController(title: "\(fibNum)th Fibonacci number", message: fibonachiValue.description, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                
                self.present(alert, animated: true, completion: nil)

            }
        }
    }
    
    @IBAction func randomizeOrder(_ sender: Any) {
        self.organization.shuffleEmployees();
        DatabaseController.saveContext()
        NotificationCenter.default.post(name: NSNotification.Name(OrganizationInfoViewController.kEmployeesOrderHasChanged), object: nil)
    }
    
    func parseJson(jsonData : [String: AnyObject]) -> () {
        print(jsonData)
    }
    
    @IBAction func fetchOrganization(_ sender: Any) {
        RequestManager.fetchOrganizations(closureBloack: { (response) in
            DatabaseController.purgeDatabase()
            
            for organization in response["organizations"] as! [AnyObject] {
                Organization.create(fromJson: organization as! [String : AnyObject])
            }
            DatabaseController.saveContext()
            
            let alert = UIAlertController(title: "Choose Organization", message: nil, preferredStyle: .alert)
            let organizations = DatabaseController.requestResults(for: nil, sortDescriptors: nil, entity: "Organization") as! [Organization]
            
            for organization in organizations {
                alert.addAction(UIAlertAction(title: organization.name, style: .default, handler: { (action) in
                    self.selectOrganization(organization)
                    self.navigationController!.popViewController(animated: true)
                }))
            }
            self.present(alert, animated: true, completion: nil)
        })
    }
    
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
