//
//  UserInfoViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/18.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // 控件
    @IBOutlet weak var AvatarBackgroundImageView: UIImageView!
    @IBOutlet weak var AvatarButton: UIButton!
    @IBOutlet weak var InfoTableView: UITableView!
    
    let InfoList: [String] = ["昵称", "绑定手机号", "更多"]
    var InfoDetailList: [String] = []
    let InfoCellHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 设置圆形头像
        AvatarButton.layer.masksToBounds = true
        AvatarButton.layer.cornerRadius = AvatarButton.frame.width / 2
        
        // 设置TableView的Delegate和DataSource
        InfoTableView.delegate = self
        InfoTableView.dataSource = self
        
        // 初始化InfoDetailList
        InfoDetailList.append(GlobalUser.nickname ?? "nickname")
        InfoDetailList.append(GlobalUser.tel ?? "tel")
        InfoDetailList.append("more")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return InfoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let infoCell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath)
        infoCell.textLabel?.text = InfoList[indexPath.row]
        infoCell.detailTextLabel?.text = InfoDetailList[indexPath.row]
        return infoCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return InfoCellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return
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
