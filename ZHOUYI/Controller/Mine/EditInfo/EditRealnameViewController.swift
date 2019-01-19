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
        let realname = RealnameTextField.text
        if realname == GlobalUser.realname {
            self.view.makeToast("和旧真实姓名相同")
        } else {
            GlobalUser.realname = realname
            self.performSegue(withIdentifier: "EditRealnameToUserInfo", sender: nil)
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
