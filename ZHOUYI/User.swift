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
    var id: Int?
    var name: String?
    var password: String?
    var realName: String?
    var tel: String?
    var birthYM: String?
    var token: String?
    var login: Bool?
    
    // 存在本地的用户信息
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("LOCAL_USER")
    
    init(inputId: Int?, inputName: String?, inputPassword: String?, inputRealName: String?, inputTel: String?, inputBirthYM: String?, inputToken: String?, inputLogin: Bool?) {
        self.id = inputId
        self.name = inputName
        self.password = inputPassword
        self.realName = inputRealName
        self.tel = inputTel
        self.birthYM = inputBirthYM
        self.token = inputToken
        self.login = inputLogin
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(id, forKey: "idKey")
        aCoder.encode(name, forKey: "nameKey")
        aCoder.encode(password, forKey: "passwordKey")
        aCoder.encode(realName, forKey: "realNameKey")
        aCoder.encode(tel, forKey: "telKey")
        aCoder.encode(birthYM, forKey: "birthYMKey")
        aCoder.encode(token, forKey: "tokenKey")
        aCoder.encode(login, forKey: "loginKey")
    }
    
    required init?(coder aDecoder: NSCoder) {
        id = aDecoder.decodeObject(forKey: "idKey") as? Int
        name = aDecoder.decodeObject(forKey: "nameKey") as? String
        password = aDecoder.decodeObject(forKey: "passwordKey") as? String
        realName = aDecoder.decodeObject(forKey: "realNameKey") as? String
        tel = aDecoder.decodeObject(forKey: "telKey") as? String
        birthYM = aDecoder.decodeObject(forKey: "birthYMKey") as? String
        token = aDecoder.decodeObject(forKey: "tokenKey") as? String
        login = aDecoder.decodeObject(forKey: "loginKey") as? Bool
    }
}
