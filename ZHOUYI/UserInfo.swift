//
//  UserInfo.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/12.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit

class UserInfo: UIViewController {
    
    // 控件
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userRealNameTextField: UITextField!
    @IBOutlet weak var userTelTextField: UITextField!
    @IBOutlet weak var userBirthYMTextField: UITextField!
    // 控件功能

    override func viewDidLoad() {
        super.viewDidLoad()

        initUserInfo()
        // Do any additional setup after loading the view.
    }
    
    func initUserInfo() -> Void {
        userNameTextField.text = GlobalUser.name
        userRealNameTextField.text = GlobalUser.realName
        userTelTextField.text = GlobalUser.tel
        userBirthYMTextField.text = GlobalUser.birthYM
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
