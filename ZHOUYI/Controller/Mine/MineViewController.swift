//
//  MineViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/14.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class MineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // 控件
    @IBOutlet weak var AvatarBackgroundImageView: UIImageView! // 头像背景
    @IBOutlet weak var AvatarButton: UIButton!                 // 头像
    @IBOutlet weak var OptionTableView: UITableView!           // 选项
    // 控件功能
    @IBAction func ClickAvatarButton(_ sender: Any) { // 点击头像跳转登录或个人信息
        if GlobalUser.online ?? false {
            self.performSegue(withIdentifier: "MineToUserInfo", sender: nil)
        } else {
            self.performSegue(withIdentifier: "MineToSignIn", sender: nil)
        }
    }
    @IBAction func Exit(_ segue: UIStoryboardSegue) {
        reloadView()
//        if segue.identifier == "SignInToMine" {
//            reloadView()
//        }
    }
    
    let DefaultOptionList: [String] = ["关于", "设置"] // 默认选项列表
    let OptionList: [String] = ["待定", "关于", "设置"] // 登录后选项列表
    let CellHeight: CGFloat = 50                // 每一项高度
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 设置圆形头像
        AvatarButton.layer.masksToBounds = true
        AvatarButton.layer.cornerRadius = AvatarButton.frame.width / 2
        
        // 设置TableView的Delegate和DataSource
        OptionTableView.delegate = self
        OptionTableView.dataSource = self
        
        // 获取本地用户信息
        GlobalUser.loadUserInfo()
        if !(GlobalUser.online ?? false) && (GlobalUser.login ?? false) {
            authenticateToken()
        }
    }
    
    func reloadView() {
        // 如果登陆或登出，重新加载头像和头像背景
        AvatarBackgroundImageView.image = UIImage(named: (GlobalUser.online ?? false) ? "default_avatar" : "click_to_sign_in")
        AvatarButton.setImage(UIImage(named: (GlobalUser.online ?? false) ? "default_avatar" : "click_to_sign_in"), for: .normal)
        // 重新载入OptionTableView
        OptionTableView.frame.size = CGSize(width: OptionTableView.frame.width, height: ((GlobalUser.online ?? false) ? CGFloat(OptionList.count) : CGFloat(DefaultOptionList.count)) * CellHeight)
        OptionTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (GlobalUser.online ?? false) ? OptionList.count : DefaultOptionList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let optionCell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath)
        if (GlobalUser.online ?? false) {
            optionCell.textLabel?.text = OptionList[indexPath.row]
        } else {
            optionCell.textLabel?.text = DefaultOptionList[indexPath.row]
        }
        return optionCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if GlobalUser.online ?? false {
            switch indexPath.row {
            case OptionList.firstIndex(of: "关于"):
                self.performSegue(withIdentifier: "MineToAbout", sender: nil)
                break;
            case OptionList.firstIndex(of: "设置"):
                self.performSegue(withIdentifier: "MineToSetting", sender: nil)
                break;
            default:
                break;
            }
        } else {
            switch indexPath.row {
            case DefaultOptionList.firstIndex(of: "关于"):
                self.performSegue(withIdentifier: "MineToAbout", sender: nil)
                break;
            case DefaultOptionList.firstIndex(of: "设置"):
                self.performSegue(withIdentifier: "MineToSetting", sender: nil)
                break;
            default:
                break;
            }
        }
    }
    
    // 验证token，如果token有效则尝试自动登录
    func authenticateToken() {
        let reqJson = ["id": GlobalUser.id, "token": GlobalUser.token] as [String : Any]
        HTTP.POST(Api.AuthTokenUrl, parameters: reqJson, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let result = respJson.object(forKey: "result") as? String
                if result == "success" {
                    self.autoSignIn()
                }
            } catch {
                print("Authenticate Token Error:")
                print(error)
            }
        }
    }
    
    // 验证token成功之后，尝试自动登录
    func autoSignIn() {
        let reqJson = ["name": GlobalUser.nickname, "password": GlobalUser.password]
        HTTP.POST(Api.SignInUrl, parameters: reqJson, requestSerializer: JSONParameterSerializer()) {resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let result = respJson.object(forKey: "result") as? String
                if result == "success" {
                    GlobalUser.id = respJson.object(forKey: "userId") as? Int
                    GlobalUser.realname = respJson.object(forKey: "realname") as? String
                    GlobalUser.tel = respJson.object(forKey: "phone") as? String
                    GlobalUser.birthday = respJson.object(forKey: "birthYM") as? String
                    GlobalUser.token = respJson.object(forKey: "token") as? String
                    GlobalUser.login = true
                    GlobalUser.online = true
                    GlobalUser.saveUserInfo()
                    
                    DispatchQueue.main.async {
                        self.reloadView()
                    }
                }
            } catch {
                print("Sign In Error:")
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
