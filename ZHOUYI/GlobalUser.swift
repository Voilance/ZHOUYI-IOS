//
//  GlobalUser.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/8.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import Foundation

class GlobalUser: NSObject {
    
    // (全局变量)用户的基本属性(及set和get方法)
    static var name: String? = ""
    static var password: String? = ""
    static var tel: String? = ""
    static var token: String? = ""
    
    static func getGlobalUserName() -> String? {
        return self.name
    }
    static func setGlobalUserName(inputName: String?) -> Void {
        self.name = inputName
    }
    static func getGlobalUserPassword() -> String? {
        return self.password
    }
    static func setGlobalUserPassword(inputPassword: String?) -> Void {
        self.password = inputPassword
    }
    static func getGlobalUserTel() -> String? {
        return self.tel
    }
    static func setGlobalUserTel(inputTel: String?) -> Void {
        self.tel = inputTel
    }
    static func getGlobalUserToken() -> String? {
        return self.token
    }
    static func setGlobalUserToken(inputToken: String?) -> Void {
        self.token = inputToken
    }
    
    // “初始化”全局用户属性
    static func initGlobalUser(inputName: String?, inputPassword: String?, inputTel: String?, inputToken: String?) -> Void {
        setGlobalUserName(inputName: inputName)
        setGlobalUserPassword(inputPassword: inputPassword)
        setGlobalUserTel(inputTel: inputTel)
        setGlobalUserToken(inputToken: inputToken)
    }
    
    // 保存用户数据
    static func saveGlobalUserData() -> Void {
        let user: User = User(inputName: self.name, inputPassword: self.password, inputTel: self.tel, inputToken: self.token)
        let saveSucceed = NSKeyedArchiver.archiveRootObject(user, toFile: User.ArchiveURL.path)
        if !saveSucceed {
            print("Save Global User Data failed!")
        }
    }
    
    // 读取用户数据
    static func loadGlobalUserData() -> Void {
        if let user = NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User {
            initGlobalUser(inputName: user.name, inputPassword: user.password, inputTel: user.tel, inputToken: user.token)
        }
    }
}
