//
//  DiZhiTable.swift
//  ZHOUYI
//
//  Created by Apple on 2019/4/1.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import Foundation

class DiZhiTable : NSObject {
    
    static let DiZhiNum: [String: Int] = [
        "子" : 0,
        "丑" : 1,
        "寅" : 2,
        "卯" : 3,
        "辰" : 4,
        "巳" : 5,
        "午" : 6,
        "未" : 7,
        "申" : 8,
        "酉" : 9,
        "戌" : 10,
        "亥" : 11
    ]
    static let DiZhi: [Int: String] = [
        0 : "子",
        1 : "丑",
        2 : "寅",
        3 : "卯",
        4 : "辰",
        5 : "巳",
        6 : "午",
        7 : "未",
        8 : "申",
        9 : "酉",
        10 : "戌",
        11 : "亥"
    ]
    static let WuXing: [String: String] = [
        "子" : "水",
        "丑" : "土",
        "寅" : "木",
        "卯" : "木",
        "辰" : "土",
        "巳" : "火",
        "午" : "火",
        "未" : "土",
        "申" : "金",
        "酉" : "金",
        "戌" : "土",
        "亥" : "水"
    ]
    static let Xing: [String : String] = [
        "子" : "卯",
        "丑" : "未",
        "寅" : "申",
        "卯" : "子",
        "辰" : "辰",
        "巳" : "寅",
        "午" : "午",
        "未" : "戌",
        "申" : "巳",
        "酉" : "酉",
        "戌" : "丑",
        "亥" : "亥"
    ]
    static let Chong: [String : String] = [
        "子" : "午",
        "丑" : "未",
        "寅" : "申",
        "卯" : "酉",
        "辰" : "戌",
        "巳" : "亥",
        "午" : "子",
        "未" : "丑",
        "申" : "寅",
        "酉" : "卯",
        "戌" : "辰",
        "亥" : "巳"
    ]
    static let He: [String : String] = [
        "子" : "丑",
        "丑" : "子",
        "寅" : "亥",
        "卯" : "戌",
        "辰" : "酉",
        "巳" : "申",
        "午" : "未",
        "未" : "午",
        "申" : "巳",
        "酉" : "辰",
        "戌" : "卯",
        "亥" : "寅"
    ]
    static let Hai: [String : String] = [
        "子" : "未",
        "丑" : "午",
        "寅" : "巳",
        "卯" : "辰",
        "辰" : "卯",
        "巳" : "寅",
        "午" : "丑",
        "未" : "子",
        "申" : "亥",
        "酉" : "戌",
        "戌" : "酉",
        "亥" : "申"
    ]
    static let Ke: [String : [String]] = [
        "子" : ["巳", "午"],
        "丑" : ["子", "亥"],
        "寅" : ["丑", "辰", "未", "戌"],
        "卯" : ["丑", "辰", "未", "戌"],
        "辰" : ["子", "亥"],
        "巳" : ["申", "酉"],
        "午" : ["申", "酉"],
        "未" : ["子", "亥"],
        "申" : ["寅", "卯"],
        "酉" : ["寅", "卯"],
        "戌" : ["子", "亥"],
        "亥" : ["巳", "午"]
    ]
    static let Sheng: [String : [String]] = [
        "子" : ["寅", "卯"],
        "丑" : ["申", "酉"],
        "寅" : ["巳", "午"],
        "卯" : ["巳", "午"],
        "辰" : ["申", "酉"],
        "巳" : ["丑", "辰", "未", "戌"],
        "午" : ["丑", "辰", "未", "戌"],
        "未" : ["申", "酉"],
        "申" : ["子", "亥"],
        "酉" : ["子", "亥"],
        "戌" : ["申", "酉"],
        "亥" : ["寅", "卯"]
    ]
    static let TaoHua: [String : String] = [
        "子" : "酉",
        "丑" : "午",
        "寅" : "卯",
        "卯" : "子",
        "辰" : "酉",
        "巳" : "午",
        "午" : "卯",
        "未" : "子",
        "申" : "酉",
        "酉" : "午",
        "戌" : "卯",
        "亥" : "子"
    ]
    static let YiMa: [String : String] = [
        "子" : "寅",
        "丑" : "亥",
        "寅" : "申",
        "卯" : "巳",
        "辰" : "寅",
        "巳" : "亥",
        "午" : "申",
        "未" : "巳",
        "申" : "寅",
        "酉" : "亥",
        "戌" : "申",
        "亥" : "巳"
    ]
    static let JieSha: [String : String] = [
        "子" : "巳",
        "丑" : "寅",
        "寅" : "亥",
        "卯" : "申",
        "辰" : "巳",
        "巳" : "寅",
        "午" : "亥",
        "未" : "申",
        "申" : "巳",
        "酉" : "寅",
        "戌" : "亥",
        "亥" : "申"
    ]
    static let WangShen: [String : String] = [
        "子" : "亥",
        "丑" : "申",
        "寅" : "巳",
        "卯" : "寅",
        "辰" : "亥",
        "巳" : "申",
        "午" : "巳",
        "未" : "寅",
        "申" : "亥",
        "酉" : "申",
        "戌" : "巳",
        "亥" : "寅"
    ]
    static let GuaXiu: [String : String] = [
        "子" : "戌",
        "丑" : "戌",
        "寅" : "丑",
        "卯" : "丑",
        "辰" : "丑",
        "巳" : "辰",
        "午" : "辰",
        "未" : "辰",
        "申" : "未",
        "酉" : "未",
        "戌" : "未",
        "亥" : "戌"
    ]
    static let GuChen: [String : String] = [
        "子" : "寅",
        "丑" : "寅",
        "寅" : "巳",
        "卯" : "巳",
        "辰" : "巳",
        "巳" : "申",
        "午" : "申",
        "未" : "申",
        "申" : "亥",
        "酉" : "亥",
        "戌" : "亥",
        "亥" : "寅"
    ]
    static let HongLuan: [String : String] = [
        "子" : "卯",
        "丑" : "寅",
        "寅" : "丑",
        "卯" : "子",
        "辰" : "亥",
        "巳" : "戌",
        "午" : "酉",
        "未" : "申",
        "申" : "未",
        "酉" : "午",
        "戌" : "巳",
        "亥" : "辰"
    ]
    static let TianXi: [String : String] = [
        "子" : "酉",
        "丑" : "申",
        "寅" : "未",
        "卯" : "午",
        "辰" : "巳",
        "巳" : "辰",
        "午" : "卯",
        "未" : "寅",
        "申" : "丑",
        "酉" : "子",
        "戌" : "亥",
        "亥" : "戌"
    ]
    
    // 利用装卦地支合变卦地支计算回克状态位
    static func getHuiKe(ZgDiZhi: String, BgDiZhi: String) -> String {
        var status: String = ""
        // 如果变卦地支的“合”对应装卦地支，则状态status设为”回合“
        if (He[BgDiZhi] == ZgDiZhi) {
            status = "回合"
        }
        // 如果变卦地支的“克”对应装卦地支，同时状态status为”回合“则返回”合克“
        // 状态status为空则返回”回克“
        if let ke = Ke[BgDiZhi] {
            for i in ke {
                if i == ZgDiZhi {
                    if status == "回合" {
                        status = "合克"
                    } else { // huiKe == nil
                        status = "回克"
                    }
                }
            }
        }
        // 如果变卦地支的“生”对应装卦地支，则返回“回生”
        if let sheng = Sheng[BgDiZhi] {
            for i in sheng {
                if i == ZgDiZhi {
                    status =  "回生"
                }
            }
        }
        // 判断变卦地支合装卦地支是否等价
        // 否，返回空
        // 是，判断是否变卦地支>装卦地支
        // 是，返回“化进”
        // 否，返回“化退”
        if isEqualDiZhi(a: ZgDiZhi, b: BgDiZhi) {
            if let zgdz = DiZhiNum[ZgDiZhi] {
                if let bgdz = DiZhiNum[BgDiZhi] {
                    if bgdz > zgdz {
                        status = "化进"
                    } else if bgdz < zgdz {
                        status = "化退"
                    } else {
                        return ""
                    }
                }
            }
        }
        return status
    }
    // 判断两个地支是否等价
    static func isEqualDiZhi(a: String, b: String) -> Bool {
        if getEqualNum(str: a) == getEqualNum(str: b) {
            return true
        } else {
            return false
        }
    }
    // 获取等价类的编号
    static func getEqualNum(str: String) -> Int {
        let list1: [String] = ["丑", "辰", "未", "戌"]
        let list2: [String] = ["亥", "子"]
        let list3: [String] = ["寅", "卯"]
        let list4: [String] = ["巳", "午"]
        let list5: [String] = ["申", "酉"]
        if list1.contains(str) {
            return 1
        } else if list2.contains(str) {
            return 2
        } else if list3.contains(str) {
            return 3
        } else if list4.contains(str) {
            return 4
        } else if list5.contains(str) {
            return 5
        } else {
            return 0
        }
    }
}
