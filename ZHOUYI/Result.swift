//
//  Result.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/3.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class Result: UIViewController {
    
    // 注意！前方高能！
    // 控件
    // 六兽
    @IBOutlet weak var LiuShou0: UILabel!
    @IBOutlet weak var LiuShou1: UILabel!
    @IBOutlet weak var LiuShou2: UILabel!
    @IBOutlet weak var LiuShou3: UILabel!
    @IBOutlet weak var LiuShou4: UILabel!
    @IBOutlet weak var LiuShou5: UILabel!
    // 六亲
    @IBOutlet weak var LiuQin0: UILabel!
    @IBOutlet weak var LiuQin1: UILabel!
    @IBOutlet weak var LiuQin2: UILabel!
    @IBOutlet weak var LiuQin3: UILabel!
    @IBOutlet weak var LiuQin4: UILabel!
    @IBOutlet weak var LiuQin5: UILabel!
    // 世应
    @IBOutlet weak var ShiYing0: UILabel!
    @IBOutlet weak var ShiYing1: UILabel!
    @IBOutlet weak var ShiYing2: UILabel!
    @IBOutlet weak var ShiYing3: UILabel!
    @IBOutlet weak var ShiYing4: UILabel!
    @IBOutlet weak var ShiYing5: UILabel!
    // 卦象
    @IBOutlet weak var GuaXiang0: UIImageView!
    @IBOutlet weak var GuaXiang1: UIImageView!
    @IBOutlet weak var GuaXiang2: UIImageView!
    @IBOutlet weak var GuaXiang3: UIImageView!
    @IBOutlet weak var GuaXiang4: UIImageView!
    @IBOutlet weak var GuaXiang5: UIImageView!
    // 日月年
    @IBOutlet weak var Day: UILabel!
    @IBOutlet weak var Month: UILabel!
    @IBOutlet weak var Year: UILabel!
    @IBOutlet weak var Date: UILabel!
    // 月
    @IBOutlet weak var Yue: UILabel!
    @IBOutlet weak var Yue0: UILabel!
    @IBOutlet weak var Yue1: UILabel!
    @IBOutlet weak var Yue2: UILabel!
    @IBOutlet weak var Yue3: UILabel!
    @IBOutlet weak var Yue4: UILabel!
    // 亲
    @IBOutlet weak var Qing0: UILabel!
    @IBOutlet weak var Qing1: UILabel!
    @IBOutlet weak var Qing2: UILabel!
    @IBOutlet weak var Qing3: UILabel!
    @IBOutlet weak var Qing4: UILabel!
    // 神
    @IBOutlet weak var Shen0: UILabel!
    @IBOutlet weak var Shen1: UILabel!
    @IBOutlet weak var Shen2: UILabel!
    @IBOutlet weak var Shen3: UILabel!
    @IBOutlet weak var Shen4: UILabel!
    // 日
    @IBOutlet weak var Ri0: UILabel!
    @IBOutlet weak var Ri1: UILabel!
    @IBOutlet weak var Ri2: UILabel!
    @IBOutlet weak var Ri3: UILabel!
    @IBOutlet weak var Ri4: UILabel!
    // 变爻
    @IBOutlet weak var BianYao0: UILabel!
    @IBOutlet weak var BianYao1: UILabel!
    @IBOutlet weak var BianYao2: UILabel!
    @IBOutlet weak var BianYao3: UILabel!
    @IBOutlet weak var BianYao4: UILabel!
    
    // 控件功能

    // 起卦日期
    var date: String? = "2019-01-01"
    // 起卦卦象列表
    var guaXiangList: [Int?] = [9, 7, 7, 7, 7, 8]
    // 六神表
    var yongShen: String = "世"
    // 亲表
    var QinTable: [String] = [String]()
    // 用神对应的六亲的首字
    var Z: String = "世"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onGetResult()
        // Do any additional setup after loading the view.
    }
    
    // 用起卦日期"yyyy-mm-dd"换算日月年的天干表示，并算出六神表顺序
    func onGetDate() -> Void {
        let requestJson = ["time": date]
        HTTP.POST("http://120.76.128.110:12510/be/GetTime", parameters: requestJson, requestSerializer: JSONParameterSerializer()) { response in
            do {
                let responseJson = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as AnyObject
                let day = responseJson.object(forKey: "day") as? String
                let month = responseJson.object(forKey: "month") as? String
                let year = responseJson.object(forKey: "year") as? String
                
                DispatchQueue.main.async {
                    // 初始化日月年
                    self.Day.text = self.getVerticalString(inputString: day)
                    self.Month.text = self.getVerticalString(inputString: month)
                    self.Year.text = self.getVerticalString(inputString: year)
                    self.Date.text = self.date
                    self.Yue.text = self.getSubCharacterAsString(inputString: month, inputIndex: 1) + "月"
                    // 初始化六神（兽）
                    self.onGetLiuShen(inputDay: self.getSubCharacterAsString(inputString: day, inputIndex: 0))
                }
            } catch {
                print("onGetDate:")
                print(error)
            }
        }
    }
    
    // 获取卜卦的结果
    func onGetResult() -> Void {
        HTTP.POST("http://119.23.76.43:8081/table/item", parameters: guaXiangList, requestSerializer: JSONParameterSerializer()) { response in
            do {
                let responseJson = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as AnyObject
                let code = responseJson.object(forKey: "code") as! Int
                if code == 0 {
                    self.onGetDate()
                    let data = responseJson.object(forKey: "data") as AnyObject
                    let zhuangGuaTable = data.object(forKey: "zhuangGuaTable") as AnyObject
                    let bianGuaTable = data.object(forKey: "bianGuaTable") as AnyObject
                    let fuShenTable = data.object(forKey: "fuShenTable") as AnyObject
                    let monthTable = data.object(forKey: "monthTable") as AnyObject
                    let qingTable = data.object(forKey: "qingTable") as AnyObject
                    let dayTable = data.object(forKey: "dayTable") as AnyObject
                    let bianYaoTable = data.object(forKey: "bianYaoTable") as AnyObject
                    
                    DispatchQueue.main.async {
                        self.onInitZhuangGuaTable(inputJson: zhuangGuaTable)
                        self.onInitMonthTable(inputJson: monthTable)
                        self.onInitQingTable(inputJson: qingTable)
                        self.onInitShenTable()
                        self.onInitDayTable(inputJson: dayTable)
                        self.onInitBianYaoTable(inputJson: bianYaoTable)
                    }
                }
            } catch {
                print("onGetResult:")
                print(error)
            }
        }
    }
    
    // 根据下标以String的类型返回字符串的字符
    func getSubCharacterAsString(inputString: String?, inputIndex: Int) -> String {
        var str = ""
        let len = inputString?.count
        if inputIndex < len! {
            let startIndex = inputString?.index((inputString?.startIndex)!, offsetBy: inputIndex)
            let endIndex = inputString?.index((inputString?.startIndex)!, offsetBy: inputIndex + 1)
            str = String(inputString![startIndex!..<endIndex!])
        }
        return str
    }
    
    // 返回字符串的竖式形式
    func getVerticalString(inputString: String?) -> String {
        let len = inputString?.count
        var str: String = ""
        for i in 0..<len! {
            let startIndex = inputString?.index((inputString?.startIndex)!, offsetBy: i)
            let endIndex = inputString?.index((inputString?.startIndex)!, offsetBy: i + 1)
            str += String(inputString![startIndex!..<endIndex!])
            if (i + 1 < len!) {
                str += "\n"
            }
        }
        return str
    }
    
    // 处理装卦区
    func onInitZhuangGuaTable(inputJson: AnyObject) -> Void {
        let basicData = inputJson.object(forKey: "basicData") as AnyObject
        // 处理六亲列
        var str = fuckYouString(inputString: basicData.object(forKey: "six_relatives") as! String)
        let LiuQinList: [String] = str.components(separatedBy: ",")
        LiuQin0.text = getVerticalString(inputString: LiuQinList[0])
        LiuQin1.text = getVerticalString(inputString: LiuQinList[1])
        LiuQin2.text = getVerticalString(inputString: LiuQinList[2])
        LiuQin3.text = getVerticalString(inputString: LiuQinList[3])
        LiuQin4.text = getVerticalString(inputString: LiuQinList[4])
        LiuQin5.text = getVerticalString(inputString: LiuQinList[5])
        // 处理世应
        str = fuckYouString(inputString: basicData.object(forKey: "shi_ying") as! String)
        let ShiYingList: [String] = str.components(separatedBy: ",")
        var ShiIndex: Int = 0
        var YingIndex: Int = 0
        for i in 0..<ShiYingList.count {
            if ShiYingList[i] == "世" {
                ShiIndex = i
            } else if ShiYingList[i] == "应" {
                YingIndex = i
            }
        }
        switch ShiIndex {
        case 0:
            ShiYing0.text = "世"
            break
        case 1:
            ShiYing1.text = "世"
            break
        case 2:
            ShiYing2.text = "世"
            break
        case 3:
            ShiYing3.text = "世"
            break
        case 4:
            ShiYing4.text = "世"
            break
        case 5:
            ShiYing5.text = "世"
            break
        default:
            break
        }
        switch YingIndex {
        case 0:
            ShiYing0.text = "应"
            break
        case 1:
            ShiYing1.text = "应"
            break
        case 2:
            ShiYing2.text = "应"
            break
        case 3:
            ShiYing3.text = "应"
            break
        case 4:
            ShiYing4.text = "应"
            break
        case 5:
            ShiYing5.text = "应"
            break
        default:
            break
        }
        // 处理神表
        if yongShen == "世" {
            Z = getSubCharacterAsString(inputString: LiuQinList[ShiIndex], inputIndex: 0)
        } else if yongShen == "用" {
            Z = getSubCharacterAsString(inputString: LiuQinList[YingIndex], inputIndex: 0)
        }
        
        onGetGuaXiang()
    }
    
    func fuckYouString(inputString: String) -> String {
        return inputString.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
    }
    
    // 处理变卦区
    func onInitBianGuaTable(inputJson: Any) -> Void {
        print(inputJson)
    }
    
    // 处理伏神区
    func onInitFuShenTable(inputJson: Any) -> Void {
        print(inputJson)
    }
    
    // 处理月表
    func onInitMonthTable(inputJson: AnyObject) -> Void {
        let attr:[String] = inputJson.object(forKey: "attr") as! [String]
        let wuXing:[String] = inputJson.object(forKey: "wuxing") as! [String]
        Yue0.text = attr[0] + wuXing[0]
        Yue1.text = attr[1] + wuXing[1]
        Yue2.text = attr[2] + wuXing[2]
        Yue3.text = attr[3] + wuXing[3]
        Yue4.text = attr[4] + wuXing[4]
    }
    
    // 处理亲表
    func onInitQingTable(inputJson: Any) -> Void {
        QinTable = inputJson as![String]
        Qing0.text = QinTable[0]
        Qing1.text = QinTable[1]
        Qing2.text = QinTable[2]
        Qing3.text = QinTable[3]
        Qing4.text = QinTable[4]
        
        if yongShen == "官鬼" || yongShen == "父母" || yongShen == "兄弟" || yongShen == "子孙" || yongShen == "妻财" {
            Z = getSubCharacterAsString(inputString: yongShen, inputIndex: 0)
        }
    }
    
    // 处理神表
    func onInitShenTable() -> Void {
        var index = 0
        for i in 0 ..< QinTable.count {
            if QinTable[i] == Z {
                index = i
                break
            }
        }
        switch index {
        case 0:
            Shen0.text = "用"
        case 1:
            Shen1.text = "用"
        case 2:
            Shen2.text = "用"
        case 3:
            Shen3.text = "用"
        case 4:
            Shen4.text = "用"
        default:
            break;
        }
    }
    
    // 处理日表
    func onInitDayTable(inputJson: Any) -> Void {
        let dayTable: [String] = inputJson as! [String]
        Ri0.text = dayTable[0]
        Ri1.text = dayTable[1]
        Ri2.text = dayTable[2]
        Ri3.text = dayTable[3]
        Ri4.text = dayTable[4]
    }
    
    // 处理变爻表
    func onInitBianYaoTable(inputJson: AnyObject) -> Void {
        let list: [String] = inputJson.object(forKey: "bianYao") as! [String]
        let index: [Int] = inputJson.object(forKey: "bianYaoIndex") as! [Int]
        for i in index {
            switch i {
            case 0:
                BianYao0.text = list[0]
            case 1:
                BianYao1.text = list[1]
            case 2:
                BianYao2.text = list[2]
            case 3:
                BianYao3.text = list[3]
            case 4:
                BianYao4.text = list[4]
            default:
                break;
            }
        }
    }
    
    // 根据日期的天干初始化六神表
    func onGetLiuShen(inputDay: String?) -> Void {
        var list: [String] = ["青龙", "朱雀", "勾陈", "螣蛇", "白虎", "玄武"]
        var index = 0
        if inputDay == "甲" || inputDay == "乙" {
            index = 0
        } else if inputDay == "丙" || inputDay == "丁" {
            index = 1
        } else if inputDay == "戊" {
            index = 2
        } else if inputDay == "己" {
            index = 3
        } else if inputDay == "庚" || inputDay == "辛" {
            index = 4
        } else {
            index = 5
        }
        LiuShou0.text = getVerticalString(inputString: list[(index) % 6])
        LiuShou1.text = getVerticalString(inputString: list[(index + 1) % 6])
        LiuShou2.text = getVerticalString(inputString: list[(index + 2) % 6])
        LiuShou3.text = getVerticalString(inputString: list[(index + 3) % 6])
        LiuShou4.text = getVerticalString(inputString: list[(index + 4) % 6])
        LiuShou5.text = getVerticalString(inputString: list[(index + 5) % 6])
    }
    
    // 根据GuaXiangList初始化卦象
    func onGetGuaXiang() -> Void {
        let list: [UIImage] = [UIImage(named: "g6")!, UIImage(named: "g7")!, UIImage(named: "g8")!, UIImage(named: "g9")!]
        GuaXiang0.image = list[guaXiangList[0]! - 6]
        GuaXiang1.image = list[guaXiangList[1]! - 6]
        GuaXiang2.image = list[guaXiangList[2]! - 6]
        GuaXiang3.image = list[guaXiangList[3]! - 6]
        GuaXiang4.image = list[guaXiangList[4]! - 6]
        GuaXiang5.image = list[guaXiangList[5]! - 6]
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
