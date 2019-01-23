//
//  Oper2GuaXiangViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/22.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import ToastSwiftFramework

class Oper2GuaXiangViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var GuaXiangTextField1: UITextField!
    @IBOutlet weak var GuaXiangTextField2: UITextField!
    @IBOutlet weak var GuaXiangTextField3: UITextField!
    @IBOutlet weak var GuaXiangTextField4: UITextField!
    @IBOutlet weak var GuaXiangTextField5: UITextField!
    @IBOutlet weak var GuaXiangTextField6: UITextField!
    @IBAction func ClickOkButton(_ sender: Any) {
//        if isInfoOk() {
//            self.performSegue(withIdentifier: "Oper2GuaXiangToResult", sender: nil)
//        }
        self.performSegue(withIdentifier: "Oper2GuaXiangToResult", sender: nil)
    }
    
    var guaXiang: [Int] = [6, 6, 6, 6, 6, 6]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        GuaXiangTextField1.delegate = self
        GuaXiangTextField2.delegate = self
        GuaXiangTextField3.delegate = self
        GuaXiangTextField4.delegate = self
        GuaXiangTextField5.delegate = self
        GuaXiangTextField6.delegate = self
    }
    
    func isInfoOk() -> Bool {
        var gx: [String?] = []
        gx.append(GuaXiangTextField1.text?.trimmingCharacters(in: .whitespacesAndNewlines))
        gx.append(GuaXiangTextField2.text?.trimmingCharacters(in: .whitespacesAndNewlines))
        gx.append(GuaXiangTextField3.text?.trimmingCharacters(in: .whitespacesAndNewlines))
        gx.append(GuaXiangTextField4.text?.trimmingCharacters(in: .whitespacesAndNewlines))
        gx.append(GuaXiangTextField5.text?.trimmingCharacters(in: .whitespacesAndNewlines))
        gx.append(GuaXiangTextField6.text?.trimmingCharacters(in: .whitespacesAndNewlines))
        for i in 0..<6 {
            if gx[i] == "6" || gx[i] == "7" || gx[i] == "8" || gx[i] == "9" {
                guaXiang[i] = Int(gx[i]!)!
            } else {
                self.view.makeToast("没有填写好数字卦")
                return false
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
