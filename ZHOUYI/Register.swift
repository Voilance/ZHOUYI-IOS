//
//  Register.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/11/18.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP
import ToastSwiftFramework

class Register: UIViewController {
    
    // 控件
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userPasswordTextField: UITextField!
    @IBOutlet weak var comfirmPasswordTextField: UITextField!
    @IBOutlet weak var userTelTextField: UITextField!
    // 控件功能
    @IBAction func onRegister(_ sender: Any) {
        let userName = userNameTextField.text
        let userPassword = userPasswordTextField.text
        let confirmPassword = comfirmPasswordTextField.text
        let userTel = userTelTextField.text
        let requestJson = ["name": userName, "passwd": userPassword, "phone": userTel]
        if userPassword == confirmPassword {
            HTTP.POST("http://120.76.128.110:12510/web/UserSignUp", parameters: requestJson, requestSerializer: JSONParameterSerializer()) { response in
                do {
                    let responseJson = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as AnyObject
                    print(responseJson)
                    let result = responseJson.object(forKey: "result") as? String
                    if result == "success" {
                        GlobalUser.initGlobalUser(inputId: nil, inputName: userName, inputPassword: userPassword, inputTel: userTel, inputToken: nil, inputLogin: false)
                        
                        DispatchQueue.main.async {
                            self.view.makeToast("注册成功")
                            self.performSegue(withIdentifier: "RegisterExitToLogin", sender: nil)
                        }
                    }
                } catch {
                    print("onRegister error:")
                    print(error)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
