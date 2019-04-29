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
    
//    @IBOutlet weak var BenGuaButton: UIButton!
//    @IBOutlet weak var BianGuaButton: UIButton!
//    @IBOutlet weak var BenGuaLabel: UILabel!
//    @IBOutlet weak var BianGuaLabel: UILabel!
    
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
    
    @IBOutlet weak var benGuaStackView: UIStackView!
    @IBOutlet weak var bianGuaStackView: UIStackView!
    
    @IBOutlet weak var benGuaView: UIView!
    @IBOutlet weak var bianGuaView: UIView!
    
    @IBOutlet weak var benShangGuaImageView: UIImageView!
    @IBOutlet weak var benXiaGuaImageView: UIImageView!
    
    @IBOutlet weak var bianShangGuaImageView: UIImageView!
    @IBOutlet weak var bianXiaGuaImageView: UIImageView!
    
    @IBOutlet weak var benGuaQianGongLabel: UILabel!
    @IBOutlet weak var benGuaDiYiGuaLabel: UILabel!
    @IBOutlet weak var benGuaQianWeiTianLabel: UILabel!
    
    @IBOutlet weak var bianGuaQianGongLabel: UILabel!
    @IBOutlet weak var bianGuaDiYiGuaLabel: UILabel!
    @IBOutlet weak var bianGuaQianWeiTianLabel: UILabel!
    
    /*
    @IBAction func ClickBenGuaButton(_ sender: Any) {
        if !isBenGua {
//            BianGuaButton.backgroundColor = WhiteColor
//            BenGuaButton.backgroundColor = BlueColor
            SButtonList[guaXiangSelect[2]].backgroundColor = WhiteColor
            SButtonList[guaXiangSelect[0]].backgroundColor = BlueColor
            XButtonList[guaXiangSelect[3]].backgroundColor = WhiteColor
            XButtonList[guaXiangSelect[1]].backgroundColor = BlueColor
            isBenGua = !isBenGua
        }
    }
    @IBAction func ClickBianGuaButton(_ sender: Any) {
        if isBenGua {
//            BenGuaButton.backgroundColor = WhiteColor
//            BianGuaButton.backgroundColor = BlueColor
            SButtonList[guaXiangSelect[0]].backgroundColor = WhiteColor
            SButtonList[guaXiangSelect[2]].backgroundColor = BlueColor
            XButtonList[guaXiangSelect[1]].backgroundColor = WhiteColor
            XButtonList[guaXiangSelect[3]].backgroundColor = BlueColor
            isBenGua = !isBenGua
        }
    }
 
 */
    
    //        if (sender.ishighlighted == YES)
    //        {
    //            [self performSomeAtion:sender];
    //        }
    //        if S0Button.isSelected == true {
    //            S0Button.ui
    //        }
    //        S0Button.imageView?.isHighlighted = true
    //        S0Button.setTitleColor(UIColor.lightGray, for: .highlighted)
    
    @IBAction func ClickS0Button(_ sender: Any) {
//        S0Button.addTarget(self, action: #selector(buttonState(sender:)), for: .touchUpInside)
        S0Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benShangGuaImageView.image = UIImage(named: "s0qian000")
            shangGuaShuZi = "000"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianShangGuaImageView.image = UIImage(named: "s0qian000")
            shangGuaShuZi = "000"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: 0, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS1Button(_ sender: Any) {
//        S1Button.addTarget(self, action: #selector(buttonState(sender:)), for: .touchUpInside)
        S1Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benShangGuaImageView.image = UIImage(named: "s0dui100")
            shangGuaShuZi = "100"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianShangGuaImageView.image = UIImage(named: "s0dui100")
            shangGuaShuZi = "100"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: 1, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS2Button(_ sender: Any) {
        S2Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benShangGuaImageView.image = UIImage(named: "s0li010")
            shangGuaShuZi = "010"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianShangGuaImageView.image = UIImage(named: "s0li010")
            shangGuaShuZi = "010"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: 2, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS3Button(_ sender: Any) {
        S3Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benShangGuaImageView.image = UIImage(named: "s0zhen110")
            shangGuaShuZi = "110"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianShangGuaImageView.image = UIImage(named: "s0zhen110")
            shangGuaShuZi = "110"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: 3, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS4Button(_ sender: Any) {
        S4Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benShangGuaImageView.image = UIImage(named: "s0ji001")
            shangGuaShuZi = "001"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianShangGuaImageView.image = UIImage(named: "s0ji001")
            shangGuaShuZi = "001"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: 4, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS5Button(_ sender: Any) {
        S5Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benShangGuaImageView.image = UIImage(named: "s0kan101")
            shangGuaShuZi = "101"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianShangGuaImageView.image = UIImage(named: "s0kan101")
            shangGuaShuZi = "101"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: 5, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS6Button(_ sender: Any) {
        S6Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benShangGuaImageView.image = UIImage(named: "s0gen011")
            shangGuaShuZi = "011"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianShangGuaImageView.image = UIImage(named: "s0gen011")
            shangGuaShuZi = "011"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: 6, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    @IBAction func ClickS7Button(_ sender: Any) {
        S7Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benShangGuaImageView.image = UIImage(named: "s0kun111")
            shangGuaShuZi = "111"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianShangGuaImageView.image = UIImage(named: "s0kun111")
            shangGuaShuZi = "111"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: 7, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
    }
    
    @IBAction func ClickX0Button(_ sender: Any) {
        X0Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benXiaGuaImageView.image = UIImage(named: "s0qian000")
            xiaGuaShuZi = "000"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianXiaGuaImageView.image = UIImage(named: "s0qian000")
            xiaGuaShuZi = "000"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }

        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 0)
    }
    @IBAction func ClickX1Button(_ sender: Any) {
        X1Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benXiaGuaImageView.image = UIImage(named: "s0dui100")
            xiaGuaShuZi = "100"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianXiaGuaImageView.image = UIImage(named: "s0dui100")
            xiaGuaShuZi = "100"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 1)
    }
    @IBAction func ClickX2Button(_ sender: Any) {
        X2Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benXiaGuaImageView.image = UIImage(named: "s0li010")
            xiaGuaShuZi = "010"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianXiaGuaImageView.image = UIImage(named: "s0li010")
            xiaGuaShuZi = "010"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 2)
    }
    @IBAction func ClickX3Button(_ sender: Any) {
        X3Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benXiaGuaImageView.image = UIImage(named: "s0zhen110")
            xiaGuaShuZi = "110"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianXiaGuaImageView.image = UIImage(named: "s0zhen110")
            xiaGuaShuZi = "110"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 3)
    }
    @IBAction func ClickX4Button(_ sender: Any) {
        X4Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benXiaGuaImageView.image = UIImage(named: "s0ji001")
            xiaGuaShuZi = "001"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianXiaGuaImageView.image = UIImage(named: "s0ji001")
            xiaGuaShuZi = "001"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 4)
    }
    @IBAction func ClickX5Button(_ sender: Any) {
        X5Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benXiaGuaImageView.image = UIImage(named: "s0kan101")
            xiaGuaShuZi = "101"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianXiaGuaImageView.image = UIImage(named: "s0kan101")
            xiaGuaShuZi = "101"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 5)
    }
    @IBAction func ClickX6Button(_ sender: Any) {
        X6Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benXiaGuaImageView.image = UIImage(named: "s0gen011")
            xiaGuaShuZi = "011"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianXiaGuaImageView.image = UIImage(named: "s0gen011")
            xiaGuaShuZi = "011"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 6)
    }
    @IBAction func ClickX7Button(_ sender: Any) {
        X7Button.isHighlighted = true
        if benGuaView.backgroundColor == UIColor.lightGray {
            benXiaGuaImageView.image = UIImage(named: "s0kun111")
            xiaGuaShuZi = "111"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        } else {
            bianXiaGuaImageView.image = UIImage(named: "s0kun111")
            xiaGuaShuZi = "111"
            resultForShangXiaGua(shangGuaShuZi: shangGuaShuZi, xiaGuaShuZi: xiaGuaShuZi)
        }
        reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 7)
    }
    
    @IBAction func ClickOkButton(_ sender: Any) {
//         saveHistory()
        getLiuYao()
    }
    
    var SButtonList: [UIButton] = []
    var XButtonList: [UIButton] = []
//    let BlueColor: UIColor = UIColor(red: 0.16, green: 0.44, blue: 0.96, alpha: 1.0)
//    let WhiteColor: UIColor = UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    let GuaXiangList: [Int] = [7, 3, 5, 1, 6, 2, 4, 0]
    var guaXiangSelect: [Int] = [0, 0, 0, 0] // 分别对应本卦上卦、本卦下卦、变卦上卦、变卦下卦的卦象
    var gua: Gua?
    var guaXiang: [Int] = [7, 7, 7, 7] // 分别对应本卦上卦、本卦下卦、变卦上卦、变卦下卦的值
    var isBenGua: Bool = true
    
    var shangGuaShuZi = "000"
    var xiaGuaShuZi = "000"
//    var hightLighted :Bool = false
    
//    var SButtons:[Int] = []
    
    var guaDic = ShangXiaGuaResult.init()

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
        
        
        
        for i in 0...7 {
            SButtonList[i].setImage(UIImage(named: "unselected\(i)"), for: .normal)
            SButtonList[i].setImage(UIImage(named: "selected\(i)"), for: .selected)
            SButtonList[i].addTarget(self, action: #selector(buttonCliked(btn:)), for: .touchUpInside)
            
            XButtonList[i].setImage(UIImage(named: "unselected\(i)"), for: .normal)
            XButtonList[i].setImage(UIImage(named: "selected\(i)"), for: .selected)
            XButtonList[i].addTarget(self, action: #selector(buttonCliked(btn:)), for: .touchUpInside)
        }
        
        
        benGuaView.backgroundColor = .lightGray
        
        let benGuaTap = UITapGestureRecognizer(target: self, action: #selector(benGuaTapped))
        benGuaTap.numberOfTapsRequired = 1
        benGuaTap.numberOfTouchesRequired = 1
        benGuaView?.isUserInteractionEnabled = true
        benGuaView?.addGestureRecognizer(benGuaTap)
        
        let bianGuaTap = UITapGestureRecognizer(target: self, action: #selector(bianGuaTapped))
        bianGuaTap.numberOfTapsRequired = 1
        bianGuaTap.numberOfTouchesRequired = 1
        bianGuaView?.isUserInteractionEnabled = true
        bianGuaView?.addGestureRecognizer(bianGuaTap)
    }
    
    func reloadView(s: Int, x: Int) {
        if isBenGua {
            if s != guaXiangSelect[0] {
//                SButtonList[guaXiangSelect[0]].backgroundColor = WhiteColor
//                SButtonList[s].backgroundColor = BlueColor
                SButtonList[guaXiangSelect[0]].isHighlighted = false
                SButtonList[s].isHighlighted = true
                guaXiangSelect[0] = s
                guaXiang[0] = GuaXiangList[guaXiangSelect[0]]
            }
            if x != guaXiangSelect[1] {
//                XButtonList[guaXiangSelect[1]].backgroundColor = WhiteColor
//                XButtonList[x].backgroundColor = BlueColor
                XButtonList[guaXiangSelect[1]].isHighlighted = false
                XButtonList[x].isHighlighted = true
                guaXiangSelect[1] = x
                guaXiang[1] = GuaXiangList[guaXiangSelect[1]]
            }
        } else {
            if s != guaXiangSelect[2] {
//                SButtonList[guaXiangSelect[2]].backgroundColor = WhiteColor
//                SButtonList[s].backgroundColor = BlueColor
                SButtonList[guaXiangSelect[2]].isHighlighted = false
                SButtonList[s].isHighlighted = true
                guaXiangSelect[2] = s
                guaXiang[2] = GuaXiangList[guaXiangSelect[2]]
            }
            if x != guaXiangSelect[3] {
//                XButtonList[guaXiangSelect[3]].backgroundColor = WhiteColor
//                XButtonList[x].backgroundColor = BlueColor
                XButtonList[guaXiangSelect[3]].isHighlighted = false
                XButtonList[x].isHighlighted = true
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

    @objc func benGuaTapped(){
        benGuaView.backgroundColor = .lightGray
        bianGuaView.backgroundColor = .clear
        
        S0Button.isHighlighted = true
        X0Button.isHighlighted = true
        
        S1Button.isHighlighted = false
        S2Button.isHighlighted = false
        S3Button.isHighlighted = false
        S4Button.isHighlighted = false
        S5Button.isHighlighted = false
        S6Button.isHighlighted = false
        S7Button.isHighlighted = false

        X1Button.isHighlighted = false
        X2Button.isHighlighted = false
        X3Button.isHighlighted = false
        X4Button.isHighlighted = false
        X5Button.isHighlighted = false
        X6Button.isHighlighted = false
        X7Button.isHighlighted = false
        
        switch true {
        case S0Button.isHighlighted:
            reloadView(s: 0, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S1Button.isHighlighted:
            reloadView(s: 1, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S2Button.isHighlighted:
            reloadView(s: 2, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S3Button.isHighlighted:
            reloadView(s: 3, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S4Button.isHighlighted:
            reloadView(s: 4, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S5Button.isHighlighted:
            reloadView(s: 5, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S6Button.isHighlighted:
            reloadView(s: 6, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S7Button.isHighlighted:
            reloadView(s: 7, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        default:
            print("error")
        }
        
        switch true {
        case X0Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 0)
        case X1Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 1)
        case X2Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 2)
        case X3Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 3)
        case X4Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 4)
        case X5Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 5)
        case X6Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 6)
        case X7Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 7)
        default:
            print("error")
        }
    }
    
    @objc func bianGuaTapped() {
        bianGuaView.backgroundColor = .lightGray
        benGuaView.backgroundColor = .clear
        
        S0Button.isHighlighted = true
        X0Button.isHighlighted = true
        
        S1Button.isHighlighted = false
        S2Button.isHighlighted = false
        S3Button.isHighlighted = false
        S4Button.isHighlighted = false
        S5Button.isHighlighted = false
        S6Button.isHighlighted = false
        S7Button.isHighlighted = false
        
        X1Button.isHighlighted = false
        X2Button.isHighlighted = false
        X3Button.isHighlighted = false
        X4Button.isHighlighted = false
        X5Button.isHighlighted = false
        X6Button.isHighlighted = false
        X7Button.isHighlighted = false
        
        switch true {
        case S0Button.isHighlighted:
            reloadView(s: 0, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S1Button.isHighlighted:
            reloadView(s: 1, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S2Button.isHighlighted:
            reloadView(s: 2, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S3Button.isHighlighted:
            reloadView(s: 3, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S4Button.isHighlighted:
            reloadView(s: 4, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S5Button.isHighlighted:
            reloadView(s: 5, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S6Button.isHighlighted:
            reloadView(s: 6, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        case S7Button.isHighlighted:
            reloadView(s: 7, x: isBenGua ? guaXiangSelect[1] : guaXiangSelect[3])
        default:
            print("error")
        }
        
        switch true {
        case X0Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 0)
        case X1Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 1)
        case X2Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 2)
        case X3Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 3)
        case X4Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 4)
        case X5Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 5)
        case X6Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 6)
        case X7Button.isHighlighted:
            reloadView(s: isBenGua ? guaXiangSelect[0] : guaXiangSelect[2], x: 7)
        default:
            print("error")
        }
    }
    
    func resultForShangXiaGua( shangGuaShuZi:String, xiaGuaShuZi:String) {
        let shangXiaGuaShuZi:String = shangGuaShuZi + xiaGuaShuZi
        switch shangXiaGuaShuZi {
        case "000000":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "乾为天"
                benGuaDiYiGuaLabel.text = "本宫卦"
                benGuaQianWeiTianLabel.text = "乾宫"
            } else {
                bianGuaQianGongLabel.text = "乾为天"
                bianGuaDiYiGuaLabel.text = "本宫卦"
                bianGuaQianWeiTianLabel.text = "乾宫"
            }
        case "000001":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "天风姤"
                benGuaDiYiGuaLabel.text = "一世卦"
                benGuaQianWeiTianLabel.text = "乾宫"
            } else {
                bianGuaQianGongLabel.text = "天风姤"
                bianGuaDiYiGuaLabel.text = "一世卦"
                bianGuaQianWeiTianLabel.text = "乾宫"
            }
        case "000011":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "天山遁"
                benGuaDiYiGuaLabel.text = "二世卦"
                benGuaQianWeiTianLabel.text = "乾宫"
            } else {
                bianGuaQianGongLabel.text = "天山遁"
                bianGuaDiYiGuaLabel.text = "二世卦"
                bianGuaQianWeiTianLabel.text = "乾宫"
            }
        case "000111":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "天地否"
                benGuaDiYiGuaLabel.text = "三世卦"
                benGuaQianWeiTianLabel.text = "乾宫"
            } else {
                bianGuaQianGongLabel.text = "天地否"
                bianGuaDiYiGuaLabel.text = "三世卦"
                bianGuaQianWeiTianLabel.text = "乾宫"
            }
        case "001111":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "风地观"
                benGuaDiYiGuaLabel.text = "四世卦"
                benGuaQianWeiTianLabel.text = "乾宫"
            } else {
                bianGuaQianGongLabel.text = "风地观"
                bianGuaDiYiGuaLabel.text = "四世卦"
                bianGuaQianWeiTianLabel.text = "乾宫"
            }
        case "011111":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "山地剥"
                benGuaDiYiGuaLabel.text = "五世卦"
                benGuaQianWeiTianLabel.text = "乾宫"
            } else {
                bianGuaQianGongLabel.text = "山地剥"
                bianGuaDiYiGuaLabel.text = "五世卦"
                bianGuaQianWeiTianLabel.text = "乾宫"
            }
        case "010111":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "火地晋"
                benGuaDiYiGuaLabel.text = "游魂卦"
                benGuaQianWeiTianLabel.text = "乾宫"
            } else {
                bianGuaQianGongLabel.text = "火地晋"
                bianGuaDiYiGuaLabel.text = "游魂卦"
                bianGuaQianWeiTianLabel.text = "乾宫"
            }
        case "010000":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "火天大有"
                benGuaDiYiGuaLabel.text = "归魂卦"
                benGuaQianWeiTianLabel.text = "乾宫"
            } else {
                bianGuaQianGongLabel.text = "火天大有"
                bianGuaDiYiGuaLabel.text = "归魂卦"
                bianGuaQianWeiTianLabel.text = "乾宫"
            }
        case "111111":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "坤为地"
                benGuaDiYiGuaLabel.text = "本宫卦"
                benGuaQianWeiTianLabel.text = "坤宫"
            } else {
                bianGuaQianGongLabel.text = "坤为地"
                bianGuaDiYiGuaLabel.text = "本宫卦"
                bianGuaQianWeiTianLabel.text = "坤宫"
            }
        case "111110":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "地雷复"
                benGuaDiYiGuaLabel.text = "一世卦"
                benGuaQianWeiTianLabel.text = "坤宫"
            } else {
                bianGuaQianGongLabel.text = "地雷复"
                bianGuaDiYiGuaLabel.text = "一世卦"
                bianGuaQianWeiTianLabel.text = "坤宫"
            }
        case "111100":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "地泽临"
                benGuaDiYiGuaLabel.text = "二世卦"
                benGuaQianWeiTianLabel.text = "坤宫"
            } else {
                bianGuaQianGongLabel.text = "地泽临"
                bianGuaDiYiGuaLabel.text = "二世卦"
                bianGuaQianWeiTianLabel.text = "坤宫"
            }
        case "111000":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "地天泰"
                benGuaDiYiGuaLabel.text = "三世卦"
                benGuaQianWeiTianLabel.text = "坤宫"
            } else {
                bianGuaQianGongLabel.text = "地天泰"
                bianGuaDiYiGuaLabel.text = "三世卦"
                bianGuaQianWeiTianLabel.text = "坤宫"
            }
        case "110000":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "雷天大壮"
                benGuaDiYiGuaLabel.text = "四世卦"
                benGuaQianWeiTianLabel.text = "坤宫"
            } else {
                bianGuaQianGongLabel.text = "雷天大壮"
                bianGuaDiYiGuaLabel.text = "四世卦"
                bianGuaQianWeiTianLabel.text = "坤宫"
            }
        case "100000":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "泽天夬"  //泽天夬guai
                benGuaDiYiGuaLabel.text = "五世卦"
                benGuaQianWeiTianLabel.text = "坤宫"
            } else {
                bianGuaQianGongLabel.text = "泽天夬"
                bianGuaDiYiGuaLabel.text = "五世卦"
                bianGuaQianWeiTianLabel.text = "坤宫"
            }
        case "101000":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "水天需"
                benGuaDiYiGuaLabel.text = "游魂卦"
                benGuaQianWeiTianLabel.text = "坤宫"
            } else {
                bianGuaQianGongLabel.text = "水天需"
                bianGuaDiYiGuaLabel.text = "游魂卦"
                bianGuaQianWeiTianLabel.text = "坤宫"
            }
        case "101111":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "水地比"
                benGuaDiYiGuaLabel.text = "归魂卦"
                benGuaQianWeiTianLabel.text = "坤宫"
            } else {
                bianGuaQianGongLabel.text = "水地比"
                bianGuaDiYiGuaLabel.text = "归魂卦"
                bianGuaQianWeiTianLabel.text = "坤宫"
            }
        case "110110":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "震为雷"
                benGuaDiYiGuaLabel.text = "本宫卦"
                benGuaQianWeiTianLabel.text = "震宫"
            } else {
                bianGuaQianGongLabel.text = "震为雷"
                bianGuaDiYiGuaLabel.text = "本宫卦"
                bianGuaQianWeiTianLabel.text = "震宫"
            }
        case "110111":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "雷地豫"
                benGuaDiYiGuaLabel.text = "一世卦"
                benGuaQianWeiTianLabel.text = "震宫"
            } else {
                bianGuaQianGongLabel.text = "雷地豫"
                bianGuaDiYiGuaLabel.text = "一世卦"
                bianGuaQianWeiTianLabel.text = "震宫"
            }
        case "110101":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "雷水解"
                benGuaDiYiGuaLabel.text = "二世卦"
                benGuaQianWeiTianLabel.text = "震宫"
            } else {
                bianGuaQianGongLabel.text = "雷水解"
                bianGuaDiYiGuaLabel.text = "二世卦"
                bianGuaQianWeiTianLabel.text = "震宫"
            }
        case "110001":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "雷风恒"
                benGuaDiYiGuaLabel.text = "三世卦"
                benGuaQianWeiTianLabel.text = "震宫"
            } else {
                bianGuaQianGongLabel.text = "雷风恒"
                bianGuaDiYiGuaLabel.text = "三世卦"
                bianGuaQianWeiTianLabel.text = "震宫"
            }
        case "111001":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "地风升"
                benGuaDiYiGuaLabel.text = "四世卦"
                benGuaQianWeiTianLabel.text = "震宫"
            } else {
                bianGuaQianGongLabel.text = "地风升"
                bianGuaDiYiGuaLabel.text = "四世卦"
                bianGuaQianWeiTianLabel.text = "震宫"
            }
        case "101001":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "水风升"
                benGuaDiYiGuaLabel.text = "五世卦"
                benGuaQianWeiTianLabel.text = "震宫"
            } else {
                bianGuaQianGongLabel.text = "水风升"
                bianGuaDiYiGuaLabel.text = "五世卦"
                bianGuaQianWeiTianLabel.text = "震宫"
            }
        case "100001":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "泽风大过"
                benGuaDiYiGuaLabel.text = "游魂卦"
                benGuaQianWeiTianLabel.text = "震宫"
            } else {
                bianGuaQianGongLabel.text = "泽风大过"
                bianGuaDiYiGuaLabel.text = "游魂卦"
                bianGuaQianWeiTianLabel.text = "震宫"
            }
        case "100110":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "泽雷随"
                benGuaDiYiGuaLabel.text = "归魂卦"
                benGuaQianWeiTianLabel.text = "震宫"
            } else {
                bianGuaQianGongLabel.text = "泽雷随"
                bianGuaDiYiGuaLabel.text = "归魂卦"
                bianGuaQianWeiTianLabel.text = "震宫"
            }  //巽xun
        case "001001":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "巽为风"
                benGuaDiYiGuaLabel.text = "本宫卦"
                benGuaQianWeiTianLabel.text = "巽宫"
            } else {
                bianGuaQianGongLabel.text = "巽为风"
                bianGuaDiYiGuaLabel.text = "本宫卦"
                bianGuaQianWeiTianLabel.text = "巽宫"
            }
        case "001000":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "风天小畜"
                benGuaDiYiGuaLabel.text = "一世卦"
                benGuaQianWeiTianLabel.text = "巽宫"
            } else {
                bianGuaQianGongLabel.text = "风天小畜"
                bianGuaDiYiGuaLabel.text = "一世卦"
                bianGuaQianWeiTianLabel.text = "巽宫"
            }
        case "001010":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "风火人家"
                benGuaDiYiGuaLabel.text = "二世卦"
                benGuaQianWeiTianLabel.text = "巽宫"
            } else {
                bianGuaQianGongLabel.text = "风火人家"
                bianGuaDiYiGuaLabel.text = "二世卦"
                bianGuaQianWeiTianLabel.text = "巽宫"
            }
        case "001110":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "风雷益"
                benGuaDiYiGuaLabel.text = "三世卦"
                benGuaQianWeiTianLabel.text = "巽宫"
            } else {
                bianGuaQianGongLabel.text = "风雷益"
                bianGuaDiYiGuaLabel.text = "三世卦"
                bianGuaQianWeiTianLabel.text = "巽宫"
            }
        case "000110":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "天雷无妄"
                benGuaDiYiGuaLabel.text = "四世卦"
                benGuaQianWeiTianLabel.text = "巽宫"
            } else {
                bianGuaQianGongLabel.text = "天雷无妄"
                bianGuaDiYiGuaLabel.text = "四世卦"
                bianGuaQianWeiTianLabel.text = "巽宫"
            }
        case "010110":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "火雷噬嗑"
                benGuaDiYiGuaLabel.text = "五世卦"
                benGuaQianWeiTianLabel.text = "巽宫"
            } else {
                bianGuaQianGongLabel.text = "火雷噬嗑"
                bianGuaDiYiGuaLabel.text = "五世卦"
                bianGuaQianWeiTianLabel.text = "巽宫"
            }
        case "011110":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "山雷颐"
                benGuaDiYiGuaLabel.text = "游魂卦"
                benGuaQianWeiTianLabel.text = "巽宫"
            } else {
                bianGuaQianGongLabel.text = "山雷颐"
                bianGuaDiYiGuaLabel.text = "游魂卦"
                bianGuaQianWeiTianLabel.text = "巽宫"
            }
        case "011001":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "山风蛊"
                benGuaDiYiGuaLabel.text = "归魂卦"
                benGuaQianWeiTianLabel.text = "巽宫"
            } else {
                bianGuaQianGongLabel.text = "山风蛊"
                bianGuaDiYiGuaLabel.text = "归魂卦"
                bianGuaQianWeiTianLabel.text = "巽宫"
            }
            
            /*****/
        case "101101":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "坎为水"
                benGuaDiYiGuaLabel.text = "本宫卦"
                benGuaQianWeiTianLabel.text = "坎宫"
            } else {
                bianGuaQianGongLabel.text = "坎为水"
                bianGuaDiYiGuaLabel.text = "本宫卦"
                bianGuaQianWeiTianLabel.text = "坎宫"
            }
        case "101100":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "水泽节"
                benGuaDiYiGuaLabel.text = "一世卦"
                benGuaQianWeiTianLabel.text = "坎宫"
            } else {
                bianGuaQianGongLabel.text = "水泽节"
                bianGuaDiYiGuaLabel.text = "一世卦"
                bianGuaQianWeiTianLabel.text = "坎宫"
            }
        case "101110":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "水雷屯"
                benGuaDiYiGuaLabel.text = "二世卦"
                benGuaQianWeiTianLabel.text = "坎宫"
            } else {
                bianGuaQianGongLabel.text = "水雷屯"
                bianGuaDiYiGuaLabel.text = "二世卦"
                bianGuaQianWeiTianLabel.text = "坎宫"
            }
        case "101010":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "水火既济"
                benGuaDiYiGuaLabel.text = "三世卦"
                benGuaQianWeiTianLabel.text = "坎宫"
            } else {
                bianGuaQianGongLabel.text = "水火既济"
                bianGuaDiYiGuaLabel.text = "三世卦"
                bianGuaQianWeiTianLabel.text = "坎宫"
            }
        case "100010":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "泽火革"
                benGuaDiYiGuaLabel.text = "四世卦"
                benGuaQianWeiTianLabel.text = "坎宫"
            } else {
                bianGuaQianGongLabel.text = "泽火革"
                bianGuaDiYiGuaLabel.text = "四世卦"
                bianGuaQianWeiTianLabel.text = "坎宫"
            }
        case "110010":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "雷火丰"
                benGuaDiYiGuaLabel.text = "五世卦"
                benGuaQianWeiTianLabel.text = "坎宫"
            } else {
                bianGuaQianGongLabel.text = "雷火丰"
                bianGuaDiYiGuaLabel.text = "五世卦"
                bianGuaQianWeiTianLabel.text = "坎宫"
            }
        case "111010":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "地火明夷"
                benGuaDiYiGuaLabel.text = "游魂卦"
                benGuaQianWeiTianLabel.text = "坎宫"
            } else {
                bianGuaQianGongLabel.text = "地火明夷"
                bianGuaDiYiGuaLabel.text = "游魂卦"
                bianGuaQianWeiTianLabel.text = "坎宫"
            }
        case "111101":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "地水师"
                benGuaDiYiGuaLabel.text = "归魂卦"
                benGuaQianWeiTianLabel.text = "坎宫"
            } else {
                bianGuaQianGongLabel.text = "地水师"
                bianGuaDiYiGuaLabel.text = "归魂卦"
                bianGuaQianWeiTianLabel.text = "坎宫"
            }
            
            //离宫
        case "010010":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "离为火"
                benGuaDiYiGuaLabel.text = "本宫卦"
                benGuaQianWeiTianLabel.text = "离宫"
            } else {
                bianGuaQianGongLabel.text = "离为火"
                bianGuaDiYiGuaLabel.text = "本宫卦"
                bianGuaQianWeiTianLabel.text = "离宫"
            }
        case "010011":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "火山旅"
                benGuaDiYiGuaLabel.text = "一世卦"
                benGuaQianWeiTianLabel.text = "离宫"
            } else {
                bianGuaQianGongLabel.text = "火山旅"
                bianGuaDiYiGuaLabel.text = "一世卦"
                bianGuaQianWeiTianLabel.text = "离宫"
            }
        case "010001":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "火风鼎"
                benGuaDiYiGuaLabel.text = "二世卦"
                benGuaQianWeiTianLabel.text = "离宫"
            } else {
                bianGuaQianGongLabel.text = "火风鼎"
                bianGuaDiYiGuaLabel.text = "二世卦"
                bianGuaQianWeiTianLabel.text = "离宫"
            }
        case "010101":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "火水未济"
                benGuaDiYiGuaLabel.text = "三世卦"
                benGuaQianWeiTianLabel.text = "离宫"
            } else {
                bianGuaQianGongLabel.text = "火水未济"
                bianGuaDiYiGuaLabel.text = "三世卦"
                bianGuaQianWeiTianLabel.text = "离宫"
            }
        case "011101":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "山水蒙"
                benGuaDiYiGuaLabel.text = "四世卦"
                benGuaQianWeiTianLabel.text = "离宫"
            } else {
                bianGuaQianGongLabel.text = "山水蒙"
                bianGuaDiYiGuaLabel.text = "四世卦"
                bianGuaQianWeiTianLabel.text = "离宫"
            }
        case "001101":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "风水涣"
                benGuaDiYiGuaLabel.text = "五世卦"
                benGuaQianWeiTianLabel.text = "离宫"
            } else {
                bianGuaQianGongLabel.text = "风水涣"
                bianGuaDiYiGuaLabel.text = "五世卦"
                bianGuaQianWeiTianLabel.text = "离宫"
            }
        case "000101":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "天水讼"
                benGuaDiYiGuaLabel.text = "游魂卦"
                benGuaQianWeiTianLabel.text = "离宫"
            } else {
                bianGuaQianGongLabel.text = "天水讼"
                bianGuaDiYiGuaLabel.text = "游魂卦"
                bianGuaQianWeiTianLabel.text = "离宫"
            }
        case "000010":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "天火同人"
                benGuaDiYiGuaLabel.text = "归魂卦"
                benGuaQianWeiTianLabel.text = "离宫"
            } else {
                bianGuaQianGongLabel.text = "天火同人"
                bianGuaDiYiGuaLabel.text = "归魂卦"
                bianGuaQianWeiTianLabel.text = "离宫"
            }
            
            //艮宫
        case "011011":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "艮为山"
                benGuaDiYiGuaLabel.text = "本宫卦"
                benGuaQianWeiTianLabel.text = "艮宫"
            } else {
                bianGuaQianGongLabel.text = "艮为山"
                bianGuaDiYiGuaLabel.text = "本宫卦"
                bianGuaQianWeiTianLabel.text = "艮宫"
            }
        case "011010":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "山火贲"   //贲ben
                benGuaDiYiGuaLabel.text = "一世卦"
                benGuaQianWeiTianLabel.text = "艮宫"
            } else {
                bianGuaQianGongLabel.text = "山火贲"
                bianGuaDiYiGuaLabel.text = "一世卦"
                bianGuaQianWeiTianLabel.text = "艮宫"
            }
        case "011000":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "山天大畜"
                benGuaDiYiGuaLabel.text = "二世卦"
                benGuaQianWeiTianLabel.text = "艮宫"
            } else {
                bianGuaQianGongLabel.text = "山天大畜"
                bianGuaDiYiGuaLabel.text = "二世卦"
                bianGuaQianWeiTianLabel.text = "艮宫"
            }
        case "011100":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "山泽损"
                benGuaDiYiGuaLabel.text = "三世卦"
                benGuaQianWeiTianLabel.text = "艮宫"
            } else {
                bianGuaQianGongLabel.text = "山泽损"
                bianGuaDiYiGuaLabel.text = "三世卦"
                bianGuaQianWeiTianLabel.text = "艮宫"
            }
        case "010100":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "火泽睽"
                benGuaDiYiGuaLabel.text = "四世卦"
                benGuaQianWeiTianLabel.text = "艮宫"
            } else {
                bianGuaQianGongLabel.text = "火泽睽"
                bianGuaDiYiGuaLabel.text = "四世卦"
                bianGuaQianWeiTianLabel.text = "艮宫"
            }
        case "000100":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "天泽履"
                benGuaDiYiGuaLabel.text = "五世卦"
                benGuaQianWeiTianLabel.text = "艮宫"
            } else {
                bianGuaQianGongLabel.text = "天泽履"
                bianGuaDiYiGuaLabel.text = "五世卦"
                bianGuaQianWeiTianLabel.text = "艮宫"
            }
        case "001100":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "风泽中孚"
                benGuaDiYiGuaLabel.text = "游魂卦"
                benGuaQianWeiTianLabel.text = "艮宫"
            } else {
                bianGuaQianGongLabel.text = "风泽中孚"
                bianGuaDiYiGuaLabel.text = "游魂卦"
                bianGuaQianWeiTianLabel.text = "艮宫"
            }
        case "001011":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "风山渐"
                benGuaDiYiGuaLabel.text = "归魂卦"
                benGuaQianWeiTianLabel.text = "艮宫"
            } else {
                bianGuaQianGongLabel.text = "风山渐"
                bianGuaDiYiGuaLabel.text = "归魂卦"
                bianGuaQianWeiTianLabel.text = "艮宫"
            }
            //兑宫
        case "100100":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "兑为泽"
                benGuaDiYiGuaLabel.text = "本宫卦"
                benGuaQianWeiTianLabel.text = "兑宫"
            } else {
                bianGuaQianGongLabel.text = "兑为泽"
                bianGuaDiYiGuaLabel.text = "本宫卦"
                bianGuaQianWeiTianLabel.text = "兑宫"
            }
        case "100101":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "泽水困"
                benGuaDiYiGuaLabel.text = "一世卦"
                benGuaQianWeiTianLabel.text = "兑宫"
            } else {
                bianGuaQianGongLabel.text = "泽水困"
                bianGuaDiYiGuaLabel.text = "一世卦"
                bianGuaQianWeiTianLabel.text = "兑宫"
            }
        case "100111":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "泽地萃"
                benGuaDiYiGuaLabel.text = "二世卦"
                benGuaQianWeiTianLabel.text = "兑宫"
            } else {
                bianGuaQianGongLabel.text = "泽地萃"
                bianGuaDiYiGuaLabel.text = "二世卦"
                bianGuaQianWeiTianLabel.text = "兑宫"
            }
        case "100011":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "泽山咸"
                benGuaDiYiGuaLabel.text = "三世卦"
                benGuaQianWeiTianLabel.text = "兑宫"
            } else {
                bianGuaQianGongLabel.text = "泽山咸"
                bianGuaDiYiGuaLabel.text = "三世卦"
                bianGuaQianWeiTianLabel.text = "兑宫"
            }
        case "101011":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "水山蹇"
                benGuaDiYiGuaLabel.text = "四世卦"
                benGuaQianWeiTianLabel.text = "兑宫"
            } else {
                bianGuaQianGongLabel.text = "水山蹇"
                bianGuaDiYiGuaLabel.text = "四世卦"
                bianGuaQianWeiTianLabel.text = "兑宫"
            }
        case "111011":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "地山谦"
                benGuaDiYiGuaLabel.text = "五世卦"
                benGuaQianWeiTianLabel.text = "兑宫"
            } else {
                bianGuaQianGongLabel.text = "地山谦"
                bianGuaDiYiGuaLabel.text = "五世卦"
                bianGuaQianWeiTianLabel.text = "兑宫"
            }
        case "110011":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "雷山小过"
                benGuaDiYiGuaLabel.text = "游魂卦"
                benGuaQianWeiTianLabel.text = "兑宫"
            } else {
                bianGuaQianGongLabel.text = "雷山小过"
                bianGuaDiYiGuaLabel.text = "游魂卦"
                bianGuaQianWeiTianLabel.text = "兑宫"
            }
        case "110100":
            if benGuaView.backgroundColor == UIColor.lightGray {
                benGuaQianGongLabel.text = "雷泽归妹"
                benGuaDiYiGuaLabel.text = "归魂卦"
                benGuaQianWeiTianLabel.text = "兑宫"
            } else {
                bianGuaQianGongLabel.text = "雷泽归妹"
                bianGuaDiYiGuaLabel.text = "归魂卦"
                bianGuaQianWeiTianLabel.text = "兑宫"
            }
        default:
            print("error!")
        }
    }
    
        @objc func buttonCliked(btn:UIButton) {
        DispatchQueue.main.async {
            btn.isSelected = !btn.isSelected
            btn.isHighlighted = true
            
        }
    }

}
