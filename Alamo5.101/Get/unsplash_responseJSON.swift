//
//  fetchUnsplash.swift
//  Alamo5.101
//
//  Created by muzna on 2020/12/11.
//

import Foundation
import Alamofire

struct Api {
    static func fetch() {
        
        let reqUrl = "https://api.unsplash.com/photos"
        let parameters: Parameters = [
            "client_id": key_unsplash, // security , 씨케
            "page": "3",
            "per_page": "20"
        ]
        
        let resp = AF.request(reqUrl,
                              method: .get,
                              parameters: parameters,
                              encoding: URLEncoding.default)
        
        resp.responseJSON { response in
            
            guard let dataOfResponse = response.data else{
                return
            }
            do {
                let final = try JSONDecoder().decode([UnsplashModel].self, from: dataOfResponse)
                print("final:\(final)")
                
            } catch let error {
                print("Error result: \(error)")
            }
        }
    }
}
