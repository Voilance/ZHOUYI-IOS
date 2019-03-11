//
//  EditNicknameViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/19.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP
import ToastSwiftFramework

class EditNicknameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var NicknameTextField: UITextField!
    @IBAction func ClickSaveButton(_ sender: Any) {
        let nickname = NicknameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if isInfoOk(nickname: nickname) {
            editNickname(newNickname: nickname!)
        }
    }
    
    func isInfoOk(nickname: String?) -> Bool {
        if nickname == nil || nickname?.count == 0 {
            self.view.makeToast("用户名不能为空")
            return false
        }
        if nickname == GlobalUser.nickname {
            self.view.makeToast("新用户名和旧用户名相同")
            return false
        }
        return true
    }
    
    func editNickname(newNickname: String) {
        let reqJson = ["id": GlobalUser.id, "from": "phone", "name": newNickname, "name_change": true, "avatar": nil, "realname": GlobalUser.realname, "birthday": GlobalUser.birthday] as [String : Any?]
        let reqHeader = ["x-zhouyi-token": GlobalUser.token!, "x-zhouyi-userid": String(GlobalUser.id!)]
        HTTP.POST(Api.EditInfoUrl, parameters: reqJson, headers: reqHeader as [String : String], requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let result = respJson.object(forKey: "result") as? String
                let reason = respJson.object(forKey: "reason") as? String
                if result == "success" {
                    DispatchQueue.main.async {
                        GlobalUser.nickname = newNickname
                        self.performSegue(withIdentifier: "EditNicknameToUserInfo", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.view.makeToast("修改失败")
                    }
                }
            } catch {
                print("Edit Nickname Error")
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NicknameTextField.delegate = self
        
        NicknameTextField.text = GlobalUser.nickname
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
