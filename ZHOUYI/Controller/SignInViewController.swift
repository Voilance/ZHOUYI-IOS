//
//  SignInViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/17.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    // 控件
    @IBOutlet weak var AvatarImageView: UIImageView!   // 头像
    @IBOutlet weak var NicknameTextField: UITextField! // 昵称栏
    @IBOutlet weak var PasswordTextField: UITextField! // 密码栏
    // 控件功能
    @IBAction func ClickSignInButton(_ sender: Any) { // 点击登录按钮进行登录
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 设置圆形头像
        AvatarImageView.layer.masksToBounds = true
        AvatarImageView.layer.cornerRadius = AvatarImageView.frame.width / 2
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
