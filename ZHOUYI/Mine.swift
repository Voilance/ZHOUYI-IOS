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
    
    let optionList: [String] = ["设置", "关于", "历史记录", "待定", "退出登录"]

    override func viewDidLoad() {
        super.viewDidLoad()

        mTableView.delegate = self
        mTableView.dataSource = self
        avatarButton.imageView?.layer.cornerRadius = avatarButton.frame.width / 2
        setAvatar()
        // Do any additional setup after loading the view.
    }
    
    func setAvatar() -> Void {
        if GlobalUser.online == true {
            avatarButton.setImage(UIImage(named: "login_title.png"), for: UIControl.State.normal)
        } else {
            avatarButton.setImage(UIImage(named: "defult_head.png"), for: UIControl.State.normal)
        }
        print("haha")
    }
    
    func onAutoLogin() -> Void {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if GlobalUser.online == true {
            return 5
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
        case 0:
            self.view.makeToast(optionList[0])
        case 1:
            self.view.makeToast(optionList[1])
        case 2:
            self.view.makeToast(optionList[2])
        case 3:
            self.view.makeToast(optionList[3])
        case 4:
            self.view.makeToast(optionList[4])
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
