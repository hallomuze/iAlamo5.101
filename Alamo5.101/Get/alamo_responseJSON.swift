//
//  jsonRaw.swift
//  Alamo5.101
//
//  Created by muzna on 2020/12/11.
//

import Alamofire

private let reqUrl = "https://jsonplaceholder.typicode.com/todos/1"

extension Api {
    
    static func fetchDic() {
        
        AF.request(reqUrl)
            .validate()
            .responseJSON { response in
                
                switch response.result {
                case .success(let res): // 성공
                    print(res)
                    
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
        }
}
