//
//  User.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/17.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import Foundation

class User: NSObject, NSCoding {
    
    var id: Int?          // 用户id
    var nickname: String? // 用户昵称
    var password: String? // 用户密码
    var realname: String? // 用户真实姓名
    var tel: String?      // 用户绑定的手机号码
    var birthday: String? // 用户出生日期（年、月）
    var token: String?    // 用户账号token
    var login: Bool?      // 用户上次退出应用时是否处于登陆状态
    
    init(initID: Int?,
         initNickname: String?,
         initPassword: String?,
         initRealname: String?,
         initTel: String?,
         initBirthday: String?,
         initToken: String?,
         initLogin: Bool?) {
        self.id = initID
        self.nickname = initNickname
        self.password = initPassword
        self.realname = initRealname
        self.tel = initTel
        self.birthday = initBirthday
        self.token = initToken
        self.login = initLogin
    }
    
    // 将用户信息保存在本地，重新打开应用时可以获取用户信息进行自动登录操作
    static let UserInfoDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = UserInfoDirectory.appendingPathComponent("USER_INFO")
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.id, forKey: "id")
        aCoder.encode(self.nickname, forKey: "nickname")
        aCoder.encode(self.password, forKey: "password")
        aCoder.encode(self.realname, forKey: "realname")
        aCoder.encode(self.tel, forKey: "tel")
        aCoder.encode(self.birthday, forKey: "birthday")
        aCoder.encode(self.token, forKey: "token")
        aCoder.encode(self.login, forKey: "login")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.id = aDecoder.decodeObject(forKey: "id") as? Int
        self.nickname = aDecoder.decodeObject(forKey: "nickname") as? String
        self.password = aDecoder.decodeObject(forKey: "password") as? String
        self.realname = aDecoder.decodeObject(forKey: "realname") as? String
        self.tel = aDecoder.decodeObject(forKey: "tel") as? String
        self.birthday = aDecoder.decodeObject(forKey: "birthday") as? String
        self.token = aDecoder.decodeObject(forKey: "token") as? String
        self.login = aDecoder.decodeObject(forKey: "login") as? Bool
    }
}
