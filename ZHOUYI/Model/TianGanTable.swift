//
//  TianGanTable.swift
//  ZHOUYI
//
//  Created by Apple on 2019/4/1.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import Foundation

class TianGanTable: NSObject {
    
    // 天干表：羊刃、贵人
    static let YangRen: [String : String] = [
        "甲" : "卯",
        "乙" : "辰",
        "丙" : "午",
        "丁" : "未",
        "戊" : "午",
        "己" : "未",
        "庚" : "酉",
        "辛" : "戌",
        "壬" : "子",
        "癸" : "丑"
    ]
    static let GuiRen: [String : [String]] = [
        "甲" : ["丑", "未"],
        "乙" : ["子", "申"],
        "丙" : ["亥", "酉"],
        "丁" : ["亥", "酉"],
        "戊" : ["丑", "未"],
        "己" : ["子", "申"],
        "庚" : ["午", "寅"],
        "辛" : ["午", "寅"],
        "壬" : ["卯", "巳"],
        "癸" : ["卯", "巳"]
    ]
}
