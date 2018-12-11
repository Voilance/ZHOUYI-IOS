//
//  TestUIViewController.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/10.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit
import ToastSwiftFramework

class TestUIViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var timeLabel: UITextField!
    
    @IBAction func onTest(_ sender: Any) {
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.datePickerMode = UIDatePicker.Mode.date
        let alertController: UIAlertController = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.alert)
//        let YAction = UIAlertAction(title: "确定", style: .default, handler: { action in
//            let date = datePicker.date
//            let format = DateFormatter()
//            format.dateFormat = "yyyy/MM/dd HH:mm:ss"
//            let str = format.string(from: date)
//            self.timeLabel.text = str
//        })
//        let NAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alertController.view.addSubview(self.pv)
//        alertController.addAction(YAction)
//        alertController.addAction(NAction)
        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func showDatePicker(_ sender: Any) {
        self.view.makeToast("click")
    }
    
    var pv: UIPickerView!
    var list = ["父母", "兄弟", "官鬼", "子孙", "妻财", "世", "应"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pv = UIPickerView()
        pv.dataSource = self
        pv.delegate = self
        // Do any additional setup after loading the view.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // 父母，兄弟，官鬼，子孙，妻财，世，应
    }
    // 设置行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 7
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return list[row]
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
