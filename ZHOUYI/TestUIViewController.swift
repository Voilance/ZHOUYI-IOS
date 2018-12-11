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
        
        let alert: UIAlertController = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        
        let YAction = UIAlertAction(title: "确定", style: .default, handler: { action in
            
        })
        let NAction = UIAlertAction(title: "取消", style: .default, handler: nil)
        alert.view.addSubview(pv)
        alert.addAction(YAction)
        alert.addAction(NAction)
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func showDatePicker(_ sender: Any) {
        self.view.makeToast("click")
    }
    
    var pv: UIPickerView!
    var list = [UIImage(named: "guaxiang6.jpg"), UIImage(named: "guaxiang7.jpg")]
    
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
        return list.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        return "hi"
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let image = list[row]
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 260, height: 60))
        imageView.image = list[row]
        
        return imageView
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
