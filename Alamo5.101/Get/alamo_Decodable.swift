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
        
        func step1 () {
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
                     
                case .failure(let error):
                    print(error)
                }
                
            }
        }
        func step2(){
            // 이미 디코딩 상태이므로 JSONDecoder가 불필요함.
            // T type을 받음, 그래서 <> 를 설정해야 함.
            resp.responseDecodable { (resp: DataResponse<UserData, AFError>) in
                switch resp.result {
                case .success(let userDatas):
                    print("바로결과:",userDatas)
                case .failure(let error):
                    print(error)
                }
            }
            // 출처: https://kor45cw.tistory.com/294 [Developer's]
        }
        
        // 가장 간편한 방법임
        func decodeFast() {
            resp.responseDecodable(of: UserData.self){ resp in
                
                debugPrint(resp)// to see all info, body {} in case of 404
                
                switch resp.result {
                case .success(let userDatas):
                    print("매우 빠른 결과:",userDatas)
                    print("매우 빠른 결과2:", resp.value)// if you want this way
                case .failure(let error):
                    print(error)
                }
            }
        }
        
        decodeFast()
        /*
         response.result 는 Result타입이 반환
         response.value 는 디코딩된 모델이 반환 -- 즉시 userdata가 들어옴.
 
         response.value를 통해서 후처리를 함
 
         출처: https://nsios.tistory.com/49 [NamS의 iOS일기]
         */
    }
}

/*
 
 reqUrl 를 조금 엉망으로 하고 실행하면
 
 debugPrint하면
 특히 404라면, 아래처럼 각종 데이터 다 보여줌
 특히 [Body]: {} 처럼 되어 있기땜에  keyNotFound(CodingKeys(stringValue: "userId", intValue: nil) 가 발생함.
 
 [Request]: GET https://jsonplaceholder.typicode.com/todols/1
     [Headers]: None
     [Body]: None
 [Response]:
     [Status Code]: 404
     [Headers]:
         access-control-allow-credentials: true
         Age: 330
         Cache-Control: max-age=43200
         cf-cache-status: HIT
         cf-ray: 60102d9ddecf364f-LAX
         cf-request-id: 06fdfad6a50000364f7e987000000001
         Content-Length: 2
         Content-Type: application/json; charset=utf-8
         Date: Sun, 13 Dec 2020 13:54:38 GMT
         Etag: W/"2-vyGp6PvFo4RvsFtPoIWeCReyIC8"
         expect-ct: max-age=604800, report-uri="https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct"
         Expires: -1
         nel: {"report_to":"cf-nel","max_age":604800}
         Pragma: no-cache
         report-to: {"endpoints":[{"url":"https:\/\/a.nel.cloudflare.com\/report?s=oGqFFVxRsxqCbhY6kknJepX3hg68yoYrxGpaa51ezasiT2obK77EPpz%2Fs4DqDhwTKSV3MGmuRp8rZK7zdsjzl8G%2F3lIMKvltB%2BkrknTrru8pF07XoDRqwgbJ2hk8"}],"group":"cf-nel","max_age":604800}
         Server: cloudflare
         Vary: Origin, Accept-Encoding
         Via: 1.1 vegur
         x-content-type-options: nosniff
         x-powered-by: Express
         x-ratelimit-limit: 1000
         x-ratelimit-remaining: 999
         x-ratelimit-reset: 1607867350
     [Body]:
         {}
 [Network Duration]: 0.6548600196838379s
 */
