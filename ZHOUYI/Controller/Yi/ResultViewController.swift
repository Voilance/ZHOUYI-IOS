//
//  ResultViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/3/3.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class ResultViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    // 控件
    // 上部分表
    // 六神LiuShen
    @IBOutlet weak var LiuShen0: UILabel!
    @IBOutlet weak var LiuShen1: UILabel!
    @IBOutlet weak var LiuShen2: UILabel!
    @IBOutlet weak var LiuShen3: UILabel!
    @IBOutlet weak var LiuShen4: UILabel!
    @IBOutlet weak var LiuShen5: UILabel!
    var LiuShenList: [UILabel] = []
    // 六亲LiuQin
    @IBOutlet weak var LiuQin0: UILabel!
    @IBOutlet weak var LiuQin1: UILabel!
    @IBOutlet weak var LiuQin2: UILabel!
    @IBOutlet weak var LiuQin3: UILabel!
    @IBOutlet weak var LiuQin4: UILabel!
    @IBOutlet weak var LiuQin5: UILabel!
    var LiuQinList: [UILabel] = []
    // 本卦BenGua
    @IBOutlet weak var BenGua0: UIImageView!
    @IBOutlet weak var BenGua1: UIImageView!
    @IBOutlet weak var BenGua2: UIImageView!
    @IBOutlet weak var BenGua3: UIImageView!
    @IBOutlet weak var BenGua4: UIImageView!
    @IBOutlet weak var BenGua5: UIImageView!
    var BenGuaList: [UIImageView] = []
    // 装卦Zg
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
    // 变卦Bg
    @IBOutlet weak var BgHeader: UILabel!
    @IBOutlet weak var BgTianGan0: UILabel!
    @IBOutlet weak var BgTianGan1: UILabel!
    var BgTianGanList: [UILabel] = []
    @IBOutlet weak var BgHuiKe0: UIButton!
    @IBOutlet weak var BgHuiKe1: UIButton!
    @IBOutlet weak var BgHuiKe2: UIButton!
    @IBOutlet weak var BgHuiKe3: UIButton!
    @IBOutlet weak var BgHuiKe4: UIButton!
    @IBOutlet weak var BgHuiKe5: UIButton!
    var BgHuiKeList: [UIButton] = []
    @IBOutlet weak var BgDiZhi0: UIButton!
    @IBOutlet weak var BgDiZhi1: UIButton!
    @IBOutlet weak var BgDiZhi2: UIButton!
    @IBOutlet weak var BgDiZhi3: UIButton!
    @IBOutlet weak var BgDiZhi4: UIButton!
    @IBOutlet weak var BgDiZhi5: UIButton!
    var BgDiZhiList: [UIButton] = []
    var BgList: [[String]] = [] // 0:地支, 1:五行, 2:六亲
    @IBOutlet weak var BgLiuQin0: UIButton!
    @IBOutlet weak var BgLiuQin1: UIButton!
    @IBOutlet weak var BgLiuQin2: UIButton!
    @IBOutlet weak var BgLiuQin3: UIButton!
    @IBOutlet weak var BgLiuQin4: UIButton!
    @IBOutlet weak var BgLiuQin5: UIButton!
    var BgLiuQinList: [UIButton] = []
    var BgTurn: Bool = false
    var BgShow: [Int] = []
    // 伏神Fs
    @IBOutlet weak var FsHeader: UILabel!
    @IBOutlet weak var FsTianGan0: UILabel!
    @IBOutlet weak var FsTianGan1: UILabel!
    var FsTianGanList: [UILabel] = []
    @IBOutlet weak var FsDiZhi0: UIButton!
    @IBOutlet weak var FsDiZhi1: UIButton!
    @IBOutlet weak var FsDiZhi2: UIButton!
    @IBOutlet weak var FsDiZhi3: UIButton!
    @IBOutlet weak var FsDiZhi4: UIButton!
    @IBOutlet weak var FsDiZhi5: UIButton!
    var FsDiZhiList: [UIButton] = []
    var FsList: [[String]] = [] // 0:地支, 1:五行, 2:六亲
    @IBOutlet weak var FsLiuQin0: UIButton!
    @IBOutlet weak var FsLiuQin1: UIButton!
    @IBOutlet weak var FsLiuQin2: UIButton!
    @IBOutlet weak var FsLiuQin3: UIButton!
    @IBOutlet weak var FsLiuQin4: UIButton!
    @IBOutlet weak var FsLiuQin5: UIButton!
    var FsLiuQinList: [UIButton] = []
    var FsTurn: Bool = false
    var FsShow: [Int] = []
    // 时间
    @IBOutlet weak var Year: UILabel!
    @IBOutlet weak var Month: UILabel!
    @IBOutlet weak var Day: UILabel!
    @IBOutlet weak var Hour: UILabel!
    
    // 下部分表
    // 月表Month
    @IBOutlet weak var TheMonth: UILabel!
    @IBOutlet weak var Month0: UILabel!
    @IBOutlet weak var Month1: UILabel!
    @IBOutlet weak var Month2: UILabel!
    @IBOutlet weak var Month3: UILabel!
    @IBOutlet weak var Month4: UILabel!
    var MonthList: [UILabel] = []
    // 亲表Qin
    @IBOutlet weak var Qin0: UILabel!
    @IBOutlet weak var Qin1: UILabel!
    @IBOutlet weak var Qin2: UILabel!
    @IBOutlet weak var Qin3: UILabel!
    @IBOutlet weak var Qin4: UILabel!
    var QinList: [UILabel] = []
    // 日表Day
    @IBOutlet weak var Day0: UILabel!
    @IBOutlet weak var Day1: UILabel!
    @IBOutlet weak var Day2: UILabel!
    @IBOutlet weak var Day3: UILabel!
    @IBOutlet weak var Day4: UILabel!
    var DayList: [UILabel] = []
    // 变表Bian
    @IBOutlet weak var Bian0: UILabel!
    @IBOutlet weak var Bian1: UILabel!
    @IBOutlet weak var Bian2: UILabel!
    @IBOutlet weak var Bian3: UILabel!
    @IBOutlet weak var Bian4: UILabel!
    var BianList: [UILabel] = []
    // 右下角Scroll
    @IBOutlet weak var Page: UIPageControl!
    @IBOutlet weak var Scroll: UIScrollView!
    @IBOutlet weak var Stack: UIStackView!
    @IBOutlet weak var TheReason: UILabel!
    @IBOutlet weak var TheNote: UILabel!
    // 卜卦事由
    @IBOutlet weak var TheDate: UILabel!
    @IBOutlet weak var TheYongShen: UILabel!
    @IBOutlet weak var TheName: UILabel!
    // 日冲月破RY
    @IBOutlet weak var RYKong: UILabel!  // 空
    @IBOutlet weak var RYShen: UILabel!  // 身
    @IBOutlet weak var RiChong: UILabel! // 日冲
    @IBOutlet weak var YuePo: UILabel!   // 月破
    @IBOutlet weak var RYShou: UILabel!  // 首
    @IBOutlet weak var RYBian: UILabel!  // 变
    @IBOutlet weak var RYHu: UILabel!    // 互
    @IBOutlet weak var RYBen: UILabel!   // 本
    // 占
    // 标题Title
    @IBOutlet weak var ZhanTitle0: UILabel!
    @IBOutlet weak var ZhanTitle1: UILabel!
    @IBOutlet weak var ZhanTitle2: UILabel!
    @IBOutlet weak var ZhanTitle3: UILabel!
    @IBOutlet weak var ZhanTitle4: UILabel!
    @IBOutlet weak var ZhanTitle5: UILabel!
    @IBOutlet weak var ZhanTitle6: UILabel!
    @IBOutlet weak var ZhanTitle7: UILabel!
    @IBOutlet weak var ZhanTitle8: UILabel!
    @IBOutlet weak var ZhanTitle9: UILabel!
    @IBOutlet weak var ZhanTitle10: UILabel!
    @IBOutlet weak var ZhanTitle11: UILabel!
    @IBOutlet weak var ZhanTitle12: UILabel!
    @IBOutlet weak var ZhanTitle13: UILabel!
    @IBOutlet weak var ZhanTitle14: UILabel!
    @IBOutlet weak var ZhanTitle15: UILabel!
    var ZhanTitleList: [UILabel] = []
    // 干支GZ
    @IBOutlet weak var ZhanGZ0: UILabel!
    @IBOutlet weak var ZhanGZ1: UILabel!
    @IBOutlet weak var ZhanGZ2: UILabel!
    @IBOutlet weak var ZhanGZ3: UILabel!
    @IBOutlet weak var ZhanGZ4: UILabel!
    @IBOutlet weak var ZhanGZ5: UILabel!
    @IBOutlet weak var ZhanGZ6: UILabel!
    @IBOutlet weak var ZhanGZ7: UILabel!
    @IBOutlet weak var ZhanGZ8: UILabel!
    @IBOutlet weak var ZhanGZ9: UILabel!
    @IBOutlet weak var ZhanGZ10: UILabel!
    @IBOutlet weak var ZhanGZ11: UILabel!
    @IBOutlet weak var ZhanGZ12: UILabel!
    @IBOutlet weak var ZhanGZ13: UILabel!
    @IBOutlet weak var ZhanGZ14: UILabel!
    @IBOutlet weak var ZhanGZ15: UILabel!
    var ZhanGZList: [UILabel] = []
    @IBOutlet weak var ZhanButton: UIButton!
    let ZhanList: [String] = ["常用神煞", "占感情", "占疾病", "占官禄", "占求财", "占胎孕", "占官非"]
    
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
    // 变卦轮转
    @IBAction func ClickBgButton00(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton01(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton02(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton03(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton04(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton05(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton10(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton11(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton12(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton13(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton14(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton15(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton20(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton21(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton22(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton23(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton24(_ sender: Any) {
        turnBianGua()
    }
    @IBAction func ClickBgButton25(_ sender: Any) {
        turnBianGua()
    }
    // 伏神轮转
    @IBAction func ClickFsButton00(_ sender: Any) {
        turnFuShen()
    }
    @IBAction func ClickFsButton01(_ sender: Any) {
        turnFuShen()
    }
    @IBAction func ClickFsButton02(_ sender: Any) {
        turnFuShen()
    }
    @IBAction func ClickFsButton03(_ sender: Any) {
        turnFuShen()
    }
    @IBAction func ClickFsButton04(_ sender: Any) {
        turnFuShen()
    }
    @IBAction func ClickFsButton05(_ sender: Any) {
        turnFuShen()
    }
    @IBAction func ClickFsButton10(_ sender: Any) {
        turnFuShen()
    }
    @IBAction func ClickFsButton11(_ sender: Any) {
        turnFuShen()
    }
    @IBAction func ClickFsButton12(_ sender: Any) {
        turnFuShen()
    }
    @IBAction func ClickFsButton13(_ sender: Any) {
        turnFuShen()
    }
    @IBAction func ClickFsButton14(_ sender: Any) {
        turnFuShen()
    }
    @IBAction func ClickFsButton15(_ sender: Any) {
        turnFuShen()
    }
    
    // 选择占卜内容
    @IBAction func ClickZhanButton(_ sender: Any) {
        selectZhan()
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
        
        BgTianGanList.append(BgTianGan0)
        BgTianGanList.append(BgTianGan1)
        BgHuiKeList.append(BgHuiKe0)
        BgHuiKeList.append(BgHuiKe1)
        BgHuiKeList.append(BgHuiKe2)
        BgHuiKeList.append(BgHuiKe3)
        BgHuiKeList.append(BgHuiKe4)
        BgHuiKeList.append(BgHuiKe5)
        BgDiZhiList.append(BgDiZhi0)
        BgDiZhiList.append(BgDiZhi1)
        BgDiZhiList.append(BgDiZhi2)
        BgDiZhiList.append(BgDiZhi3)
        BgDiZhiList.append(BgDiZhi4)
        BgDiZhiList.append(BgDiZhi5)
        BgLiuQinList.append(BgLiuQin0)
        BgLiuQinList.append(BgLiuQin1)
        BgLiuQinList.append(BgLiuQin2)
        BgLiuQinList.append(BgLiuQin3)
        BgLiuQinList.append(BgLiuQin4)
        BgLiuQinList.append(BgLiuQin5)
        
        FsTianGanList.append(FsTianGan0)
        FsTianGanList.append(FsTianGan1)
        FsDiZhiList.append(FsDiZhi0)
        FsDiZhiList.append(FsDiZhi1)
        FsDiZhiList.append(FsDiZhi2)
        FsDiZhiList.append(FsDiZhi3)
        FsDiZhiList.append(FsDiZhi4)
        FsDiZhiList.append(FsDiZhi5)
        FsLiuQinList.append(FsLiuQin0)
        FsLiuQinList.append(FsLiuQin1)
        FsLiuQinList.append(FsLiuQin2)
        FsLiuQinList.append(FsLiuQin3)
        FsLiuQinList.append(FsLiuQin4)
        FsLiuQinList.append(FsLiuQin5)
        
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

        Scroll.delegate = self
        ZhanTitleList.append(ZhanTitle0)
        ZhanTitleList.append(ZhanTitle1)
        ZhanTitleList.append(ZhanTitle2)
        ZhanTitleList.append(ZhanTitle3)
        ZhanTitleList.append(ZhanTitle4)
        ZhanTitleList.append(ZhanTitle5)
        ZhanTitleList.append(ZhanTitle6)
        ZhanTitleList.append(ZhanTitle7)
        ZhanTitleList.append(ZhanTitle8)
        ZhanTitleList.append(ZhanTitle9)
        ZhanTitleList.append(ZhanTitle10)
        ZhanTitleList.append(ZhanTitle11)
        ZhanTitleList.append(ZhanTitle12)
        ZhanTitleList.append(ZhanTitle13)
        ZhanTitleList.append(ZhanTitle14)
        ZhanTitleList.append(ZhanTitle15)
        
        ZhanGZList.append(ZhanGZ0)
        ZhanGZList.append(ZhanGZ1)
        ZhanGZList.append(ZhanGZ2)
        ZhanGZList.append(ZhanGZ3)
        ZhanGZList.append(ZhanGZ4)
        ZhanGZList.append(ZhanGZ5)
        ZhanGZList.append(ZhanGZ6)
        ZhanGZList.append(ZhanGZ7)
        ZhanGZList.append(ZhanGZ8)
        ZhanGZList.append(ZhanGZ9)
        ZhanGZList.append(ZhanGZ10)
        ZhanGZList.append(ZhanGZ11)
        ZhanGZList.append(ZhanGZ12)
        ZhanGZList.append(ZhanGZ13)
        ZhanGZList.append(ZhanGZ14)
        ZhanGZList.append(ZhanGZ15)
        
        ZhanButton.layer.masksToBounds = true
        ZhanButton.layer.cornerRadius = 5
        
        print(gua?.date)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let width = Scroll.frame.size.width
        let height = Scroll.frame.size.height
        Scroll.contentSize = CGSize(width: width * 3, height: height)
        Stack.frame = CGRect(x: 0, y: 0, width: width * 3, height: height)
        Scroll.contentOffset.x +=  Scroll.frame.width
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Scroll.contentOffset.x = 0
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
                    self.Year.text = year
                    self.Month.text = month
                    self.Day.text = day
                    self.setTime()
                    self.setZhanView(title: "常用神煞")
                    self.TheMonth.text = String((month?.last)!)
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
                    self.setHuGua()
                    let data = respJson.object(forKey: "data") as AnyObject
                    DispatchQueue.main.async {
                        self.setZhuangGua(json: data.object(forKey: "zhuangGuaTable") as AnyObject)
                        self.setFuShen(json: data.object(forKey: "fuShenTable") as AnyObject)
                        self.setBianGua(json: data.object(forKey: "bianGuaTable") as AnyObject)
                        self.setMonthTable(json: data.object(forKey: "monthTable") as AnyObject)
                        self.setQinTable(json: data.object(forKey: "qingTable") as AnyObject)
                        self.setDayTable(json: data.object(forKey: "dayTable") as AnyObject)
                        self.setBianTable(json: data.object(forKey: "bianYaoTable") as AnyObject)
                        self.setScrollView()
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
            LiuShenList[i].attributedText = getNSAttributedString(inputString: [list[(i + offset) % 6]], inputColor: [UIColor(red: 112/255, green: 112/255, blue: 116/255, alpha: 1)])
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
        // 填充六亲表
        let lqList = fu_kString(str: basicData.object(forKey: "six_relatives") as! String)
        for i in 0..<6 {
            LiuQinList[i].attributedText = getNSAttributedString(inputString: [lqList[i]], inputColor: [UIColor(red: 132/255, green: 45/255, blue: 134/255, alpha: 1)])
        }
        // 填充本卦图
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
        var List4: [String] = ["", "", "", "", "", ""]
        if var l = json.object(forKey: "column4") as? [Any] {
            for i in 0..<l.count {
                if let j = l[i] as? Int {
                    if j == 1 {
                        List4[i] = "刑"
                    }
                }
            }
        }
        var List5: [String] = ["", "", "", "", "", ""]
        if var l = json.object(forKey: "column5") as? [Any] {
            for i in 0..<l.count {
                if let j = l[i] as? Int {
                    if j == 1 {
                        List5[i] = "冲"
                    }
//                    print(List5)
                }
            }
        }
        var List6: [String] = ["", "", "", "", "", ""]
        if var l = json.object(forKey: "column6") as? [Any] {
            for i in 0..<l.count {
                if let j = l[i] as? Int {
                    if j == 1 {
                        List6[i] = "害"
                    }
//                    print(List6)
                }
            }
        }
//        let List4 = json.object(forKey: "column4") as! [String?]
//        let List5 = json.object(forKey: "column5") as! [String?]
//        let List6 = json.object(forKey: "column6") as! [String?]
        ZgList.append(List0)
        ZgList.append(List1)
        ZgList.append(List2)
        ZgList.append(List3)
        ZgList.append(List4)
//        ZgList.append(List4)
        ZgList.append(List5)
        ZgList.append(List6)
        // 空
        if let kList = json.object(forKey: "kongIndex") as? [Int] {
            // Scroll空
            var k: String = ""
            for i in kList {
                ZgDiZhiList[i].setBackgroundImage(UIImage(named: "kong"), for: .normal)
                k.append(List0[i])
            }
//            RYKong.text = getVerticalString(inputString: k)
        }
        turnZhuangGua()
        // Scroll空
        if let kList = json.object(forKey: "kongDiZhi") as? [String] {
            var k = "";
            for i in kList {
                k += i
            }
            RYKong.text = getVerticalString(inputString: k)
        }
        // Scroll本
        RYBen.text = getVerticalString(inputString: basicData.object(forKey: "content") as! String)
        // Scroll身
        RYShen.text = basicData.object(forKey: "gua_shen") as! String
    }
    
    func turnZhuangGua() {
        if self.resultCode != 0 {
            return
        }
        for i in 0..<6 {
            ZgDiZhiList[i].setAttributedTitle(getNSAttributedString(inputString: [ZgList[0][i], ZgList[ZgTurn][i]], inputColor: [UIColor(red: 233/255, green: 133/255, blue: 50/255, alpha: 1), UIColor(red: 55/255, green: 123/255, blue: 58/255, alpha: 1)]), for: .normal)
        }
//        self.ZgTurn = self.ZgTurn == 3 ? 1 : self.ZgTurn + 1
        self.ZgTurn = self.ZgTurn == 6 ? 1 : self.ZgTurn + 1
    }
    
    // 填充变卦内容
    func setBianGua(json: AnyObject) { // 包括六冲2
        let basicData = json.object(forKey: "basicData") as AnyObject
        // 变卦头
        if let header = getGuaHeader(guaMing: basicData.object(forKey: "content") as! String, guaCi: basicData.object(forKey: "times") as! String) {
            BgHeader.text = header
        }
        // 天干
        let tgList = fu_kString(str: basicData.object(forKey: "heavenly_stems") as! String)
        BgTianGanList[0].text = tgList[0]
        BgTianGanList[1].text = tgList[1]
        // 地支、五行、六亲、回克
        let List0 = fu_kString(str: basicData.object(forKey: "earthly_branches") as! String)
        let List1 = fu_kString(str: basicData.object(forKey: "five_elements") as! String)
//        let lqList = fu_kString(str: basicData.object(forKey: "six_relatives") as! String)
        let lqList = getBianGuaLiuQin(bgdz: List0, fsdz: FsList[0], fslq: FsList[2])
        BgList.append(List0)
        BgList.append(List1)
        BgList.append(lqList)
        // 回克
        var hkList: [String] = []
        for i in 0..<6 {
            hkList.append(DiZhiTable.getHuiKe(ZgDiZhi: ZgList[0][i], BgDiZhi: BgList[0][i]))
        }
        BgList.append(hkList)
        // 空
        if let kList = json.object(forKey: "kongIndex") as? [Int] {
            for i in kList {
                BgLiuQinList[i].setBackgroundImage(UIImage(named: "kong"), for: .normal)
            }
        }
        // 轮转显示
        if let sList = json.object(forKey: "showIndex") as? [Int] {
            self.BgShow = sList
        }
        turnBianGua()
        RYBian.text = getVerticalString(inputString: basicData.object(forKey: "content") as! String);
    }
    
    // 计算变卦六亲
    func getBianGuaLiuQin(bgdz: [String], fsdz: [String], fslq: [String]) -> [String] {
        var list:[String] = []
        for i in 0..<6 {
            for j in 0..<6 {
                if DiZhiTable.isEqualDiZhi(a: bgdz[i], b: fsdz[j]) {
                    list.append(fslq[j])
                    break;
                }
            }
        }
        return list
    }
    
    func turnBianGua() {
        if BgShow.count == 0 {
            return // 全为6或9时不显示
        }
        if self.resultCode != 0 {
            return;
        }
        if BgTurn {
            for i in 0..<6 {
                BgDiZhiList[i].setAttributedTitle(getNSAttributedString(inputString: [BgList[0][i], BgList[1][i]], inputColor: [UIColor(red: 233/255, green: 133/255, blue: 50/255, alpha: 1), UIColor(red: 55/255, green: 123/255, blue: 58/255, alpha: 1)]), for: .normal)
                BgLiuQinList[i].setAttributedTitle(getNSAttributedString(inputString: [BgList[2][i]], inputColor: [UIColor(red: 132/255, green: 45/255, blue: 134/255, alpha: 1)]), for: .normal)
                BgHuiKeList[i].setTitle(BgList[3][i], for: .normal)
            }
        } else {
            for i in 0..<6 {
                BgDiZhiList[i].setAttributedTitle(nil, for: .normal)
                BgLiuQinList[i].setAttributedTitle(nil, for: .normal)
                BgHuiKeList[i].setTitle(nil, for: .normal)
            }
            for i in BgShow {
                BgDiZhiList[i].setAttributedTitle(getNSAttributedString(inputString: [BgList[0][i], BgList[1][i]], inputColor: [UIColor(red: 233/255, green: 133/255, blue: 50/255, alpha: 1), UIColor(red: 55/255, green: 123/255, blue: 58/255, alpha: 1)]), for: .normal)
                BgLiuQinList[i].setAttributedTitle(getNSAttributedString(inputString: [BgList[2][i]], inputColor: [UIColor(red: 132/255, green: 45/255, blue: 134/255, alpha: 1)]), for: .normal)
                BgHuiKeList[i].setTitle(BgList[3][i], for: .normal)
            }
        }
        BgTurn = !BgTurn
    }
    
    func setFuShen(json: AnyObject) { // 包括伏神
        let basicData = json.object(forKey: "basicData") as AnyObject
        // 变卦头
//        if let header = getGuaHeader(guaMing: basicData.object(forKey: "content") as! String, guaCi: basicData.object(forKey: "times") as! String) {
//            FsHeader.text = header
//        }
        // 天干
        let tgList = fu_kString(str: basicData.object(forKey: "heavenly_stems") as! String)
        FsTianGanList[0].text = tgList[0]
        FsTianGanList[1].text = tgList[1]
        // 地支、五行、六亲
        let List0 = fu_kString(str: basicData.object(forKey: "earthly_branches") as! String)
        let List1 = fu_kString(str: basicData.object(forKey: "five_elements") as! String)
        let lqList = fu_kString(str: basicData.object(forKey: "six_relatives") as! String)
        FsList.append(List0)
        FsList.append(List1)
        FsList.append(lqList)
        // 空
        if let kList = json.object(forKey: "kongIndex") as? [Int] {
            for i in kList {
                FsLiuQinList[i].setBackgroundImage(UIImage(named: "kong"), for: .normal)
            }
        }
        // 轮转显示
        if let sList = json.object(forKey: "showIndex") as? [Int] {
            self.FsShow = sList
        }
        turnFuShen()
        // 设置年月日时
        setTime()
        RYShou.text = getVerticalString(inputString: basicData.object(forKey: "content") as! String);
    }
    
    func turnFuShen() {
        if self.resultCode != 0 {
            return;
        }
        if FsTurn {
            for i in 0..<6 {
                FsDiZhiList[i].setAttributedTitle(getNSAttributedString(inputString: [FsList[0][i], FsList[1][i]], inputColor: [UIColor(red: 233/255, green: 133/255, blue: 50/255, alpha: 1), UIColor(red: 55/255, green: 123/255, blue: 58/255, alpha: 1)]), for: .normal)
                FsLiuQinList[i].setAttributedTitle(getNSAttributedString(inputString: [FsList[2][i]], inputColor: [UIColor(red: 132/255, green: 45/255, blue: 134/255, alpha: 1)]), for: .normal)
            }
        } else {
            for i in 0..<6 {
                FsDiZhiList[i].setAttributedTitle(nil, for: .normal)
                FsLiuQinList[i].setAttributedTitle(nil, for: .normal)
            }
            for i in FsShow {
                FsDiZhiList[i].setAttributedTitle(getNSAttributedString(inputString: [FsList[0][i], FsList[1][i]], inputColor: [UIColor(red: 233/255, green: 133/255, blue: 50/255, alpha: 1), UIColor(red: 55/255, green: 123/255, blue: 58/255, alpha: 1)]), for: .normal)
                FsLiuQinList[i].setAttributedTitle(getNSAttributedString(inputString: [FsList[2][i]], inputColor: [UIColor(red: 132/255, green: 45/255, blue: 134/255, alpha: 1)]), for: .normal)
            }
        }
        FsTurn = !FsTurn
    }
    
    // 设置互卦
    func setHuGua() {
        HTTP.POST(Api.GetHuGua, parameters: gua?.guaXiang, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                self.resultCode = respJson.object(forKey: "code") as? Int
                if self.resultCode == 0 {
                    let data = respJson.object(forKey: "data") as AnyObject
                    DispatchQueue.main.async {
                        self.RYHu.text = self.getVerticalString(inputString: data.object(forKey: "content") as! String)
                    }
                }
            } catch {
                print("Get HuGua Error")
                print(error)
            }
        }
    }
    
    // 设置本卦图片
    func setBenGua(sy: String) {
        let SYList = fu_kString(str: sy)
        let SIndex = SYList.firstIndex(of: "世")
        let YIndex = SYList.firstIndex(of: "应")
        let GList: [UIImage] = [UIImage(named: "G6")!, UIImage(named: "G7")!, UIImage(named: "G8")!, UIImage(named: "G9")!, UIImage(named: "GS6")!, UIImage(named: "GS7")!, UIImage(named: "GS8")!, UIImage(named: "GS9")!, UIImage(named: "GY6")!, UIImage(named: "GY7")!, UIImage(named: "GY8")!, UIImage(named: "GY9")!]
        for i in 0..<6 {
            BenGuaList[i].image = GList[(gua?.guaXiang?[i])! - 6]
        }
        BenGuaList[SIndex ?? 0].image = GList[((gua?.guaXiang?[SIndex ?? 0])! - 2)]
        BenGuaList[YIndex ?? 0].image = GList[((gua?.guaXiang?[YIndex ?? 0])! + 2)]
    }
    
    // 填充年月日时
    // 分别在convertTime()和setFuShen()调用了一次
    // 目的是为了线程同步
    func setTime() {
        let year = Year.text
        let month = Month.text
        let day = Day.text
        let hour = getHour()
        // 等价类编号List
        var equalNumList: [Int] = []
        for dz in FsList[0] {
            equalNumList.append(DiZhiTable.getEqualNum(str: dz))
        }
        
        var index: Int = equalNumList.firstIndex(of: DiZhiTable.getEqualNum(str: String((year?.last ?? "戌"))))!
        var qin : String = String(FsList[2][index].first!)
        if FsList[2][index] == "子孙" || FsList[2][index] == "妻财" {
            qin = String(FsList[2][index].last!)
        }
        Year.attributedText = getNSAttributedString(inputString: [String(year?.first ?? "甲"), String(year?.last ?? "子"), qin], inputColor: [.black, UIColor(red: 233/255, green: 133/255, blue: 50/255, alpha: 1), UIColor(red: 132/255, green: 45/255, blue: 134/255, alpha: 1)])
        
        index = equalNumList.firstIndex(of: DiZhiTable.getEqualNum(str: String((month?.last ?? "戌"))))!
        qin = String(FsList[2][index].first!)
        if FsList[2][index] == "子孙" || FsList[2][index] == "妻财" {
            qin = String(FsList[2][index].last!)
        }
        Month.attributedText = getNSAttributedString(inputString: [String(month?.first ?? "甲"), String(month?.last ?? "子"), qin], inputColor: [.black, UIColor(red: 233/255, green: 133/255, blue: 50/255, alpha: 1), UIColor(red: 132/255, green: 45/255, blue: 134/255, alpha: 1)])
        
        index = equalNumList.firstIndex(of: DiZhiTable.getEqualNum(str: String((day?.last ?? "戌"))))!
        qin = String(FsList[2][index].first!)
        if FsList[2][index] == "子孙" || FsList[2][index] == "妻财" {
            qin = String(FsList[2][index].last!)
        }
        Day.attributedText = getNSAttributedString(inputString: [String(day?.first ?? "甲"), String(day?.last ?? "子"), qin], inputColor: [.black, UIColor(red: 233/255, green: 133/255, blue: 50/255, alpha: 1), UIColor(red: 132/255, green: 45/255, blue: 134/255, alpha: 1)])
        
        index = equalNumList.firstIndex(of: DiZhiTable.getEqualNum(str: String((hour.last ?? "戌"))))!
        qin = String(FsList[2][index].first!)
        if FsList[2][index] == "子孙" || FsList[2][index] == "妻财" {
            qin = String(FsList[2][index].last!)
        }
        Hour.attributedText = getNSAttributedString(inputString: [String(hour.last ?? "子"), qin], inputColor: [UIColor(red: 233/255, green: 133/255, blue: 50/255, alpha: 1), UIColor(red: 132/255, green: 45/255, blue: 134/255, alpha: 1)])
        
        setRiChongYuePo()
    }
    // 分离“时”,计算“时”的天干
    func getHour() -> String {
        let date = self.gua?.date?.replacingOccurrences(of: " ", with: "-").replacingOccurrences(of: ":", with: "-").components(separatedBy: "-")
        if let hour = date?[3] {
            let h = (Int(hour) ?? 0) / 2
            return DiZhiTable.DiZhi[h] ?? "子"
        }
        return "戌"
    }
    
    // 填充月表内容
    func setMonthTable(json: AnyObject) {
        let attr: [String] = json.object(forKey: "attr") as! [String]
        let wx: [String] = json.object(forKey: "wuxing") as! [String]
        for i in 0..<5 {
            MonthList[i].attributedText = getNSAttributedString(inputString: [wx[i], attr[i]], inputColor: [UIColor(red: 115/255, green: 165/255, blue: 124/255, alpha: 1), UIColor(red: 67/255, green: 139/255, blue: 229/255, alpha: 1)])
        }
    }
    
    // 填充亲表内容
    func setQinTable(json: AnyObject) {
        let list = json as! [String]
        for i in 0..<5 {
            QinList[i].text = list[i]
        }
    }
    
    // 填充日表内容
    func setDayTable(json: AnyObject) {
        let list = json as! [String]
        for i in 0..<5 {
            DayList[i].text = list[i]
        }
    }
    
    // 填充变表内容
    func setBianTable(json: AnyObject) {
        let list = json.object(forKey: "bianYao") as! [String]
        for i in 0..<5 {
            BianList[i].text = list[i]
        }
    }
    
    // 填充右下角Scroll内容
    func setScrollView() {
        setReason()
//        setRiChongYuePo()
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        Page.currentPage = Int(Scroll.contentOffset.x / scrollView.frame.width)
    }
    
    // 填充卜卦事由等（时间，用神，名字，事由，备注）
    func setReason() {
        TheDate.text = "卜卦时间: " + (gua?.date ?? "")
        TheYongShen.text = "卜卦用神: " + (gua?.yongShen ?? "")
        TheName.text = "卜卦姓名: " + (gua?.name ?? "")
        TheReason.text = "卜卦事由: " + (gua?.reason ?? "")
        TheNote.text = "卜卦备注: " + (gua?.note ?? "")
    }
    
    // 计算日冲月破
    func setRiChongYuePo() {
        if var r = Day.text {
            r.remove(at: r.startIndex)
            RiChong.text = DiZhiTable.DiZhi[(DiZhiTable.DiZhiNum[String(r.first ?? "戌")]! + 6) % 12]
        }
        if var y = Month.text {
            y.remove(at: y.startIndex)
            YuePo.text = DiZhiTable.DiZhi[(DiZhiTable.DiZhiNum[String(y.first ?? "戌")]! + 6) % 12]
        }
    }
    
    // 以下为“占”的tableview所需函数
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ZhanList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ZhanCell", for: indexPath)
        cell.textLabel?.text = ZhanList[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 42
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        ZhanButton.setTitle(getVerticalString(inputString: ZhanList[indexPath.row]), for: .normal)
        self.setZhanView(title: ZhanList[indexPath.row])
        self.dismiss(animated: true, completion: nil)
        return
    }
    func selectZhan() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 270, height: 294))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ZhanCell")
        tableView.delegate = self
        tableView.dataSource = self
        let nAction = UIAlertAction(title: "取消", style: .default, handler: nil)
        alert.view.addSubview(tableView)
        alert.addAction(nAction)
        self.present(alert, animated: true, completion: nil)
    }
    func setZhanView(title: String) {
        let day = Day.text
        if day?.count ?? 0 < 2 {
            return
        }
        var tg: String = "戊"
        var dz: String = "戌"
        if var ri = day {
            tg = String(ri.first!)
            ri.remove(at: ri.startIndex)
            dz = String(ri.first!)
        }
        
        if let list = ZhanTable.ZhanTitleMap[title] {
            for i in 0..<list.count {
                ZhanTitleList[i].text = getVerticalString(inputString: list[i])
                ZhanGZList[i].text = getVerticalString(inputString: ZhanTable.getZhanGZ(title: list[i], tg: tg, dz: dz))
            }
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
    
    // 把字符串变成竖式字符串
    func getVerticalString(inputString: String) -> String {
        var verStr: String = ""
        for char in inputString {
            verStr.append(char)
            verStr.append("\n")
        }
        if verStr.count > 0 {
            verStr.remove(at: verStr.index(before: verStr.endIndex))
        }
        return verStr
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
