//
//  User.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/8.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    
    // 用户属性
    var name: String?
    var password: String?
    var tel: String?
    var token: String?
    var login: Bool?
    
    // 存在本地的用户信息
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("LOCAL_USER")
    
    init(inputName: String?, inputPassword: String?, inputTel: String?, inputToken: String?, inputLogin: Bool?) {
        self.name = inputName
        self.password = inputPassword
        self.tel = inputTel
        self.token = inputToken
        self.login = inputLogin
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "nameKey")
        aCoder.encode(password, forKey: "passwordKey")
        aCoder.encode(tel, forKey: "telKey")
        aCoder.encode(token, forKey: "tokenKey")
        aCoder.encode(login, forKey: "loginKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "nameKey") as? String
        password = aDecoder.decodeObject(forKey: "passwordKey") as? String
        tel = aDecoder.decodeObject(forKey: "telKey") as? String
        token = aDecoder.decodeObject(forKey: "tokenKey") as? String
        login = aDecoder.decodeObject(forKey: "loginKey") as? Bool
    }
}
