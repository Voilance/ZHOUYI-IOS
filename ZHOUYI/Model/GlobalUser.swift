//
//  GlobalUser.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/17.
//  Copyright © 2019 FENGYX. All rights reserved.
//

// GlobalUser是用于保存当次登陆的用户的信息，便于各个Controller之间访问。
// 当用户信息出现变化时，利用User保存到本地

import Foundation

class GlobalUser: NSObject {
    
    static var id: Int? = nil          // 用户id
    static var nickname: String? = nil // 用户昵称
    static var password: String? = nil // 用户密码
    static var realname: String? = nil // 用户真实姓名
    static var tel: String? = nil      // 用户绑定的手机号码
    static var birthday: String? = nil // 用户出生日期（年、月）
    static var token: String? = nil    // 用户账号token
    static var login: Bool? = false    // 用户上次退出应用时是否处于登陆状态
    static var online: Bool? = false   // 用户是否已经成功登陆在线
    
    // 将用户信息保存到本地
    static func saveUserInfo() {
        let user: User = User(initID: self.id,
                              initNickname: self.nickname,
                              initPassword: self.password,
                              initRealname: self.realname,
                              initTel: self.tel,
                              initBirthday: self.birthday,
                              initToken: self.token,
                              initLogin: self.login)
        NSKeyedArchiver.archiveRootObject(user, toFile: User.ArchiveURL.path)
    }
    
    // 读取本地用户信息
    static func loadUserInfo() {
        if let user = NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User {
            self.id = user.id
            self.nickname = user.nickname
            self.password = user.password
            self.realname = user.realname
            self.tel = user.tel
            self.birthday = user.birthday
            self.token = user.token
            self.login = user.login
        }
    }
}
