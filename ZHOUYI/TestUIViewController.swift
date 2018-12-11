//
//  TestUIViewController.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/10.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit
import ToastSwiftFramework

class TestUIViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UITextField!
    
    @IBAction func onTest(_ sender: Any) {
        
        let datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: 300, height: 200))
        datePicker.locale = Locale(identifier: "zh_CN")
//        datePicker.datePickerMode = UIDatePicker.Mode.date
        let alertController: UIAlertController = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.alert)
        alertController.view.addSubview(datePicker)
        self.present(alertController, animated: true, completion: nil)
        
//        let alertController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertController.Style.actionSheet)
//        let datePicker = UIDatePicker()
//        datePicker.locale = Locale(identifier: "zh_CN")
//        alertController.addAction(UIAlertAction(title: "Y", style: UIAlertAction.Style.default, handler: { (UIAlertAction) in
//            let date = datePicker.date
//            let format = DateFormatter()
//            format.dateFormat = "yyyy/MM/dd HH:mm:ss"
//            let str = format.string(from: date)
//            self.timeLabel.text = str
//        }))
//        alertController.addAction(UIAlertAction(title: "N", style: UIAlertAction.Style.cancel, handler: nil))
//        alertController.view.addSubview(datePicker)
//        self.present(alertController, animated: true, completion: nil)
    }
    @IBAction func showDatePicker(_ sender: Any) {
        self.view.makeToast("click")
    }
    
    var list: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
