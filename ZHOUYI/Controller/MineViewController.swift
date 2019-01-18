//
//  MineViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/14.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class MineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // 控件
    @IBOutlet weak var AvatarBackgroundImageView: UIImageView! // 头像背景
    @IBOutlet weak var AvatarButton: UIButton!                 // 头像
    @IBOutlet weak var OptionTableView: UITableView!           // 选项
    // 控件功能
    @IBAction func ClickAvatarButton(_ sender: Any) { // 点击头像跳转登录或个人信息
        performSegue(withIdentifier: "MineToSignIn", sender: nil)
//        GlobalUser.online = !(GlobalUser.online ?? false)
//        reloadView()
    }
    
    let DefaultOptionList: [String] = ["关于", "设置"] // 默认选项列表
    let OptionList: [String] = ["待定", "关于", "设置"] // 登录后选项列表
    let OptionCellHeight: CGFloat = 50                // 每一项高度
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        // 设置圆形头像
        AvatarButton.layer.masksToBounds = true
        AvatarButton.layer.cornerRadius = AvatarButton.frame.width / 2
        
        // 设置TableView的Delegate和DataSource
        OptionTableView.delegate = self
        OptionTableView.dataSource = self
    
    }
    
    func reloadView() {
        // 如果登陆或登出，重新加载头像和头像背景
        AvatarBackgroundImageView.image = UIImage(named: (GlobalUser.isOnline() ?? false) ? "default_avatar" : "click_to_sign_in")
        AvatarButton.setImage(UIImage(named: (GlobalUser.isOnline() ?? false) ? "default_avatar" : "click_to_sign_in"), for: .normal)
        // 重新载入OptionTableView
        OptionTableView.frame.size = CGSize(width: OptionTableView.frame.width, height: ((GlobalUser.isOnline() ?? false) ? CGFloat(OptionList.count) : CGFloat(DefaultOptionList.count)) * OptionCellHeight)
        OptionTableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (GlobalUser.isOnline() ?? false) ? OptionList.count : DefaultOptionList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let optionCell = tableView.dequeueReusableCell(withIdentifier: "OptionCell", for: indexPath)
        if (GlobalUser.isOnline() ?? false) {
            optionCell.textLabel?.text = OptionList[indexPath.row]
        } else {
            optionCell.textLabel?.text = DefaultOptionList[indexPath.row]
        }
        return optionCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return OptionCellHeight
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
