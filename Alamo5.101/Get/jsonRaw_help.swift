//
//  jsonRaw.swift
//  Alamo5.101
//
//  Created by muzna on 2020/12/11.
//

 
 
/*
 
 ### response의 검증방법:
 
 .validate
 를 풀어쓰면 아래와 같다
 .validate(statusCode: 200..<300)
 .validate(contentType: ["application/json"])
 
 ### request 의 헤더 추가방법:
 
    형식:
    headers: ["Content-Type":"application/json", "Accept":"application/json"])
  
    예시:
    AF.request( reqUrl,
                headers: ["Content-Type":"application/json",
                          "Accept":"application/json" ])
 
 ### 응답, 요청, Json결과 확인:
    
    AF.request(url)
        .responseJSON { response in
 
            print("Request: \(String(describing: response.request))")
            print("Response: \(String(describing: response.response))")
            print("Result: \(response.result)")
        }
 
 */
     
