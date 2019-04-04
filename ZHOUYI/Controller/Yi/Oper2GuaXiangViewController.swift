//
//  Oper2GuaXiangViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/22.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP
import ToastSwiftFramework

class Oper2GuaXiangViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var GuaXiangTextField1: UITextField!
    @IBOutlet weak var GuaXiangTextField2: UITextField!
    @IBOutlet weak var GuaXiangTextField3: UITextField!
    @IBOutlet weak var GuaXiangTextField4: UITextField!
    @IBOutlet weak var GuaXiangTextField5: UITextField!
    @IBOutlet weak var GuaXiangTextField6: UITextField!
    @IBAction func ClickOkButton(_ sender: Any) {
        if isInfoOk() {
            saveHistory()
        }
//        self.performSegue(withIdentifier: "Oper2GuaXiangToResult", sender: nil)
    }
    
    var gua: Gua?
    
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
                gua?.guaXiang?[i] = Int(gx[i]!)!
            } else {
                self.view.makeToast("没有填写好数字卦")
                return false
            }
        }
        return true
    }
    
    func saveHistory() {
        let reqJson = ["guaxiang": gua?.guaXiang, "date": gua?.date, "yongshen": gua?.yongShen, "name": gua?.name, "reason": gua?.reason, "note": gua?.note, "way": gua?.method] as [String : Any]
        let reqHeader = ["x-zhouyi-token": GlobalUser.token!, "x-zhouyi-userid": String(GlobalUser.id!)]
        HTTP.POST(Api.SaveRecordUrl, parameters: reqJson, headers: reqHeader as [String : String], requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                //                let result = respJson.object(forKey: "result") as? String
                //                let reason = respJson.object(forKey: "reason") as? String
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "Oper2GuaXiangToResult", sender: nil)
                }
            } catch {
                print("Save Result Error")
                print(error)
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Oper2GuaXiangToResult" {
            let destination = segue.destination as! ResultViewController
            destination.gua = gua
        }
    }

}
