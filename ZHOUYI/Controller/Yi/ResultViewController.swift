//
//  ResultViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/3/3.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class ResultViewController: UIViewController {
    
    // 控件
    // 上部分表
    // 六神
    @IBOutlet weak var LiuShen0: UILabel!
    @IBOutlet weak var LiuShen1: UILabel!
    @IBOutlet weak var LiuShen2: UILabel!
    @IBOutlet weak var LiuShen3: UILabel!
    @IBOutlet weak var LiuShen4: UILabel!
    @IBOutlet weak var LiuShen5: UILabel!
    var LiuShenList: [UILabel] = []
    // 六亲
    @IBOutlet weak var LiuQin0: UILabel!
    @IBOutlet weak var LiuQin1: UILabel!
    @IBOutlet weak var LiuQin2: UILabel!
    @IBOutlet weak var LiuQin3: UILabel!
    @IBOutlet weak var LiuQin4: UILabel!
    @IBOutlet weak var LiuQin5: UILabel!
    var LiuQinList: [UILabel] = []
    // 本卦
    @IBOutlet weak var BenGua0: UIImageView!
    @IBOutlet weak var BenGua1: UIImageView!
    @IBOutlet weak var BenGua2: UIImageView!
    @IBOutlet weak var BenGua3: UIImageView!
    @IBOutlet weak var BenGua4: UIImageView!
    @IBOutlet weak var BenGua5: UIImageView!
    var BenGuaList: [UIImageView] = []
    // 装卦
    @IBOutlet weak var ZgHeader: UILabel!
    @IBOutlet weak var ZgTianGan0: UILabel!
    @IBOutlet weak var ZgTianGan1: UILabel!
    var ZgTianGanList: [UILabel] = []
    @IBOutlet weak var ZgDiZhi0: UIButton!
    @IBOutlet weak var ZgDiZhi1: UIButton!
    @IBOutlet weak var ZgDiZhi2: UIButton!
    @IBOutlet weak var ZgDiZhi3: UIButton!
    @IBOutlet weak var ZgDiZhi4: UIButton!
    @IBOutlet weak var ZgDiZhi5: UIButton!
    var ZgDiZhiList: [UIButton] = []
    var ZgList: [[String]] = [] // 0:地支, 1:五行, 2:轮转1列, 3:轮转2列
    var ZgTurn: Int = 1 // 显示轮转
    
    // 下部分表
    // 月表
    @IBOutlet weak var TheMonth: UILabel!
    @IBOutlet weak var Month0: UILabel!
    @IBOutlet weak var Month1: UILabel!
    @IBOutlet weak var Month2: UILabel!
    @IBOutlet weak var Month3: UILabel!
    @IBOutlet weak var Month4: UILabel!
    var MonthList: [UILabel] = []
    // 亲表
    @IBOutlet weak var Qin0: UILabel!
    @IBOutlet weak var Qin1: UILabel!
    @IBOutlet weak var Qin2: UILabel!
    @IBOutlet weak var Qin3: UILabel!
    @IBOutlet weak var Qin4: UILabel!
    var QinList: [UILabel] = []
    // 日表
    @IBOutlet weak var Day0: UILabel!
    @IBOutlet weak var Day1: UILabel!
    @IBOutlet weak var Day2: UILabel!
    @IBOutlet weak var Day3: UILabel!
    @IBOutlet weak var Day4: UILabel!
    var DayList: [UILabel] = []
    // 变表
    @IBOutlet weak var Bian0: UILabel!
    @IBOutlet weak var Bian1: UILabel!
    @IBOutlet weak var Bian2: UILabel!
    @IBOutlet weak var Bian3: UILabel!
    @IBOutlet weak var Bian4: UILabel!
    var BianList: [UILabel] = []
    
    // 控件功能
    // 装卦轮转
    @IBAction func ClickZgButton0(_ sender: Any) {
        turnZhuangGua()
    }
    @IBAction func ClickZgButton1(_ sender: Any) {
        turnZhuangGua()
    }
    @IBAction func ClickZgButton2(_ sender: Any) {
        turnZhuangGua()
    }
    @IBAction func ClickZgButton3(_ sender: Any) {
        turnZhuangGua()
    }
    @IBAction func ClickZgButton4(_ sender: Any) {
        turnZhuangGua()
    }
    @IBAction func ClickZgButton5(_ sender: Any) {
        turnZhuangGua()
    }
    
    var gua: Gua?
    var resultCode: Int? = -1
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        getResult()
        // Do any additional setup after loading the view.
    }
    
    func initView() {
        LiuShenList.append(LiuShen0)
        LiuShenList.append(LiuShen1)
        LiuShenList.append(LiuShen2)
        LiuShenList.append(LiuShen3)
        LiuShenList.append(LiuShen4)
        LiuShenList.append(LiuShen5)
        
        LiuQinList.append(LiuQin0)
        LiuQinList.append(LiuQin1)
        LiuQinList.append(LiuQin2)
        LiuQinList.append(LiuQin3)
        LiuQinList.append(LiuQin4)
        LiuQinList.append(LiuQin5)
        
        BenGuaList.append(BenGua0)
        BenGuaList.append(BenGua1)
        BenGuaList.append(BenGua2)
        BenGuaList.append(BenGua3)
        BenGuaList.append(BenGua4)
        BenGuaList.append(BenGua5)
        
        ZgTianGanList.append(ZgTianGan0)
        ZgTianGanList.append(ZgTianGan1)
        ZgDiZhiList.append(ZgDiZhi0)
        ZgDiZhiList.append(ZgDiZhi1)
        ZgDiZhiList.append(ZgDiZhi2)
        ZgDiZhiList.append(ZgDiZhi3)
        ZgDiZhiList.append(ZgDiZhi4)
        ZgDiZhiList.append(ZgDiZhi5)
        
        MonthList.append(Month0)
        MonthList.append(Month1)
        MonthList.append(Month2)
        MonthList.append(Month3)
        MonthList.append(Month4)
        
        QinList.append(Qin0)
        QinList.append(Qin1)
        QinList.append(Qin2)
        QinList.append(Qin3)
        QinList.append(Qin4)
        
        DayList.append(Day0)
        DayList.append(Day1)
        DayList.append(Day2)
        DayList.append(Day3)
        DayList.append(Day4)
        
        BianList.append(Bian0)
        BianList.append(Bian1)
        BianList.append(Bian2)
        BianList.append(Bian3)
        BianList.append(Bian4)
    }
    
    func convertDate() {
        let reqJson = ["time": gua?.date]
        HTTP.POST(Api.ConvertDateUrl, parameters: reqJson, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let year = respJson.object(forKey: "year") as? String
                let month = respJson.object(forKey: "month") as? String
                let day = respJson.object(forKey: "day") as? String
                DispatchQueue.main.async {
                    self.setLiuShen(d: day?.first)
                }
            } catch {
                print("Convert Date Error")
                print(error)
            }
        }
    }
    
    func getResult() {
        HTTP.POST(Api.GetResult, parameters: gua?.guaXiang, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                self.resultCode = respJson.object(forKey: "code") as? Int
                if self.resultCode == 0 {
                    self.convertDate()
                    let data = respJson.object(forKey: "data") as AnyObject
                    DispatchQueue.main.async {
                        self.setZhuangGua(json: data.object(forKey: "zhuangGuaTable") as AnyObject)
                        self.setBianGua(json: data.object(forKey: "bianGuaTable") as AnyObject)
                        self.setFuShen(json: data.object(forKey: "fuShenTable") as AnyObject)
                        self.setMonthTable(json: data.object(forKey: "monthTable") as AnyObject)
                        self.setQinTable(json: data.object(forKey: "qingTable") as AnyObject)
                        self.setDayTable(json: data.object(forKey: "dayTable") as AnyObject)
                        self.setBianTable(json: data.object(forKey: "bianYaoTable") as AnyObject)
                    }
                }
            } catch {
                print("Get Result Error")
                print(error)
            }
        }
    }
    
    // 填充六神表内容
    func setLiuShen(d: Character?) {
        let list: [String] = ["青\n龙", "朱\n雀", "勾\n陈", "螣\n蛇", "白\n虎", "玄\n武"]
        var offset: Int = 0
        switch d {
        case "甲", "乙":
            offset = 0
        case "丙", "丁":
            offset = 1
        case "戊":
            offset = 2
        case "己":
            offset = 3
        case "庚", "辛":
            offset = 4
        default:
            offset = 5
        }
        for i in 0..<6 {
            LiuShenList[i].attributedText = getNSAttributedString(inputString: [list[(i + offset) % 6]], inputColor: [.blue])
        }
    }
    
    // 计算装卦、变卦、伏神的表头
    func getGuaHeader(guaMing: String, guaCi: String) -> String? {
        switch guaMing {
        case "天地否", "水泽节", "山火贲", "雷地豫", "火山旅", "地雷复", "地天泰", "泽水困":
            return "六合"
        default:
            break
        }
        switch guaCi {
        case "归魂卦":
            return "归魂"
        case "游魂卦":
            return "游魂"
        case "本宫卦":
            return "六冲"
        default:
            break
        }
        return nil
    }
    
    // 填充装卦内容，包括六亲、本卦
    func setZhuangGua(json: AnyObject) {
        let basicData = json.object(forKey: "basicData") as AnyObject
        self.setLiuQin(lq: basicData.object(forKey: "six_relatives") as! String)
        self.setBenGua(sy: basicData.object(forKey:"shi_ying") as! String)
        // 装卦头
        if let header = getGuaHeader(guaMing: basicData.object(forKey: "content") as! String, guaCi: basicData.object(forKey: "times") as! String) {
            ZgHeader.text = header
        }
        // 天干
        let tgList = fu_kString(str: basicData.object(forKey: "heavenly_stems") as! String)
        ZgTianGanList[0].text = tgList[0]
        ZgTianGanList[1].text = tgList[1]
        // 地支、五行、轮转1列、轮转2列
        let List0 = fu_kString(str: basicData.object(forKey: "earthly_branches") as! String)
        let List1 = fu_kString(str: basicData.object(forKey: "five_elements") as! String)
        let List2 = json.object(forKey: "column2") as! [String]
        let List3 = json.object(forKey: "column3") as! [String]
        ZgList.append(List0)
        ZgList.append(List1)
        ZgList.append(List2)
        ZgList.append(List3)
        turnZhuangGua()
    }
    
    func turnZhuangGua() {
        if (self.resultCode != 0) {
            return
        }
        for i in 0..<6 {
            ZgDiZhiList[i].setAttributedTitle(getNSAttributedString(inputString: [ZgList[0][i] + ZgList[ZgTurn][i]], inputColor: [.blue]), for: .normal)
        }
        self.ZgTurn = self.ZgTurn == 3 ? 1 : self.ZgTurn + 1
    }
    
    func setBianGua(json: AnyObject) { // 包括六冲2
        
    }
    
    func setFuShen(json: AnyObject) { // 包括伏神
        
    }
    
    // 填充六亲内容
    func setLiuQin(lq: String) {
        let list = fu_kString(str: lq)
        for i in 0..<6 {
            LiuQinList[i].attributedText = getNSAttributedString(inputString: [list[i]], inputColor: [.blue])
        }
    }
    
    // 设置本卦图片
    func setBenGua(sy: String) {
        let SYList = fu_kString(str: sy)
        let SIndex = SYList.firstIndex(of: "世")
        let YIndex = SYList.firstIndex(of: "应")
        let GList: [UIImage] = [UIImage(named: "G6")!, UIImage(named: "G7")!, UIImage(named: "G8")!, UIImage(named: "G9")!, UIImage(named: "GS6")!, UIImage(named: "GS7")!, UIImage(named: "GS8")!, UIImage(named: "GS9")!, UIImage(named: "GY6")!, UIImage(named: "GY7")!, UIImage(named: "GY8")!, UIImage(named: "GY9")!]
//        gua?.guaXiang?[SIndex ?? 0] += 4
//        gua?.guaXiang?[YIndex ?? 0] += 8
        for i in 0..<6 {
            BenGuaList[i].image = GList[(gua?.guaXiang?[i])! - 6]
        }
        BenGuaList[SIndex ?? 0].image = GList[((gua?.guaXiang?[SIndex ?? 0])! - 2)]
        BenGuaList[YIndex ?? 0].image = GList[((gua?.guaXiang?[YIndex ?? 0])! + 2)]
    }
    
    // 填充月表内容
    func setMonthTable(json: AnyObject) {
        let attr: [String] = json.object(forKey: "attr") as! [String]
        let wx: [String] = json.object(forKey: "wuxing") as! [String]
        for i in 0..<5 {
            MonthList[i].attributedText = getNSAttributedString(inputString: [attr[i], wx[i]], inputColor: [.blue, .blue])
        }
    }
    
    // 填充亲表内容
    func setQinTable(json: AnyObject) {
        let list = json as! [String]
        for i in 0..<5 {
            QinList[i].attributedText = getNSAttributedString(inputString: [list[i]], inputColor: [.blue])
        }
    }
    
    // 填充日表内容
    func setDayTable(json: AnyObject) {
        let list = json as! [String]
        for i in 0..<5 {
            DayList[i].attributedText = getNSAttributedString(inputString: [list[i]], inputColor: [.blue])
        }
    }
    
    // 填充变表内容
    func setBianTable(json: AnyObject) {
        let list = json.object(forKey: "bianYao") as! [String]
        for i in 0..<5 {
            BianList[i].attributedText = getNSAttributedString(inputString: [list[i]], inputColor: [.blue])
            
        }
    }
    
    // 获取富文本
    func getNSAttributedString(inputString: [String], inputColor: [UIColor]) -> NSMutableAttributedString {
        let count = inputString.count
        let str = NSMutableAttributedString()
        for i in 0..<count {
            str.append(.init(string: inputString[i], attributes: [NSMutableAttributedString.Key.foregroundColor: inputColor[i]]))
        }
        return str
    }
    
    func fu_kString(str: String) -> [String] {
        return str.replacingOccurrences(of: "\"", with: "").replacingOccurrences(of: "[", with: "").replacingOccurrences(of: "]", with: "").components(separatedBy: ",")
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
