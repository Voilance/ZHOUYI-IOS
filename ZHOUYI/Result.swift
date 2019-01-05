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
    // 装卦
    @IBOutlet weak var ZhuangGua0: UIButton!
    @IBOutlet weak var ZhuangGua1: UIButton!
    @IBOutlet weak var ZhuangGua2: UIButton!
    @IBOutlet weak var ZhuangGua3: UIButton!
    @IBOutlet weak var ZhuangGua4: UIButton!
    @IBOutlet weak var ZhuangGua5: UIButton!
    // 变卦
    @IBOutlet weak var BianGua0: UIButton!
    @IBOutlet weak var BianGua1: UIButton!
    @IBOutlet weak var BianGua2: UIButton!
    @IBOutlet weak var BianGua3: UIButton!
    @IBOutlet weak var BianGua4: UIButton!
    @IBOutlet weak var BianGua5: UIButton!
    // 变卦六亲
    @IBOutlet weak var BianGuaLiuQin0: UILabel!
    @IBOutlet weak var BianGuaLiuQin1: UILabel!
    @IBOutlet weak var BianGuaLiuQin2: UILabel!
    @IBOutlet weak var BianGuaLiuQin3: UILabel!
    @IBOutlet weak var BianGuaLiuQin4: UILabel!
    @IBOutlet weak var BianGuaLiuQin5: UILabel!
    // 伏神
    @IBOutlet weak var FuShen0: UIButton!
    @IBOutlet weak var FuShen1: UIButton!
    @IBOutlet weak var FuShen2: UIButton!
    @IBOutlet weak var FuShen3: UIButton!
    @IBOutlet weak var FuShen4: UIButton!
    @IBOutlet weak var FuShen5: UIButton!
    // 伏神六亲
    @IBOutlet weak var FuShenLiuQin0: UILabel!
    @IBOutlet weak var FuShenLiuQin1: UILabel!
    @IBOutlet weak var FuShenLiuQin2: UILabel!
    @IBOutlet weak var FuShenLiuQin3: UILabel!
    @IBOutlet weak var FuShenLiuQin4: UILabel!
    @IBOutlet weak var FuShenLiuQin5: UILabel!
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
    // 右侧变卦列
    @IBOutlet weak var RightBianGua0: UILabel!
    // 本归
    @IBOutlet weak var BenGui0: UILabel!
    // 事由
    @IBOutlet weak var Reason: UILabel!
    // 月
    @IBOutlet weak var Yue: UILabel!
    @IBOutlet weak var Attr0: UILabel!
    @IBOutlet weak var Attr1: UILabel!
    @IBOutlet weak var Attr2: UILabel!
    @IBOutlet weak var Attr3: UILabel!
    @IBOutlet weak var Attr4: UILabel!
    @IBOutlet weak var WuXing0: UILabel!
    @IBOutlet weak var WuXing1: UILabel!
    @IBOutlet weak var WuXing2: UILabel!
    @IBOutlet weak var WuXing3: UILabel!
    @IBOutlet weak var WuXing4: UILabel!
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
    // 装卦数据轮流显示
    @IBAction func onZhuangGuaShowInTurn(_ sender: Any) {
        zhuangGuaDataShowInTurn()
    }
    @IBAction func onZhuangGuaShowInTurn0(_ sender: Any) {
        zhuangGuaDataShowInTurn()
    }
    @IBAction func onZhuangGuaShowInTurn1(_ sender: Any) {
        zhuangGuaDataShowInTurn()
    }
    @IBAction func onZhuangGuaShowInTurn2(_ sender: Any) {
        zhuangGuaDataShowInTurn()
    }
    @IBAction func onZhuangGuaShowInTurn3(_ sender: Any) {
        zhuangGuaDataShowInTurn()
    }
    @IBAction func onZhuangGuaShowInTurn4(_ sender: Any) {
        zhuangGuaDataShowInTurn()
    }
    @IBAction func onZhuangGuaShowInTurn5(_ sender: Any) {
        zhuangGuaDataShowInTurn()
    }
    // 变卦显示全部或部分
    @IBAction func onBianGuaShowAllOrNot(_ sender: Any) {
        bianGuaDataShowAllOrNot()
    }
    @IBAction func onBianGuaShowAllOrNot0(_ sender: Any) {
        bianGuaDataShowAllOrNot()
    }
    @IBAction func onBianGuaShowAllOrNot1(_ sender: Any) {
        bianGuaDataShowAllOrNot()
    }
    @IBAction func onBianGuaShowAllOrNot2(_ sender: Any) {
        bianGuaDataShowAllOrNot()
    }
    @IBAction func onBianGuaShowAllOrNot3(_ sender: Any) {
        bianGuaDataShowAllOrNot()
    }
    @IBAction func onBianGuaShowAllOrNot4(_ sender: Any) {
        bianGuaDataShowAllOrNot()
    }
    @IBAction func onBianGuaShowAllOrNot5(_ sender: Any) {
        bianGuaDataShowAllOrNot()
    }
    // 伏神显示全部或部分
    @IBAction func onFuShenShowAllOrNot(_ sender: Any) {
        fuShenDataShowAllOrNot()
    }
    @IBAction func onFuShenShowAllOrNot0(_ sender: Any) {
        fuShenDataShowAllOrNot()
    }
    @IBAction func onFuShenShowAllOrNot1(_ sender: Any) {
        fuShenDataShowAllOrNot()
    }
    @IBAction func onFuShenShowAllOrNot2(_ sender: Any) {
        fuShenDataShowAllOrNot()
    }
    @IBAction func onFuShenShowAllOrNot3(_ sender: Any) {
        fuShenDataShowAllOrNot()
    }
    @IBAction func onFuShenShowAllOrNot4(_ sender: Any) {
        fuShenDataShowAllOrNot()
    }
    @IBAction func onFuShenShowAllOrNot5(_ sender: Any) {
        fuShenDataShowAllOrNot()
    }
    
    // 起卦日期
    var date: String? = "2019-01-01"
    // 起卦卦象列表
    var guaXiangList: [Int?] = [9, 7, 7, 7, 7, 8]
    // 起卦用神
    var yongShen: String = "世"
    // 起卦原因
    var reason: String = ""
    // 亲表
    var qinTable: [String] = [String]()
    // 是否成功返回数据
    var code: Int = 1
    // 装卦区数据
    var zhuangGuaTianGan: [String] = [String]()
    var zhuangGuaDiZhi: [String] = [String]()
    var zhuangGuaWuXing: [String] = [String]()
    var zhuangGuaL1: [String] = [String]()
    var zhuangGuaL2: [String] = [String]()
    var zhuangGuaKong: [String] = ["", "", "", "", "", ""]
    var zhuangGuaShowIndex: [Int] = [Int]()
    var zhuangGuaTurn: Int = 0
    // 变卦区数据
    var bianGuaTianGan: [String] = [String]()
    var bianGuaDiZhi: [String] = [String]()
    var bianGuaWuXing: [String] = [String]()
    var bianGuaKong: [String] = ["", "", "", "", "", ""]
    var bianGuaShowIndex: [Int] = [Int]()
    var bianGuaLiuQin: [String] = [String]()
    var bianGuaShowAll: Bool = false
    // 伏神区数据
    var fuShenTianGan: [String] = [String]()
    var fuShenDiZhi: [String] = [String]()
    var fuShenWuXing: [String] = [String]()
    var fuShenKong: [String] = ["", "", "", "", "", ""]
    var fuShenShowIndex: [Int] = [Int]()
    var fuShenLiuQin: [String] = [String]()
    var fuShenShowAll: Bool = false
    // 用神对应的六亲的首字
    var sz: String = "世"
    
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
                    // 初始化月表头
                    self.Yue.text = self.getSubCharacterAsString(inputString: month, inputIndex: 1) + "月"
                    // 初始化事由
                    self.Reason.text = self.getVerticalString(inputString: self.reason)
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
        HTTP.POST("http://120.76.128.110:8081/table/item", parameters: guaXiangList, requestSerializer: JSONParameterSerializer()) { response in
            do {
                let responseJson = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as AnyObject
                self.code = responseJson.object(forKey: "code") as! Int
                if self.code == 0 {
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
                        self.onInitBianGuaTable(inputJson: bianGuaTable)
                        self.onInitFuShenTable(inputJson: fuShenTable)
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
        if let index = inputJson.object(forKey: "showIndex") as? [Int] {
            zhuangGuaShowIndex = index
        }
        if let index = inputJson.object(forKey: "kongIndex") as? [Int] {
            for i in index {
                zhuangGuaKong[i] = "空"
            }
        }
        // 处理装卦列
        // 天干
        var str = fuckYouString(inputString: basicData.object(forKey: "heavenly_stems") as! String)
        zhuangGuaTianGan = str.components(separatedBy: ",")
        // 地支
        str = fuckYouString(inputString: basicData.object(forKey: "earthly_branches") as! String)
        zhuangGuaDiZhi = str.components(separatedBy: ",")
        // 五行
        str = fuckYouString(inputString: basicData.object(forKey: "five_elements") as! String)
        zhuangGuaWuXing = str.components(separatedBy: ",")
        // 轮转第二列
        zhuangGuaL1 = inputJson.object(forKey: "column2") as! [String]
        // 轮转第三列
        zhuangGuaL2 = inputJson.object(forKey: "column3") as! [String]
        zhuangGuaDataShowInTurn()
        // 处理六亲列
        str = fuckYouString(inputString: basicData.object(forKey: "six_relatives") as! String)
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
            sz = getSubCharacterAsString(inputString: LiuQinList[ShiIndex], inputIndex: 0)
        } else if yongShen == "用" {
            sz = getSubCharacterAsString(inputString: LiuQinList[YingIndex], inputIndex: 0)
        }
        
        // 处理右侧本归列
        str = basicData.object(forKey: "content") as! String
        BenGui0.text = getVerticalString(inputString: str)
        
        onGetGuaXiang()
    }
    // 装卦区域数据轮流显示
    func zhuangGuaDataShowInTurn() -> Void {
        if code != 0 {
            return
        }
        let AColor: UIColor = UIColor(red: 29/255, green: 27/255, blue: 116/255, alpha: 1)
        let BColor: UIColor = UIColor(red: 33/255, green: 129/255, blue: 53/255, alpha: 1)
        let CColor: UIColor = UIColor(red: 134/255, green: 0, blue: 0, alpha: 1)
        switch zhuangGuaTurn {
        case 0:
            ZhuangGua0.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[0], inputAColor: AColor, inputB: zhuangGuaTianGan[0], inputBColor: BColor, inputC: zhuangGuaWuXing[0], inputCColor: CColor, inputD: zhuangGuaKong[0]), for: .normal)
            ZhuangGua1.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[1], inputAColor: AColor, inputB: zhuangGuaTianGan[0], inputBColor: BColor, inputC: zhuangGuaWuXing[1], inputCColor: CColor, inputD: zhuangGuaKong[1]), for: .normal)
            ZhuangGua2.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[2], inputAColor: AColor, inputB: zhuangGuaTianGan[0], inputBColor: BColor, inputC: zhuangGuaWuXing[2], inputCColor: CColor, inputD: zhuangGuaKong[2]), for: .normal)
            ZhuangGua3.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[3], inputAColor: AColor, inputB: zhuangGuaTianGan[1], inputBColor: BColor, inputC: zhuangGuaWuXing[3], inputCColor: CColor, inputD: zhuangGuaKong[3]), for: .normal)
            ZhuangGua4.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[4], inputAColor: AColor, inputB: zhuangGuaTianGan[1], inputBColor: BColor, inputC: zhuangGuaWuXing[4], inputCColor: CColor, inputD: zhuangGuaKong[4]), for: .normal)
            ZhuangGua5.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[5], inputAColor: AColor, inputB: zhuangGuaTianGan[1], inputBColor: BColor, inputC: zhuangGuaWuXing[5], inputCColor: CColor, inputD: zhuangGuaKong[5]), for: .normal)
            zhuangGuaTurn = 1
            break
        case 1:
            ZhuangGua0.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[0], inputAColor: AColor, inputB: zhuangGuaTianGan[0], inputBColor: BColor, inputC: zhuangGuaL1[0], inputCColor: CColor, inputD: zhuangGuaKong[0]), for: .normal)
            ZhuangGua1.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[1], inputAColor: AColor, inputB: zhuangGuaTianGan[0], inputBColor: BColor, inputC: zhuangGuaL1[1], inputCColor: CColor, inputD: zhuangGuaKong[1]), for: .normal)
            ZhuangGua2.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[2], inputAColor: AColor, inputB: zhuangGuaTianGan[0], inputBColor: BColor, inputC: zhuangGuaL1[2], inputCColor: CColor, inputD: zhuangGuaKong[2]), for: .normal)
            ZhuangGua3.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[3], inputAColor: AColor, inputB: zhuangGuaTianGan[1], inputBColor: BColor, inputC: zhuangGuaL1[3], inputCColor: CColor, inputD: zhuangGuaKong[3]), for: .normal)
            ZhuangGua4.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[4], inputAColor: AColor, inputB: zhuangGuaTianGan[1], inputBColor: BColor, inputC: zhuangGuaL1[4], inputCColor: CColor, inputD: zhuangGuaKong[4]), for: .normal)
            ZhuangGua5.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[5], inputAColor: AColor, inputB: zhuangGuaTianGan[1], inputBColor: BColor, inputC: zhuangGuaL1[5], inputCColor: CColor, inputD: zhuangGuaKong[5]), for: .normal)
            zhuangGuaTurn = 2
            break
        case 2:
            ZhuangGua0.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[0], inputAColor: AColor, inputB: zhuangGuaTianGan[0], inputBColor: BColor, inputC: zhuangGuaL2[0], inputCColor: CColor, inputD: zhuangGuaKong[0]), for: .normal)
            ZhuangGua1.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[1], inputAColor: AColor, inputB: zhuangGuaTianGan[0], inputBColor: BColor, inputC: zhuangGuaL2[1], inputCColor: CColor, inputD: zhuangGuaKong[1]), for: .normal)
            ZhuangGua2.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[2], inputAColor: AColor, inputB: zhuangGuaTianGan[0], inputBColor: BColor, inputC: zhuangGuaL2[2], inputCColor: CColor, inputD: zhuangGuaKong[2]), for: .normal)
            ZhuangGua3.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[3], inputAColor: AColor, inputB: zhuangGuaTianGan[1], inputBColor: BColor, inputC: zhuangGuaL2[3], inputCColor: CColor, inputD: zhuangGuaKong[3]), for: .normal)
            ZhuangGua4.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[4], inputAColor: AColor, inputB: zhuangGuaTianGan[1], inputBColor: BColor, inputC: zhuangGuaL2[4], inputCColor: CColor, inputD: zhuangGuaKong[4]), for: .normal)
            ZhuangGua5.setAttributedTitle(getGuaTableFuWenBen(inputA: zhuangGuaDiZhi[5], inputAColor: AColor, inputB: zhuangGuaTianGan[1], inputBColor: BColor, inputC: zhuangGuaL2[5], inputCColor: CColor, inputD: zhuangGuaKong[5]), for: .normal)
            zhuangGuaTurn = 0
            break
        default:
            break
        }
    }
    
    // 处理变卦区数据
    func onInitBianGuaTable(inputJson: AnyObject) -> Void {
        let basicData = inputJson.object(forKey: "basicData") as AnyObject
        if let index = inputJson.object(forKey: "showIndex") as? [Int] {
            bianGuaShowIndex = index
        }
        if let index = inputJson.object(forKey: "kongIndex") as? [Int] {
            for i in index {
                bianGuaKong[i] = "空"
            }
        }
        // 天干
        var str = fuckYouString(inputString: basicData.object(forKey: "heavenly_stems") as! String)
        bianGuaTianGan = str.components(separatedBy: ",")
        // 地支
        str = fuckYouString(inputString: basicData.object(forKey: "earthly_branches") as! String)
        bianGuaDiZhi = str.components(separatedBy: ",")
        // 五行
        str = fuckYouString(inputString: basicData.object(forKey: "five_elements") as! String)
        bianGuaWuXing = str.components(separatedBy: ",")
        // 六亲
        str = fuckYouString(inputString: basicData.object(forKey: "six_relatives") as! String)
        bianGuaLiuQin = str.components(separatedBy: ",")
        bianGuaDataShowAllOrNot()
        
        // 处理右侧变卦列数据
        str = basicData.object(forKey: "content") as! String
        RightBianGua0.text = getVerticalString(inputString: str)
    }
    // 变卦区数据全部或部分显示
    func bianGuaDataShowAllOrNot() -> Void {
        if code != 0 {
            return
        }
        let AColor: UIColor = UIColor(red: 177/255, green: 83/255, blue: 100/255, alpha: 1)
        let BColor: UIColor = AColor
        let CColor: UIColor = UIColor.black
        if bianGuaShowAll {
            BianGua0.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[0], inputAColor: AColor, inputB: bianGuaTianGan[0], inputBColor: BColor, inputC: bianGuaWuXing[0], inputCColor: CColor, inputD: bianGuaKong[0]), for: .normal)
            BianGua1.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[1], inputAColor: AColor, inputB: bianGuaTianGan[0], inputBColor: BColor, inputC: bianGuaWuXing[1], inputCColor: CColor, inputD: bianGuaKong[1]), for: .normal)
            BianGua2.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[2], inputAColor: AColor, inputB: bianGuaTianGan[0], inputBColor: BColor, inputC: bianGuaWuXing[2], inputCColor: CColor, inputD: bianGuaKong[2]), for: .normal)
            BianGua3.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[3], inputAColor: AColor, inputB: bianGuaTianGan[1], inputBColor: BColor, inputC: bianGuaWuXing[3], inputCColor: CColor, inputD: bianGuaKong[3]), for: .normal)
            BianGua4.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[4], inputAColor: AColor, inputB: bianGuaTianGan[1], inputBColor: BColor, inputC: bianGuaWuXing[4], inputCColor: CColor, inputD: bianGuaKong[4]), for: .normal)
            BianGua5.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[5], inputAColor: AColor, inputB: bianGuaTianGan[1], inputBColor: BColor, inputC: bianGuaWuXing[5], inputCColor: CColor, inputD: bianGuaKong[5]), for: .normal)
            BianGuaLiuQin0.text = getVerticalString(inputString: bianGuaLiuQin[0])
            BianGuaLiuQin1.text = getVerticalString(inputString: bianGuaLiuQin[1])
            BianGuaLiuQin2.text = getVerticalString(inputString: bianGuaLiuQin[2])
            BianGuaLiuQin3.text = getVerticalString(inputString: bianGuaLiuQin[3])
            BianGuaLiuQin4.text = getVerticalString(inputString: bianGuaLiuQin[4])
            BianGuaLiuQin5.text = getVerticalString(inputString: bianGuaLiuQin[5])
        } else {
            BianGua0.setAttributedTitle(nil, for: .normal)
            BianGua1.setAttributedTitle(nil, for: .normal)
            BianGua2.setAttributedTitle(nil, for: .normal)
            BianGua3.setAttributedTitle(nil, for: .normal)
            BianGua4.setAttributedTitle(nil, for: .normal)
            BianGua5.setAttributedTitle(nil, for: .normal)
            BianGuaLiuQin0.text = ""
            BianGuaLiuQin1.text = ""
            BianGuaLiuQin2.text = ""
            BianGuaLiuQin3.text = ""
            BianGuaLiuQin4.text = ""
            BianGuaLiuQin5.text = ""
            for i in bianGuaShowIndex {
                switch (i) {
                case 0:
                    BianGua0.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[0], inputAColor: AColor, inputB: bianGuaTianGan[0], inputBColor: BColor, inputC: bianGuaWuXing[0], inputCColor: CColor, inputD: bianGuaKong[0]), for: .normal)
                    BianGuaLiuQin0.text = getVerticalString(inputString: bianGuaLiuQin[0])
                    break;
                case 1:
                    BianGua1.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[1], inputAColor: AColor, inputB: bianGuaTianGan[0], inputBColor: BColor, inputC: bianGuaWuXing[1], inputCColor: CColor, inputD: bianGuaKong[1]), for: .normal)
                    BianGuaLiuQin1.text = getVerticalString(inputString: bianGuaLiuQin[1])
                    break;
                case 2:
                    BianGua2.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[2], inputAColor: AColor, inputB: bianGuaTianGan[0], inputBColor: BColor, inputC: bianGuaWuXing[2], inputCColor: CColor, inputD: bianGuaKong[2]), for: .normal)
                    BianGuaLiuQin2.text = getVerticalString(inputString: bianGuaLiuQin[2])

                    break;
                case 3:
                    BianGua3.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[3], inputAColor: AColor, inputB: bianGuaTianGan[1], inputBColor: BColor, inputC: bianGuaWuXing[3], inputCColor: CColor, inputD: bianGuaKong[3]), for: .normal)
                    BianGuaLiuQin3.text = getVerticalString(inputString: bianGuaLiuQin[3])
                    break;
                case 4:
                    BianGua4.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[4], inputAColor: AColor, inputB: bianGuaTianGan[1], inputBColor: BColor, inputC: bianGuaWuXing[4], inputCColor: CColor, inputD: bianGuaKong[4]), for: .normal)
                    BianGuaLiuQin4.text = getVerticalString(inputString: bianGuaLiuQin[4])
                    break;
                case 5:
                    BianGua5.setAttributedTitle(getGuaTableFuWenBen(inputA: bianGuaDiZhi[5], inputAColor: AColor, inputB: bianGuaTianGan[1], inputBColor: BColor, inputC: bianGuaWuXing[5], inputCColor: CColor, inputD: bianGuaKong[5]), for: .normal)
                    BianGuaLiuQin5.text = getVerticalString(inputString: bianGuaLiuQin[5])
                    break;
                default:
                    break;
                }
            }
        }
        bianGuaShowAll = !bianGuaShowAll
    }
    
    // 处理伏神区数据
    func onInitFuShenTable(inputJson: AnyObject) -> Void {
        let basicData = inputJson.object(forKey: "basicData") as AnyObject
        if let index = inputJson.object(forKey: "showIndex") as? [Int] {
            fuShenShowIndex = index
        }
        if let index = inputJson.object(forKey: "kongIndex") as? [Int] {
            for i in index {
                fuShenKong[i] = "空"
            }
        }
        // 天干
        var str = fuckYouString(inputString: basicData.object(forKey: "heavenly_stems") as! String)
        fuShenTianGan = str.components(separatedBy: ",")
        // 地支
        str = fuckYouString(inputString: basicData.object(forKey: "earthly_branches") as! String)
        fuShenDiZhi = str.components(separatedBy: ",")
        // 五行
        str = fuckYouString(inputString: basicData.object(forKey: "five_elements") as! String)
        fuShenWuXing = str.components(separatedBy: ",")
        // 六亲
        str = fuckYouString(inputString: basicData.object(forKey: "six_relatives") as! String)
        fuShenLiuQin = str.components(separatedBy: ",")
        fuShenDataShowAllOrNot()
    }
    // 伏神区数据全部或部分显示
    func fuShenDataShowAllOrNot() -> Void {
        if code != 0 {
            return
        }
        let AColor: UIColor = UIColor(red: 38/255, green: 111/255, blue: 36/255, alpha: 1)
        let BColor: UIColor = AColor
        let CColor: UIColor = UIColor(red: 183/255, green: 75/255, blue: 78/255, alpha: 1)
        if fuShenShowAll {
            FuShen0.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[0], inputAColor: AColor, inputB: fuShenTianGan[0], inputBColor: BColor, inputC: fuShenWuXing[0], inputCColor: CColor, inputD: fuShenKong[0]), for: .normal)
            FuShen1.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[1], inputAColor: AColor, inputB: fuShenTianGan[0], inputBColor: BColor, inputC: fuShenWuXing[1], inputCColor: CColor, inputD: fuShenKong[1]), for: .normal)
            FuShen2.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[2], inputAColor: AColor, inputB: fuShenTianGan[0], inputBColor: BColor, inputC: fuShenWuXing[2], inputCColor: CColor, inputD: fuShenKong[2]), for: .normal)
            FuShen3.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[3], inputAColor: AColor, inputB: fuShenTianGan[1], inputBColor: BColor, inputC: fuShenWuXing[3], inputCColor: CColor, inputD: fuShenKong[3]), for: .normal)
            FuShen4.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[4], inputAColor: AColor, inputB: fuShenTianGan[1], inputBColor: BColor, inputC: fuShenWuXing[4], inputCColor: CColor, inputD: fuShenKong[4]), for: .normal)
            FuShen5.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[5], inputAColor: AColor, inputB: fuShenTianGan[1], inputBColor: BColor, inputC: fuShenWuXing[5], inputCColor: CColor, inputD: fuShenKong[5]), for: .normal)
            FuShenLiuQin0.text = getVerticalString(inputString: fuShenLiuQin[0])
            FuShenLiuQin1.text = getVerticalString(inputString: fuShenLiuQin[1])
            FuShenLiuQin2.text = getVerticalString(inputString: fuShenLiuQin[2])
            FuShenLiuQin3.text = getVerticalString(inputString: fuShenLiuQin[3])
            FuShenLiuQin4.text = getVerticalString(inputString: fuShenLiuQin[4])
            FuShenLiuQin5.text = getVerticalString(inputString: fuShenLiuQin[5])
        } else {
            FuShen0.setAttributedTitle(nil, for: .normal)
            FuShen1.setAttributedTitle(nil, for: .normal)
            FuShen2.setAttributedTitle(nil, for: .normal)
            FuShen3.setAttributedTitle(nil, for: .normal)
            FuShen4.setAttributedTitle(nil, for: .normal)
            FuShen5.setAttributedTitle(nil, for: .normal)
            FuShenLiuQin0.text = ""
            FuShenLiuQin1.text = ""
            FuShenLiuQin2.text = ""
            FuShenLiuQin3.text = ""
            FuShenLiuQin4.text = ""
            FuShenLiuQin5.text = ""
            for i in fuShenShowIndex {
                switch (i) {
                case 0:
                    FuShen0.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[0], inputAColor: AColor, inputB: fuShenTianGan[0], inputBColor: BColor, inputC: fuShenWuXing[0], inputCColor: CColor, inputD: fuShenKong[0]), for: .normal)
                    FuShenLiuQin0.text = getVerticalString(inputString: fuShenLiuQin[0])
                    break;
                case 1:
                    FuShen1.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[1], inputAColor: AColor, inputB: fuShenTianGan[0], inputBColor: BColor, inputC: fuShenWuXing[1], inputCColor: CColor, inputD: fuShenKong[1]), for: .normal)
                    FuShenLiuQin1.text = getVerticalString(inputString: fuShenLiuQin[1])
                    break;
                case 2:
                    FuShen2.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[2], inputAColor: AColor, inputB: fuShenTianGan[0], inputBColor: BColor, inputC: fuShenWuXing[2], inputCColor: CColor, inputD: fuShenKong[2]), for: .normal)
                    FuShenLiuQin2.text = getVerticalString(inputString: fuShenLiuQin[2])
                    break;
                case 3:
                    FuShen3.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[3], inputAColor: AColor, inputB: fuShenTianGan[1], inputBColor: BColor, inputC: fuShenWuXing[3], inputCColor: CColor, inputD: fuShenKong[3]), for: .normal)
                    FuShenLiuQin3.text = getVerticalString(inputString: fuShenLiuQin[3])
                    break;
                case 4:
                    FuShen4.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[4], inputAColor: AColor, inputB: fuShenTianGan[1], inputBColor: BColor, inputC: fuShenWuXing[4], inputCColor: CColor, inputD: fuShenKong[4]), for: .normal)
                    FuShenLiuQin4.text = getVerticalString(inputString: fuShenLiuQin[4])
                    break;
                case 5:
                    FuShen5.setAttributedTitle(getGuaTableFuWenBen(inputA: fuShenDiZhi[5], inputAColor: AColor, inputB: fuShenTianGan[1], inputBColor: BColor, inputC: fuShenWuXing[5], inputCColor: CColor, inputD: fuShenKong[5]), for: .normal)
                    FuShenLiuQin5.text = getVerticalString(inputString: fuShenLiuQin[5])
                    break;
                default:
                    break;
                }
            }
        }
        fuShenShowAll = !fuShenShowAll
    }
    
    func fuckYouString(inputString: String) -> String {
        return inputString.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "")
    }
    
    // 处理卦表的富文本
    func getGuaTableFuWenBen(inputA: String, inputAColor: UIColor, inputB: String, inputBColor: UIColor, inputC: String, inputCColor: UIColor, inputD: String) -> NSMutableAttributedString {
        let str = NSMutableAttributedString()
        let a = NSAttributedString.init(string: inputA + " ", attributes: [NSAttributedString.Key.foregroundColor : inputAColor])
        let b = NSAttributedString.init(string: inputB + "\n", attributes: [NSAttributedString.Key.foregroundColor : inputBColor])
        let c = NSAttributedString.init(string: inputC + " ", attributes: [NSAttributedString.Key.foregroundColor : inputCColor])
        let d = NSAttributedString.init(string: inputD, attributes: [NSAttributedString.Key.foregroundColor : UIColor.white, NSAttributedString.Key.backgroundColor : UIColor.gray])
        str.append(a)
        str.append(b)
        str.append(c)
        str.append(d)
        return str
    }
    
    // 处理月表
    func onInitMonthTable(inputJson: AnyObject) -> Void {
        let attr:[String] = inputJson.object(forKey: "attr") as! [String]
        let wuXing:[String] = inputJson.object(forKey: "wuxing") as! [String]
        Attr0.text = attr[0]
        Attr1.text = attr[1]
        Attr2.text = attr[2]
        Attr3.text = attr[3]
        Attr4.text = attr[4]
        WuXing0.text = wuXing[0]
        WuXing1.text = wuXing[1]
        WuXing2.text = wuXing[2]
        WuXing3.text = wuXing[3]
        WuXing4.text = wuXing[4]
    }
    
    // 处理亲表
    func onInitQingTable(inputJson: Any) -> Void {
        qinTable = inputJson as![String]
        Qing0.text = qinTable[0]
        Qing1.text = qinTable[1]
        Qing2.text = qinTable[2]
        Qing3.text = qinTable[3]
        Qing4.text = qinTable[4]
        
        if yongShen == "官鬼" || yongShen == "父母" || yongShen == "兄弟" || yongShen == "子孙" || yongShen == "妻财" {
            sz = getSubCharacterAsString(inputString: yongShen, inputIndex: 0)
        }
    }
    
    // 处理神表
    func onInitShenTable() -> Void {
        var index = 0
        for i in 0 ..< qinTable.count {
            if qinTable[i] == sz {
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
