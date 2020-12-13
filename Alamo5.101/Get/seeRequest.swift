//
//  jsonRaw.swift
//  Alamo5.101
//
//  Created by muzna on 2020/12/11.
//

import Alamofire

private let reqUrl = "https://jsonplaceholder.typicode.com/todos/1"

extension Api {
    
    static func seeRequest() {
        
        print("코드상url:\(reqUrl)")
        
        AF.request(reqUrl)
           
            .responseJSON { response in
                
                print("실제 요청url:\(response.request)")
               
            }
        }
}
