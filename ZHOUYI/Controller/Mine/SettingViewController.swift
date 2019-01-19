//
//  SettingViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/18.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // 控件
    @IBOutlet weak var SettingTableView: UITableView!

    let DefaultSettingList: [String] = ["请登录以获取更多帮助"]
    let SettingList: [String] = ["退出登录"]
    let CellHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 设置TableView的Delegate和DataSource
        SettingTableView.delegate = self
        SettingTableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (GlobalUser.online ?? false) ? SettingList.count : DefaultSettingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let settingCell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        if (GlobalUser.online ?? false) {
            settingCell.textLabel?.text = SettingList[indexPath.row]
        } else {
            settingCell.textLabel?.text = DefaultSettingList[indexPath.row]
        }
        return settingCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (GlobalUser.online ?? false) {
            switch indexPath.row {
            case SettingList.firstIndex(of: "退出登录"):
                GlobalUser.login = false
                GlobalUser.online = false
                GlobalUser.saveUserInfo()
                self.performSegue(withIdentifier: "SettingToMine", sender: nil)
                break;
            default:
                break;
            }
        } else {
            switch indexPath.row {
            default:
                break;
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
