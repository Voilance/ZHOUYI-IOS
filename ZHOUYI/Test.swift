//
//  Test.swift
//  ZHOUYI
//
//  Created by Apple on 2018/12/8.
//  Copyright © 2018 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class Test: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        httpTest()
        // Do any additional setup after loading the view.
    }
    
    func httpTest() -> Void{
        let requestJsonData = ["name": "Python", "password": "123456"]
        HTTP.POST("http://120.76.128.110:12510/web/UserLogin", parameters: requestJsonData, requestSerializer: JSONParameterSerializer()) { response in
            do {
                let responseJsonData = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as AnyObject
                let result = responseJsonData.object(forKey: "result")
                print(result)
            } catch {
                print(error)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
