//
//  UserInfoViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/18.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // 控件
    @IBOutlet weak var AvatarBackgroundImageView: UIImageView!
    @IBOutlet weak var AvatarButton: UIButton!
    @IBOutlet weak var InfoTableView: UITableView!
    @IBOutlet weak var SignOutButton: UIButton!
    // 控件功能
    @IBAction func ClickAvatarButton(_ sender: Any) {
        EditAvatar()
    }
    @IBAction func ClickSignOutButton(_ sender: Any) {
        GlobalUser.login = false
        GlobalUser.online = false
        GlobalUser.saveUserInfo()
        self.performSegue(withIdentifier: "UserInfoToMine", sender: nil)
    }
    
    @IBAction func Exit(_ segue: UIStoryboardSegue) {
        reloadView()
    }
    
    let InfoList: [String] = ["用户名", "真实姓名", "绑定手机号", "出生年月"]
    var InfoDetailList: [String] = []
    let CellHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 设置圆形头像
        AvatarButton.layer.masksToBounds = true
        AvatarButton.layer.cornerRadius = AvatarButton.frame.width / 2
        SignOutButton.layer.masksToBounds = true
        SignOutButton.layer.cornerRadius = 5
        
        // 设置TableView的Delegate和DataSource
        InfoTableView.delegate = self
        InfoTableView.dataSource = self
        
        // 初始化InfoDetailList
        InfoDetailList.append(GlobalUser.nickname ?? "nickname")
        InfoDetailList.append(GlobalUser.realname ?? "realname")
        InfoDetailList.append(GlobalUser.tel ?? "tel")
        InfoDetailList.append(GlobalUser.birthday ?? "yyyy-mm")
    }
    
    func reloadView() {
        InfoDetailList.removeAll()
        InfoDetailList.append(GlobalUser.nickname ?? "nickname")
        InfoDetailList.append(GlobalUser.realname ?? "realname")
        InfoDetailList.append(GlobalUser.tel ?? "tel")
        InfoDetailList.append(GlobalUser.birthday ?? "yyyy-mm")
        InfoTableView.reloadData()
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
        return CellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case InfoList.firstIndex(of: "用户名"):
            self.performSegue(withIdentifier: "UserInfoToEditNickname", sender: nil)
            break;
        case InfoList.firstIndex(of: "真实姓名"):
            self.performSegue(withIdentifier: "UserInfoToEditRealname", sender: nil)
            break;
        case InfoList.firstIndex(of: "出生年月"):
            self.performSegue(withIdentifier: "UserInfoToEditBirthday", sender: nil)
            break;
        default:
            break;
        }
    }
    
    func EditAvatar() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        AvatarBackgroundImageView.image = image
        AvatarButton.setImage(image, for: .normal)
        dismiss(animated: true, completion: nil)
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
