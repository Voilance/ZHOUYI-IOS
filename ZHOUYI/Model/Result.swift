//
//  Result.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/3/5.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import Foundation

class Result: NSObject {
    
    var date: String?
    var yongShen: String?
    var name: String?
    var reason: String?
    var note: String?
    var guaXiang: [Int]?
    
    init(initDate: String?,
         initYongShen: String?,
         initName: String?,
         initReason: String?,
         initNote: String?,
         initGuaXiang: [Int]) {
        self.date = initDate
        self.yongShen = initYongShen
        self.name = initName
        self.reason = initReason
        self.note = initNote
        self.guaXiang = initGuaXiang
    }
    
    init(initJson: AnyObject) {
        self.date = initJson.object(forKey: "date") as? String
        self.yongShen = initJson.object(forKey: "yongshen") as? String
        self.name = initJson.object(forKey: "name") as? String
        self.reason = initJson.object(forKey: "reason") as? String
        self.note = initJson.object(forKey: "note") as? String
        self.guaXiang = initJson.object(forKey: "guaxiang") as? [Int]
    }
}
