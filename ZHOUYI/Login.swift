//
//  Login.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/11/18.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class Login: UIViewController {
    
    // 控件
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    // 控件功能
    @IBAction func onLogin(_ sender: Any) {
        let userName = userNameTextField.text
        let userPassword = userPasswordTextField.text
        let requestJson = ["name": userName, "password": userPassword]
        HTTP.POST("http://120.76.128.110:12510/web/UserLogin", parameters: requestJson, requestSerializer: JSONParameterSerializer()) { response in
            do {
                let responseJson = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as AnyObject
                if let result = responseJson.object(forKey: "result") {
                    print(result)
                }
            } catch {
                print("onLogin error:")
                print(error)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    // 从“注册”返回
    @IBAction func exitFromRegister(_ segue : UIStoryboardSegue) {}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
