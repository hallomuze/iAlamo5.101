//
//  flickr.swift
//  Alamo5.101
//
//  Created by muzna on 2020/12/11.
//

import Foundation
import Alamofire

extension Api {
    
    static func alamo_Decodable_func() {
 
        let reqUrl = "https://jsonplaceholder.typicode.com/todos/1"
        
        let resp = AF.request(reqUrl,
                              method: .get,
                              encoding: JSONEncoding.default)
        
        //data type을 받음 - 따라서 JSONDecoder가 필요함.
        resp.response { afData in
            
            switch afData.result {
            case .success(let userDatas):
                guard let userDatas = userDatas else {
                    return
                }
                // data type을 userData type으로 디코딩해야 함.
                if let final = try? JSONDecoder().decode(UserData.self, from: userDatas) {
                    print("결과:\(final)")
                } else {
                    print("err")
                }
                 
            //completionHandler(.success(userDatas))
            case .failure(let error):
                print(error)
            }
            
        }
        
        // 이미 디코딩 상태이므로 JSONDecoder가 불필요함.
        // T type을 받음, 그래서 <> 를 설정해야 함.
        resp.responseDecodable { (resp: DataResponse<UserData, AFError>) in
            switch resp.result {
            case .success(let userDatas):
                print(userDatas)
            //completionHandler(.success(userDatas))
            case .failure(let error):
                print(error)
            //completionHandler(.failure(error))
            }
        }
        // 출처: https://kor45cw.tistory.com/294 [Developer's]
    }
}
