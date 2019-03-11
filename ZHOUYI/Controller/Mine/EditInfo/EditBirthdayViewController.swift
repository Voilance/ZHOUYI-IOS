//
//  EditBirthdayViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/19.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class EditBirthdayViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var BirthdayButton: UIButton!
    @IBAction func ClickBirthdayButton(_ sender: Any) {
        selectBirthday()
    }
    @IBAction func ClickSaveButton(_ sender: Any) {
        if isInfoOk() {
            editBirthday()
        }
    }
    
    func isInfoOk() -> Bool {
        if birthday == GlobalUser.birthday {
            self.view.makeToast("和旧日期相同")
            return false
        }
        return true
    }
    
    func editBirthday() {
        let reqJson = ["id": GlobalUser.id, "from": "phone", "name": GlobalUser.nickname, "name_change": false, "avatar": nil, "realname": GlobalUser.realname, "birthday": birthday] as [String : Any?]
        let reqHeader = ["x-zhouyi-token": GlobalUser.token!, "x-zhouyi-userid": String(GlobalUser.id!)]
        HTTP.POST(Api.EditInfoUrl, parameters: reqJson, headers: reqHeader as [String : String], requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let result = respJson.object(forKey: "result") as? String
                let reason = respJson.object(forKey: "reason") as? String
                if result == "success" {
                    DispatchQueue.main.async {
                        GlobalUser.birthday = self.birthday
                        self.performSegue(withIdentifier: "EditBirthdayToUserInfo", sender: nil)
                    }
                } else {
                    DispatchQueue.main.async {
                        self.view.makeToast("修改失败")
                    }
                }
            } catch {
                print("Edit Birthday Error")
                print(error)
            }
        }
    }
    
    var birthday: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        BirthdayButton.layer.masksToBounds = true
        BirthdayButton.layer.cornerRadius = 5
        BirthdayButton.setTitle(GlobalUser.birthday, for: .normal)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    
    func selectBirthday() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 270, height: 200))
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.datePickerMode = UIDatePicker.Mode.date
        let yAction = UIAlertAction(title: "确定", style: .default, handler: {action in
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            self.birthday = dateFormat.string(from: datePicker.date)
            self.BirthdayButton.setTitle(self.birthday, for: .normal)
        })
        let nAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.view.addSubview(datePicker)
        alert.addAction(yAction)
        alert.addAction(nAction)
        self.present(alert, animated: true, completion: nil)
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
