//
//  Oper1ReasonViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/20.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import ToastSwiftFramework

class Oper1ReasonViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // 控件
    @IBOutlet weak var DateButton: UIButton!
    @IBOutlet weak var YongShenButton: UIButton!
    @IBOutlet weak var ReasonTextField: UITextField!
    @IBOutlet weak var NameTextField: UITextField!
    @IBOutlet weak var NoteTextField: UITextField!
    // 控件功能
    @IBAction func ClickDateButton(_ sender: Any) {
        selectDate()
    }
    @IBAction func ClickYongShenButton(_ sender: Any) {
        selectYongShen()
    }
    @IBAction func ClickOkButton(_ sender: Any) {
        if isInfoOk() {
            self.performSegue(withIdentifier: "Oper1ReasonToOper1GuaXiang", sender: nil)
        }
    }
    
    let YongShenList: [String] = ["父母", "兄弟", "官鬼", "子孙", "妻财", "世", "应"]
    var date: String?
    var yongShen: String?
    var reason: String?
    var name: String?
    var note: String?
    let PickerRowHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 给Button设置圆角，让它看起来和TextField差不多
        DateButton.layer.masksToBounds = true
        DateButton.layer.cornerRadius = 5
        YongShenButton.layer.masksToBounds = true
        YongShenButton.layer.cornerRadius = 5
        
        ReasonTextField.delegate = self
        NameTextField.delegate = self
        NoteTextField.delegate = self
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        date = dateFormat.string(from: .init())
        DateButton.setTitle(date, for: .normal)
        yongShen = "父母"
        YongShenButton.setTitle(yongShen, for: .normal)
        reason = "无"
        ReasonTextField.text = reason
        name = GlobalUser.realname
        NameTextField.text = name
        note = "无"
        NoteTextField.text = note
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return YongShenList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return YongShenList[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PickerRowHeight
    }
    
    func selectDate() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 270, height: 200))
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.datePickerMode = UIDatePicker.Mode.date
        let yAction = UIAlertAction(title: "确定", style: .default, handler: { action in
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            self.date = dateFormat.string(from: datePicker.date)
            self.DateButton.setTitle(self.date, for: .normal)
        })
        let nAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.view.addSubview(datePicker)
        alert.addAction(yAction)
        alert.addAction(nAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func selectYongShen() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
        let yongShenPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 270, height: 200))
        yongShenPicker.delegate = self
        yongShenPicker.dataSource = self
        let yAction = UIAlertAction(title: "确定", style: .default, handler: { action in
            self.yongShen = self.YongShenList[yongShenPicker.selectedRow(inComponent: 0)]
            self.YongShenButton.setTitle(self.yongShen, for: .normal)
        })
        let nAction = UIAlertAction(title: "取消", style: .default, handler: nil)
        alert.view.addSubview(yongShenPicker)
        alert.addAction(yAction)
        alert.addAction(nAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func isInfoOk() -> Bool {
        reason = ReasonTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        name = NameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        note = NoteTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if reason == nil || reason?.count == 0 {
            reason = "无"
        }
        if note == nil || note?.count == 0 {
            note = "无"
        }
        if name == nil || name?.count == 0 {
            self.view.makeToast("请填写卜卦者姓名！")
            return false
        } else {
            return true
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
