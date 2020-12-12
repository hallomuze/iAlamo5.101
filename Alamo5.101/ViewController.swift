//
//  ViewController.swift
//  Alamo5.101
//
//  Created by muzna on 2020/12/11.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Api.fetchJsonPlaceHolder_codable()
//        Api.fetchDic()
//        Api.fetchVerbose()
//        Api.alamo_Decodable_func()
//        postTest()
        Api.fetchFlickr()
        
    }
}

extension ViewController {
   
}
