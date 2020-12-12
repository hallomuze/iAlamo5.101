//
//  simplePost.swift
//  Alamo5.101
//
//  Created by muzna on 2020/12/11.
//

import Alamofire

func postTest() {
    
    // https://ptsv2.com/ 에 진입후 new random toilet 버튼 누르면 주소가 나옴.
    // https://ptsv2.com/ + t/00uuuuuu-90999/post 까지 뒤쪽에 붙여넣기 하면 됨
    
    let url = "https://ptsv2.com/t/00y07-1607683533/post"
    
    var request = URLRequest(url: URL(string: url)!)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.timeoutInterval = 10
    
    // POST 로 보낼 정보
    let params = ["id":"아이디", "pw":"패스워드"] as Dictionary
    
    // httpBody 에 parameters 추가
    do {
        try request.httpBody = JSONSerialization.data(withJSONObject: params, options: [])
    } catch {
        print("http Body Error")
    }
    
    AF.request(request).responseString { (response) in
        switch response.result {
        case .success:
            print("POST 성공")
        case .failure(let error):
            print("🚫 Alamofire Request Error\nCode:\(error._code), Message: \(error.errorDescription!)")
        }
    }
}
