//
//  Register.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/11/18.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class Register: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func onRegister() -> Void {
        let requestJsonData = ["name": "", "passwd": ""]
        HTTP.POST("http://120.76.128.110:12510/web/UserSignUp", parameters: requestJsonData) { response in
            do {
                let responseJsonData = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as AnyObject
                let result = responseJsonData.object(forKey: "result")
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
