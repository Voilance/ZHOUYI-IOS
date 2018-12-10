//
//  Login.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/11/18.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP
import ToastSwiftFramework

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
                print(responseJson)
                if let result = responseJson.object(forKey: "result") as? String {
                    if result == "success" {
                        let userTel = responseJson.object(forKey: "phone") as? String
                        let userToken = responseJson.object(forKey: "token") as? String
                        GlobalUser.initGlobalUser(inputName: userName, inputPassword: userPassword, inputTel: userTel, inputToken: userToken, inputLogin: true)
                        GlobalUser.online = true
                        GlobalUser.saveGlobalUserData()
                        
                        DispatchQueue.main.async {
                            self.view.makeToast("登陆成功")
                            self.performSegue(withIdentifier: "LoginExitToMine", sender: nil)
                        }
                    }
                }
            } catch {
                print("onLogin error:")
                print(error)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 将本地用户数据加载到输入框
        GlobalUser.loadGlobalUserData() // 只是为了确保加载进来了所以Load多次
        userNameTextField.text = GlobalUser.name
        userPasswordTextField.text = GlobalUser.password
        // Do any additional setup after loading the view.
    }
    
    
    // 从“注册”成功注册后返回
    @IBAction func exitFromRegister(_ segue : UIStoryboardSegue) {
        userNameTextField.text = GlobalUser.name
        userPasswordTextField.text = GlobalUser.password
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
