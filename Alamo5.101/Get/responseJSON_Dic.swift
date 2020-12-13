//
//  jsonRaw.swift
//  Alamo5.101
//
//  Created by muzna on 2020/12/11.
//

import Alamofire

private let reqUrl = "https://jsonplaceholder.typicode.com/todos"

extension Api {
    static func fetchVerboseDic() {
            // HTTP Request
            AF.request(reqUrl,
                       headers: ["Content-Type":"application/json",
                                 "Accept":"application/json" ])
                .validate()
                .responseJSON { response in
                
                //응답, 요청, Json결과
                print("Request: \(String(describing: response.request))")
//                print("Response: \(String(describing: response.response))")
//                print("Result: \(response.result)")
                
                switch response.result {
                // 성공
                case .success(let res):
                    
                    //arr값을 먼저 가져오고
                    guard let arr = res as? [Any] else {
                        return
                    }
                    
                    // 첫번째 array값을 가져옴.
                    guard let firstDictionary = arr.first else { return }
                    
                    // 이제 딕셔너리 값을 가져옴.
                    guard let res = firstDictionary as? [AnyHashable: Any] else {
                        return
                    }
                    if let title = res["title"] as? String {
                        print(title)
                    }
                     
                    
                // 실패
                case .failure(let err):
                    print(err.localizedDescription)
                }
            }
    
        }
}
/*
    {
      "userId": 1,
      "id": 1,
      "title": "delectus aut autem",
      "completed": false
    }
    */
