//
//  SignInViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/17.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP
import ToastSwiftFramework

class SignInViewController: UIViewController, UITextFieldDelegate {

    // 控件
    @IBOutlet weak var AvatarImageView: UIImageView!   // 头像
    @IBOutlet weak var NicknameTextField: UITextField! // 昵称栏
    @IBOutlet weak var PasswordTextField: UITextField! // 密码栏
    // 控件功能
    @IBAction func ClickSignInButton(_ sender: Any) { // 点击登录按钮进行登录
        if isInfoOk() {
            signIn()
        }
    }
    @IBAction func Exit(_ segue: UIStoryboardSegue) { // 其他页面返回点
//        if segue.identifier == "SignUpToSignIn" {
//            print("ok")
//        }
    }
    
    var Nickname: String?
    var Password: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 设置圆形头像
        AvatarImageView.layer.masksToBounds = true
        AvatarImageView.layer.cornerRadius = AvatarImageView.frame.width / 2
        
        // 设置TextField的Delegate
        NicknameTextField.delegate = self
        PasswordTextField.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func isInfoOk() -> Bool {
        Nickname = NicknameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        Password = PasswordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Nickname == nil || Nickname?.count == 0 {
            self.view.makeToast("用户名不能为空")
            return false
        }
        if Password == nil || (Password?.count ?? 0) < 6 {
            self.view.makeToast("请输入合法的密码")
            return false
        }
        
        return true
    }
    
    func signIn() {
        let reqJson = ["name": Nickname, "password": Password]
        HTTP.POST(Api.SignInUrl, parameters: reqJson, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let result = respJson.object(forKey: "result") as? String
                if result == "success" {
                    GlobalUser.id = respJson.object(forKey: "userId") as? Int
                    GlobalUser.nickname = respJson.object(forKey: "name") as? String
                    GlobalUser.password = self.Password
                    GlobalUser.realname = respJson.object(forKey: "realname") as? String
                    GlobalUser.tel = respJson.object(forKey: "phone") as? String
                    GlobalUser.birthday = respJson.object(forKey: "birthYM") as? String
                    GlobalUser.token = respJson.object(forKey: "token") as? String
                    GlobalUser.login = true
                    GlobalUser.online = true
                    GlobalUser.saveUserInfo()
                    
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "SignInToMine", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        let reason = respJson.object(forKey: "reason") as? String
                        self.view.makeToast(reason)
                    }
                }
            } catch {
                print("Sign In Error")
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
