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
        let nickname = NicknameTextField.text
        if nickname == GlobalUser.nickname {
            self.view.makeToast("新用户名和旧用户名相同")
        } else {
            GlobalUser.nickname = nickname
            self.performSegue(withIdentifier: "EditNicknameToUserInfo", sender: nil)
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
