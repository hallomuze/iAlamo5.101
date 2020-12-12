//
//  jsonPlaceHolder.swift
//  Alamo5.101
//
//  Created by muzna on 2020/12/11.
//

import Foundation
import Alamofire
 
private let reqUrl = "https://jsonplaceholder.typicode.com/todos/1"

extension Api {
    static func fetchJsonPlaceHolder_codable() {
         
        let resp = AF.request(reqUrl,
                              method: .get,
                              encoding: URLEncoding.default) // 여기서는 JSONEncoding 옵션해도 됨.
        
        resp.responseJSON { response in
            
            guard let dataOfResponse = response.data else{
                return
            }
             
            if let final = try? JSONDecoder().decode(UserData.self, from: dataOfResponse) {
                print("결과:\(final)")
            } else {
                print("err")
            }
            // 이 구문은 do catch로 바꾸고 error를 구할 수도 있다.
        }
    }
    
   
    
}
 
struct UserData: Decodable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
 /*
     {
       "userId": 1,
       "id": 1,
       "title": "delectus aut autem",
       "completed": false
     }
     */
}
