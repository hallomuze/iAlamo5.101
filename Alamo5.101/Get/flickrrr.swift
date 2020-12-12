//
//  flickr.swift
//  Alamo5.101
//
//  Created by muzna on 2020/12/11.
//

import Foundation
import Alamofire

// 아래 코드는 정리 필요함.
extension Api {
    
    static func fetchFlickr() {
        let reqUrl = "https://api.flickr.com/services/rest"
        let parameters: Parameters = [
            "nojsoncallback": "1",
            "method": "flickr.photos.getRecent",
            "format":"json",
            "api_key": key_flick,
            "extras": "url_h,date_taken",
            "per_page": "20"
        ]
         
        // 주의 : URLEncoding으로 해야 함!!!
        
        let resp = AF.request(reqUrl,
                              method: .get,
                              parameters: parameters,
                              encoding: URLEncoding.default) // JSONEncoding하면 안 됨
         
        /*
         JSONEncoding 하면 아래 에러 발생함.
         AFError.URLRequestValidationFailureReason.bodyDataInGETRequest
         
         */
        
        resp.responseJSON { response in
            
            print("response:\(response.request)")
//            guard let dataOfResponse = response.data else{
//                return
//            }
            
            switch response.result {
            case .success(let data):
                guard let data = data as? [AnyHashable: Any] else {
                    return
                }
                guard let photos = data["photos"] as? [String:Any] else {
                    return
                }
                guard let photosArray = photos["photo"] as? [[String:Any]] else {
                    return
                }
                print("sss: \(photosArray)")
                
            case .failure(let err):
                print(err)

            }
           
        }
    }
    
}
