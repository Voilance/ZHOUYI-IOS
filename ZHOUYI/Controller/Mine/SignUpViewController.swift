//
//  SignUpViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/18.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP
import ToastSwiftFramework

class SignUpViewController: UIViewController, UITextFieldDelegate {

    // 控件
    @IBOutlet weak var NicknameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var PasswordConfirmTextField: UITextField!
    @IBOutlet weak var TelTextField: UITextField!
    @IBOutlet weak var CaptchaTextField: UITextField!
    @IBOutlet weak var CaptchaButton: UIButton!
    @IBOutlet weak var SignUpButton: UIButton!
    // 控件功能
    @IBAction func GetCaptcha(_ sender: Any) {
        if let tel = TelTextField.text {
            if tel.count != 11 {
                return
            }
            let reqJson = ["phone": tel]
            HTTP.POST(Api.GetCaptchaUrl, parameters: reqJson, requestSerializer: JSONParameterSerializer()) { resp in
                DispatchQueue.main.async {
                    self.view.makeToast(tel)
                }
//                do {
//                    let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
//                    let result = respJson.object(forKey: "result") as? String
//                    if result == "success" {
//                        DispatchQueue.main.async {
//                            self.performSegue(withIdentifier: "SignUpToSignIn", sender: nil)
//                        }
//                    } else {
//                        DispatchQueue.main.async {
//                            let reason = respJson.object(forKey: "reason") as? String
//                            self.view.makeToast(reason)
//                        }
//                    }
//                } catch {
//                    print("Sign Up Error:")
//                    print(error)
//                }
            }
        }
    }
    @IBAction func ClickSignUpButton(_ sender: Any) {
        if isInfoOk() {
            signUp()
        }
    }
    
    var Nickname: String?
    var Password: String?
    var PasswordConfirm: String?
    var Tel: String?
    var Captcha: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 设置TextField的Delegate
        NicknameTextField.delegate = self
        PasswordTextField.delegate = self
        PasswordConfirmTextField.delegate = self
        TelTextField.delegate = self
        CaptchaTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func isInfoOk() -> Bool {
        Nickname = NicknameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        Password = PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        PasswordConfirm = PasswordConfirmTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        Tel = TelTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        Captcha = CaptchaTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Nickname == nil || Nickname?.count == 0 {
            self.view.makeToast("用户名不能为空")
            return false
        }
        if Password == nil || (Password?.count ?? 0) < 6 {
            self.view.makeToast("请输入合法的密码")
            return false
        }
        if PasswordConfirm != Password {
            self.view.makeToast("两次输入的密码不一致")
            return false
        }
        if Tel?.count != 11 {
            self.view.makeToast("请输入合法的手机号码")
            return false
        }
        if Captcha == nil || Captcha?.count == 0 {
            self.view.makeToast("请输入验证码")
            return false
        }
        
        return true
    }
    
    func signUp() {
        let reqJson = ["name": Nickname, "passwd": Password, "phone": Tel, "captcha": Captcha]
        
        HTTP.POST(Api.SignUpUrl, parameters: reqJson, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let result = respJson.object(forKey: "result") as? String
                if result == "success" {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "SignUpToSignIn", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        let reason = respJson.object(forKey: "reason") as? String
                        self.view.makeToast(reason)
                    }
                }
            } catch {
                print("Sign Up Error:")
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
