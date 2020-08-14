//
//  RequestManager.swift
//  YoungFighterCourse
//
//  Created by Денис on 14.08.2020.
//  Copyright © 2020 cr0manty. All rights reserved.
//

import Foundation
import Alamofire

class RequestManager : NSObject {
    private static let requestUrl : String = "https://gitlab.faifly.com/ios-general/ios-tutorial/uploads/ffffec34fa4a727922bb1e09cc24b21d/tutorial.json"
    
    static func fetchOrganizations(closureBloack: @escaping ([String: AnyObject]) -> ()) {
        AF.request(RequestManager.requestUrl).responseJSON { (response) in
            switch response.result {
                case .success(let value):
                    closureBloack(value as! [String: AnyObject])
                case .failure(let error):
                    print(error)
            }
            
        }
    }
    
}
