//
//  Oper4GuaXiangViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/23.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class Oper4GuaXiangViewController: UIViewController {
    
    @IBOutlet weak var BenGuaButton: UIButton!
    @IBOutlet weak var BianGuaButton: UIButton!
    @IBOutlet weak var BenGuaLabel: UILabel!
    @IBOutlet weak var BianGuaLabel: UILabel!
    
    @IBOutlet weak var S0Button: UIButton!
    @IBOutlet weak var S1Button: UIButton!
    @IBOutlet weak var S2Button: UIButton!
    @IBOutlet weak var S3Button: UIButton!
    @IBOutlet weak var S4Button: UIButton!
    @IBOutlet weak var S5Button: UIButton!
    @IBOutlet weak var S6Button: UIButton!
    @IBOutlet weak var S7Button: UIButton!
    @IBOutlet weak var X0Button: UIButton!
    @IBOutlet weak var X1Button: UIButton!
    @IBOutlet weak var X2Button: UIButton!
    @IBOutlet weak var X3Button: UIButton!
    @IBOutlet weak var X4Button: UIButton!
    @IBOutlet weak var X5Button: UIButton!
    @IBOutlet weak var X6Button: UIButton!
    @IBOutlet weak var X7Button: UIButton!
    
    @IBAction func ClickBenGuaButton(_ sender: Any) {
        if !isBenGua {
            BianGuaButton.backgroundColor = WhiteColor
            BenGuaButton.backgroundColor = BlueColor
            SButtonList[guaXiangSelect[2]].backgroundColor = WhiteColor
            SButtonList[guaXiangSelect[0]].backgroundColor = BlueColor
            XButtonList[guaXiangSelect[3]].backgroundColor = WhiteColor
            XButtonList[guaXiangSelect[1]].backgroundColor = BlueColor
            isBenGua = !isBenGua
        }
    }
    @IBAction func ClickBianGuaButton(_ sender: Any) {
        if isBenGua {
            BenGuaButton.backgroundColor = WhiteColor
            BianGuaButton.backgroundColor = BlueColor
            SButtonList[guaXiangSelect[0]].backgroundColor = WhiteColor
            SButtonList[guaXiangSelect[2]].backgroundColor = BlueColor
            XButtonList[guaXiangSelect[1]].backgroundColor = WhiteColor
            XButtonList[guaXiangSelect[3]].backgroundColor = BlueColor
            isBenGua = !isBenGua
        }
    }
    @IBAction func ClickS0Button(_ sender: Any) {
        reloadView(s: 0, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS1Button(_ sender: Any) {
        reloadView(s: 1, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS2Button(_ sender: Any) {
        reloadView(s: 2, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS3Button(_ sender: Any) {
        reloadView(s: 3, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS4Button(_ sender: Any) {
        reloadView(s: 4, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS5Button(_ sender: Any) {
        reloadView(s: 5, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS6Button(_ sender: Any) {
        reloadView(s: 6, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS7Button(_ sender: Any) {
        reloadView(s: 7, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickX0Button(_ sender: Any) {
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 0)
    }
    @IBAction func ClickX1Button(_ sender: Any) {
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 1)
    }
    @IBAction func ClickX2Button(_ sender: Any) {
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 2)
    }
    @IBAction func ClickX3Button(_ sender: Any) {
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 3)
    }
    @IBAction func ClickX4Button(_ sender: Any) {
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 4)
    }
    @IBAction func ClickX5Button(_ sender: Any) {
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 5)
    }
    @IBAction func ClickX6Button(_ sender: Any) {
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 6)
    }
    @IBAction func ClickX7Button(_ sender: Any) {
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 7)
    }
    @IBAction func ClickOkButton(_ sender: Any) {
//         saveHistory()
        getLiuYao()
    }
    
    var SButtonList: [UIButton] = []
    var XButtonList: [UIButton] = []
    let BlueColor: UIColor = UIColor(red: 0.16, green: 0.44, blue: 0.96, alpha: 1.0)
    let WhiteColor: UIColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    let GuaXiangList: [Int] = [7, 3, 5, 1, 6, 2, 4, 0]
    var guaXiangSelect: [Int] = [0, 0, 0, 0] // 分别对应本卦上卦、本卦下卦、变卦上卦、变卦下卦的卦象
    var gua: Gua?
    var guaXiang: [Int] = [7, 7, 7, 7] // 分别对应本卦上卦、本卦下卦、变卦上卦、变卦下卦的值
    var isBenGua: Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        SButtonList.append(S0Button)
        SButtonList.append(S1Button)
        SButtonList.append(S2Button)
        SButtonList.append(S3Button)
        SButtonList.append(S4Button)
        SButtonList.append(S5Button)
        SButtonList.append(S6Button)
        SButtonList.append(S7Button)
        XButtonList.append(X0Button)
        XButtonList.append(X1Button)
        XButtonList.append(X2Button)
        XButtonList.append(X3Button)
        XButtonList.append(X4Button)
        XButtonList.append(X5Button)
        XButtonList.append(X6Button)
        XButtonList.append(X7Button)
        BenGuaButton.backgroundColor = BlueColor
        SButtonList[0].backgroundColor = BlueColor
        XButtonList[0].backgroundColor = BlueColor
    }
    
    func reloadView(s: Int, x: Int) {
        if isBenGua {
            if s != guaXiangSelect[0] {
                SButtonList[guaXiangSelect[0]].backgroundColor = WhiteColor
                SButtonList[s].backgroundColor = BlueColor
                guaXiangSelect[0] = s
                guaXiang[0] = GuaXiangList[guaXiangSelect[0]]
            }
            if x != guaXiangSelect[1] {
                XButtonList[guaXiangSelect[1]].backgroundColor = WhiteColor
                XButtonList[x].backgroundColor = BlueColor
                guaXiangSelect[1] = x
                guaXiang[1] = GuaXiangList[guaXiangSelect[1]]
            }
        } else {
            if s != guaXiangSelect[2] {
                SButtonList[guaXiangSelect[2]].backgroundColor = WhiteColor
                SButtonList[s].backgroundColor = BlueColor
                guaXiangSelect[2] = s
                guaXiang[2] = GuaXiangList[guaXiangSelect[2]]
            }
            if x != guaXiangSelect[3] {
                XButtonList[guaXiangSelect[3]].backgroundColor = WhiteColor
                XButtonList[x].backgroundColor = BlueColor
                guaXiangSelect[3] = x
                guaXiang[3] = GuaXiangList[guaXiangSelect[3]]
            }
        }
    }
    
    func saveHistory() {
        let reqJson = ["guaxiang": gua?.guaXiang, "date": gua?.date, "yongshen": gua?.yongShen, "name": gua?.name, "reason": gua?.reason, "note": gua?.note, "way": gua?.method] as [String : Any]
        let reqHeader = ["x-zhouyi-token": GlobalUser.token!, "x-zhouyi-userid": String(GlobalUser.id!)]
        HTTP.POST(Api.SaveRecordUrl, parameters: reqJson, headers: reqHeader as [String : String], requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                //                let result = respJson.object(forKey: "result") as? String
                //                let reason = respJson.object(forKey: "reason") as? String
//                 self.getLiuYao()
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "Oper4GuaXiangToResult", sender: nil)
                }
            } catch {
                print("Save Result Error")
                print(error)
            }
        }
    }
    
    func getLiuYao() {
        let list = convertData()
        let reqJson = ["list1" : list[0], "list2": list[1]]
        HTTP.POST(Api.GetLiuYao, parameters: reqJson, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                if let code = respJson.object(forKey: "code") as? Int {
                    if code == 0 {
                        let data: [Int] = respJson.object(forKey: "data") as! [Int]
                        self.gua?.guaXiang = data
                        self.saveHistory()
                    }
                }
//                 DispatchQueue.main.async {
//                     self.performSegue(withIdentifier: "Oper4GuaXiangToResult", sender: nil)
//                 }
            } catch {
                print("Get LiuYao Error")
                print(error)
            }
        }
    }
    
    // 将4个卦象数字转为两个二进制数组
    func convertData() -> [[Int]] {
        var list1: [Int] = [0, 0, 0, 0, 0, 0]
        var list2: [Int] = [0, 0, 0, 0, 0, 0]
        var l = numToList(num: guaXiang[0])
        for i in 0..<3 {
            list1[i] = l[i]
        }
        l = numToList(num: guaXiang[1])
        for i in 3..<6 {
            list1[i] = l[i - 3]
        }
        l = numToList(num: guaXiang[2])
        for i in 0..<3 {
            list2[i] = l[i]
        }
        l = numToList(num: guaXiang[3])
        for i in 3..<6 {
            list2[i] = l[i - 3]
        }
        return [list1, list2]
    }
    
    // 将数字转为一个三位数组：5 -> [1, 0, 1]
    func numToList(num: Int) -> [Int] {
        switch num {
        case 0:
            return [0, 0, 0]
        case 1:
            return [0, 0, 1]
        case 2:
            return [0, 1, 0]
        case 3:
            return [0, 1, 1]
        case 4:
            return [1, 0, 0]
        case 5:
            return [1, 0, 1]
        case 6:
            return [1, 1, 0]
        case 7:
            return [1, 1, 1]
        default:
            return [1, 1, 1]
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Oper4GuaXiangToResult" {
            let destination = segue.destination as! ResultViewController
            destination.gua = gua
        }
    }

}
