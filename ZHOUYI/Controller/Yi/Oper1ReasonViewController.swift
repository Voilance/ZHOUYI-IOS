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
    @IBOutlet weak var MethodLabel: UILabel!
    @IBOutlet weak var DateButton: UIButton!
    //删除了hourTextField minutesTextField secondTextField
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
            switch gua?.method {
            case "LiuYao":
                self.performSegue(withIdentifier: "Oper1ReasonToOper1GuaXiang", sender: nil)
            case "ShuZi":
                self.performSegue(withIdentifier: "Oper1ReasonToOper2GuaXiang", sender: nil)
            case "ZiDing":
                self.performSegue(withIdentifier: "Oper1ReasonToOper4GuaXiang", sender: nil)
            default:
                break;
            }
            
        }
    }
    @IBOutlet weak var HourAndMinutesButton: UIButton!
    
    @IBAction func ClickHourAndMinutesButton(_ sender: Any) {
        selectHourAndMinutes()
    }
    
    
    let YongShenList: [String] = ["用爻", "父母", "兄弟", "官鬼", "子孙", "妻财", "世", "应"]
    var gua: Gua?
    let PickerRowHeight: CGFloat = 50
    //获取虚拟键盘的x大小
    var keyboard: CGRect = CGRect()
    
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
        
        switch gua?.method {
        case "LiuYao":
            MethodLabel.text = "六爻"
        case "ShuZi":
            MethodLabel.text = "数字"
        case "ZiDing":
            MethodLabel.text = "自定"
        default:
            break
        }
        
        let dateFormat = DateFormatter()
        
        dateFormat.dateFormat = "yyyy-MM-dd-HH-mm-ss"
        let t = separateTime(time: dateFormat.string(from: .init()))
//        let yyyyMMddFormat = DateFormatter()
//        yyyyMMddFormat.dateFormat = "yyyy-MM-dd"
//        DateButton.setTitle(dateFormat.string(from: .init()), for: .normal)
        DateButton.setTitle(t[0] + "-" + t[1] + "-" + t[2], for: .normal)
        HourAndMinutesButton.setTitle(t[3] + ":" + t[4], for: .normal)
//        HourTextField.text = t[3]
//        MinuteTextField.text = t[4]
//        SecondTextField.text = t[5]
        gua?.date = t[0] + "-" + t[1] + "-" + t[2] + " " + t[3] + ":" + t[4] + ":" + t[5]
        
        gua?.yongShen = YongShenList[0]
        YongShenButton.setTitle(gua?.yongShen, for: .normal)
        gua?.reason = "无"
        ReasonTextField.text = gua?.reason
        gua?.name = GlobalUser.realname
        NameTextField.text = gua?.name
        gua?.note = "无"
        NoteTextField.text = gua?.note
        
        //如果键盘出现或消失，捕获这两个消息
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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
        datePicker.maximumDate = Date()
        let yAction = UIAlertAction(title: "确定", style: .default, handler: { action in
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "yyyy-MM-dd"
            self.DateButton.setTitle(dateFormat.string(from: datePicker.date), for: .normal)
        })
        let nAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.view.addSubview(datePicker)
        alert.addAction(yAction)
        alert.addAction(nAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func selectHourAndMinutes() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 270, height: 200))
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.datePickerMode = UIDatePicker.Mode.time
        let yAction = UIAlertAction(title: "确定", style: .default, handler: { action in
            let dateFormat = DateFormatter()
            dateFormat.dateFormat = "HH:mm"
            self.HourAndMinutesButton.setTitle(dateFormat.string(from: datePicker.date), for: .normal)
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
            self.gua?.yongShen = self.YongShenList[yongShenPicker.selectedRow(inComponent: 0)]
            self.YongShenButton.setTitle(self.gua?.yongShen, for: .normal)
        })
        let nAction = UIAlertAction(title: "取消", style: .default, handler: nil)
        alert.view.addSubview(yongShenPicker)
        alert.addAction(yAction)
        alert.addAction(nAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func separateTime(time : String?) -> [String] {
        if let t = time {
            let tt = t.components(separatedBy: "-");
            if tt.count == 6 {
                return tt;
            }
        }
        return ["yy", "MM", "dd", "HH", "mm", "ss"]
    }
    
    func isInfoOk() -> Bool {
        gua?.reason = ReasonTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        gua?.name = NameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        gua?.note = NoteTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        /*
        if let hh = HourTextField.text {
            if hh.count == 2 {
                if let f = hh.first {
                    if let l = hh.last {
                        if !(f >= "0" && f <= "1" && l >= "0" && l <= "9") && !(f == "2" && l >= "0" && l <= "4") {
                            self.view.makeToast("请填入00到23之间的值作为时")
                            return false
                        }
                    }
                }
            } else if hh.count == 1 {
                if let f = hh.first {
                    if (f >= "0" && f <= "9") {
                        HourTextField.text = "0" + String(f)
                    } else {
                        self.view.makeToast("请填入00到23之间的值作为时")
                        return false
                    }
                }
            } else {
                self.view.makeToast("请填入00到23之间的值作为时")
                return false
            }
        }
        if let mm = MinuteTextField.text {
            if mm.count == 2 {
                if let f = mm.first {
                    if let l = mm.last {
                        if !(f >= "0" && f <= "5" && l >= "0" && l <= "9") {
                            self.view.makeToast("请填入00到59之间的值作为分")
                            return false
                        }
                    }
                }
            } else if mm.count == 1 {
                if let f = mm.first {
                    if (f >= "0" && f <= "9") {
                        MinuteTextField.text = "0" + String(f)
                    } else {
                        self.view.makeToast("请填入00到59之间的值作为分")
                        return false
                    }
                }
            } else {
                self.view.makeToast("请填入00到59之间的值作为分")
                return false
            }
        }
        if let ss = SecondTextField.text {
            if ss.count == 2 {
                if let f = ss.first {
                    if let l = ss.last {
                        if !(f >= "0" && f <= "5" && l >= "0" && l <= "9") {
                            self.view.makeToast("请填入00到59之间的值作为秒")
                            return false
                        }
                    }
                }
            } else if ss.count == 1 {
                if let f = ss.first {
                    if (f >= "0" && f <= "9") {
                        SecondTextField.text = "0" + String(f)
                    } else {
                        self.view.makeToast("请填入00到59之间的值作为秒")
                        return false
                    }
                }
            } else {
                self.view.makeToast("请填入00到59之间的值作为秒")
                return false
            }
        }
 
        
        if gua?.reason == nil || gua?.reason?.count == 0 {
            gua?.reason = "无"
        }
        if gua?.note == nil || gua?.note?.count == 0 {
            gua?.note = "无"
        }
        if gua?.name == nil || gua?.name?.count == 0 {
            self.view.makeToast("请填写卜卦者姓名！")
            return false
        }
        
        if let yyMMdd = DateButton.titleLabel?.text {
            if let HH = HourTextField.text {
                if let mm = MinuteTextField.text {
                    if let ss = SecondTextField.text {
                        gua?.date = yyMMdd + " " + HH + ":" + mm + ":" + ss
                    }
                }
            }
        }
 */
        return true
    }
 

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        switch segue.identifier {
        case "Oper1ReasonToOper1GuaXiang":
            let destination = segue.destination as! Oper1GuaXiangViewController
            destination.gua = gua
        case "Oper1ReasonToOper2GuaXiang":
            let destination = segue.destination as! Oper2GuaXiangViewController
            destination.gua = gua
        case "Oper1ReasonToOper4GuaXiang":
            let destination = segue.destination as! Oper4GuaXiangViewController
            destination.gua = gua
        default:
            break;
        }
    }
    

    @objc func keyboardWillShow(_ notification: Notification) {
        let rect = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey]!) as! NSValue
        keyboard = rect.cgRectValue
        UIView.animate(withDuration: 0.4, animations: {() -> Void in
            let yOfView = self.view.frame.origin.y
            self.view.frame.origin.y = yOfView - self.keyboard.height + 80
            
        })
    }
    
    //将控件还原到初始状态
    @objc func keyboardWillHide(_ notification: Notification) {
        UIView.animate(withDuration: 0.4, animations: {() -> Void in
            let yOfView = self.view.frame.origin.y
            self.view.frame.origin.y = yOfView + self.keyboard.height - 80
            
        })
    }
    
}
