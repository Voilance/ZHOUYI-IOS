//
//  EditRealnameViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/19.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP
import ToastSwiftFramework

class EditRealnameViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var RealnameTextField: UITextField!
    @IBAction func ClickSaveButton(_ sender: Any) {
        let realname = RealnameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if isInfoOk(realname: realname) {
            editRealname(newRealname: realname!)
        }
    }
    
    func isInfoOk(realname: String?) -> Bool {
        if realname == nil || realname?.count == 0 {
            self.view.makeToast("用户名不能为空")
            return false
        }
        if realname == GlobalUser.realname {
            self.view.makeToast("新用户名和旧用户名相同")
            return false
        }
        return true
    }
    
    func editRealname(newRealname: String) {
        let reqJson = ["id": GlobalUser.id, "from": "phone", "name": GlobalUser.nickname, "name_change": false, "avatar": nil, "realname": newRealname, "birthday": GlobalUser.birthday] as [String : Any?]
        let reqHeader = ["x-zhouyi-token": GlobalUser.token!, "x-zhouyi-userid": String(GlobalUser.id!)]
        HTTP.POST(Api.EditInfoUrl, parameters: reqJson, headers: reqHeader as [String : String], requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let result = respJson.object(forKey: "result") as? String
                let reason = respJson.object(forKey: "reason") as? String
                if result == "success" {
                    DispatchQueue.main.async {
                        GlobalUser.realname = newRealname
                        self.performSegue(withIdentifier: "EditRealnameToUserInfo", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.view.makeToast("修改失败")
                    }
                }
            } catch {
                print("Edit Realname Error")
                print(error)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        RealnameTextField.delegate = self
        
        RealnameTextField.text = GlobalUser.realname
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
