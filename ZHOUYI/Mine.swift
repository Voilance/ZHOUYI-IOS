//
//  Mine.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/10.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP
import ToastSwiftFramework

class Mine: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 控件
    @IBOutlet weak var avatarButton: UIButton!
    @IBOutlet weak var mTableView: UITableView!
    // 控件功能
    @IBAction func onAvatar(_ sender: Any) {
        if GlobalUser.online == true {
            self.performSegue(withIdentifier: "MineToInfo", sender: nil)
        } else {
            self.performSegue(withIdentifier: "MineToLogin", sender: nil)
        }
    }
    
    let optionList: [String] = ["个人信息", "关于", "历史记录", "退出登录"]

    override func viewDidLoad() {
        super.viewDidLoad()

        mTableView.delegate = self
        mTableView.dataSource = self
        avatarButton.imageView?.layer.cornerRadius = avatarButton.frame.width / 2 // 圆形头像
        setAvatar()
        GlobalUser.loadGlobalUserData()
        // 如果现在处于未登录状态且上次退出程序时处于登陆状态，则尝试自动登录
        if !GlobalUser.online! && GlobalUser.login! {
            onCheckToken()
        }
        // Do any additional setup after loading the view.
    }
    
    // 根据登陆状态设置头像
    func setAvatar() -> Void {
        if GlobalUser.online == true {
            avatarButton.setImage(UIImage(named: "login_title.png"), for: UIControl.State.normal)
        } else {
            avatarButton.setImage(UIImage(named: "defult_head.png"), for: UIControl.State.normal)
        }
    }
    
    // 尝试自动登录，验证token是否过期
    func onCheckToken() -> Void {
        let requestJson = ["id": GlobalUser.id!, "token": GlobalUser.token!] as [String : Any]
        HTTP.POST("http://120.76.128.110:12510/web/CheckLogin", parameters: requestJson, requestSerializer: JSONParameterSerializer()) { response in
            do {
                let responseJson = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as AnyObject
                let result = responseJson.object(forKey: "result") as? String
                if result == "success" {
                    self.onAutoLogin()
                }
            } catch {
                print("onAutoLogin:")
                print(error)
            }
        }
    }
    
    // 如果token没过期则登录账号
    func onAutoLogin() -> Void {
        let requestJson = ["name": GlobalUser.name, "password": GlobalUser.password]
        HTTP.POST("http://120.76.128.110:12510/web/UserLogin", parameters: requestJson, requestSerializer: JSONParameterSerializer()) { response in
            do {
                let responseJson = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as AnyObject
                let result = responseJson.object(forKey: "result") as? String
                if result == "success" {
                    let userId = responseJson.object(forKey: "userId") as? Int
                    let userRealName = responseJson.object(forKey: "realname") as? String
                    let userTel = responseJson.object(forKey: "phone") as? String
                    let userBirthYM = responseJson.object(forKey: "birthYM") as? String
                    let userToken = responseJson.object(forKey: "token") as? String
                    GlobalUser.initGlobalUser(inputId: userId, inputName: GlobalUser.name, inputPassword: GlobalUser.password, inputRealName: userRealName, inputTel: userTel, inputBirthYM: userBirthYM, inputToken: userToken, inputLogin: true)
                    GlobalUser.online = true
                    GlobalUser.saveGlobalUserData()
                    
                    DispatchQueue.main.async {
                        self.setAvatar()
                        self.mTableView.reloadData()
                    }
                }
            } catch {
                print("onLogin error:")
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if GlobalUser.online == true {
            return 4
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mCell = tableView.dequeueReusableCell(withIdentifier: "mCell", for: indexPath)
        mCell.textLabel?.text = optionList[indexPath.row]
        return mCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0: // 个人信息
            self.performSegue(withIdentifier: "MineToInfo", sender: nil)
        case 1: // 关于
            self.performSegue(withIdentifier: "MineToAbout", sender: nil)
        case 2: // 历史记录
            self.view.makeToast(optionList[2])
        case 3: // 退出登录
            GlobalUser.setGlobalUserLogin(inputLogin: false)
            GlobalUser.setGlobalUserOnline(inputOnline: false)
            GlobalUser.saveGlobalUserData()
            setAvatar()
            mTableView.reloadData()
        default:
            break
        }
    }
    
    @IBAction func exitFromLogin(_ segue : UIStoryboardSegue) {
        setAvatar()
        mTableView.reloadData()
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        
    }

}
