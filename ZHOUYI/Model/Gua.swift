//
//  Gua.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/3/10.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import Foundation

class Gua: NSObject {
    var id: String?
    var method: String?
    var date: String?
    var yongShen: String?
    var name: String?
    var reason: String?
    var note: String?
    var guaXiang: [Int]?
    
    override init() {
        method = "method"
        date = "date"
        yongShen = "yongShen"
        name = "name"
        reason = "reason"
        note = "note"
        guaXiang = [6, 6, 6, 6, 6, 6]
    }
    
    init(initJson: AnyObject) {
        self.id = initJson.object(forKey: "_id") as? String
        self.method = initJson.object(forKey: "way") as? String
        self.date = initJson.object(forKey: "date") as? String
        self.yongShen = initJson.object(forKey: "yongshen") as? String
        self.name = initJson.object(forKey: "name") as? String
        self.reason = initJson.object(forKey: "reason") as? String
        self.note = initJson.object(forKey: "note") as? String
        self.guaXiang = initJson.object(forKey: "guaxiang") as? [Int]
    }
}
