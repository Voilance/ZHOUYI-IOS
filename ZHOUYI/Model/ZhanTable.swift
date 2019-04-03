//
//  ZhanTable.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/4/3.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import Foundation

class ZhanTable: NSObject {
    static let ZhanTitleMap: [String: [String]] = [
        "常用神煞" : ["千禄", "往亡", "天喜", "劫煞", "羊刃", "桃花", "驿马", "贵人"],
        "占感情" : ["灾煞", "劫煞", "寡宿", "孤辰", "桃花", "红鸾", "天喜", "羊刃", "驿马", "月将", "日德", "贵人"],
        "占疾病" : ["驿马", "月将", "日德", "贵人", "吊客", "丧门", "地医", "天医"],
        "占官禄" : ["羊刃", "月将", "日德", "天喜", "驿马", "日德", "文昌", "贵人"],
        "占求财" : ["天喜", "羊刃", "劫煞", "亡神", "贵人", "驿马"],
        "占胎孕" : ["寡宿", "孤辰", "灾煞", "亡神", "劫煞", "羊刃", "红鸾", "天喜"],
        "占官非" : ["贵人", "驿马", "月将", "日德"]
    ]
    
    static func getZhanGZ(title: String, tg: String, dz: String) -> String {
        switch title {
        case "羊刃":
            return TianGanTable.YangRen[tg] ?? ""
        case "贵人":
            return TianGanTable.GuiRen[tg]![0] + TianGanTable.GuiRen[tg]![1]
        case "桃花":
            return DiZhiTable.TaoHua[dz] ?? ""
        case "驿马":
            return DiZhiTable.YiMa[dz] ?? ""
        case "劫煞":
            return DiZhiTable.JieSha[dz] ?? ""
        case "亡神":
            return DiZhiTable.WangShen[dz] ?? ""
        case "寡宿":
            return DiZhiTable.GuaXiu[dz] ?? ""
        case "孤辰":
            return DiZhiTable.GuChen[dz] ?? ""
        case "红鸾":
            return DiZhiTable.HongLuan[dz] ?? ""
        case "天喜":
            return DiZhiTable.TianXi[dz] ?? ""
        default:
            return ""
        }
    }
}
