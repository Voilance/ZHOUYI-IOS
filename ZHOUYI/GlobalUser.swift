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
    static var id: Int? = nil
    static var name: String? = nil
    static var password: String? = nil
    static var tel: String? = nil
    static var token: String? = nil
    static var login: Bool? = false
    static var online: Bool? = false
    
    static func getGlobalUserID() -> Int? {
        return self.id
    }
    static func setGlobalUserID(inputId: Int?) -> Void {
        self.id = inputId
    }
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
    static func getGlobalUserLogin() -> Bool? {
        return self.login
    }
    static func setGlobalUserLogin(inputLogin: Bool?) -> Void {
        self.login = inputLogin
    }
    static func getGlobalUserOnline() -> Bool? {
        return self.online
    }
    static func setGlobalUserOnline(inputOnline: Bool?) -> Void {
        self.online = inputOnline
    }
    
    // “初始化”全局用户属性
    static func initGlobalUser(inputId: Int?, inputName: String?, inputPassword: String?, inputTel: String?, inputToken: String?, inputLogin: Bool?) -> Void {
        setGlobalUserID(inputId: inputId)
        setGlobalUserName(inputName: inputName)
        setGlobalUserPassword(inputPassword: inputPassword)
        setGlobalUserTel(inputTel: inputTel)
        setGlobalUserToken(inputToken: inputToken)
        setGlobalUserLogin(inputLogin: inputLogin)
    }
    
    // 保存用户数据
    static func saveGlobalUserData() -> Void {
        let user: User = User(inputId: self.id, inputName: self.name, inputPassword: self.password, inputTel: self.tel, inputToken: self.token, inputLogin: self.login)
        let saveSucceed = NSKeyedArchiver.archiveRootObject(user, toFile: User.ArchiveURL.path)
        if !saveSucceed {
            print("Save Global User Data failed!")
        }
    }
    
    // 读取用户数据
    static func loadGlobalUserData() -> Void {
        if let user = NSKeyedUnarchiver.unarchiveObject(withFile: User.ArchiveURL.path) as? User {
            initGlobalUser(inputId: user.id, inputName: user.name, inputPassword: user.password, inputTel: user.tel, inputToken: user.token, inputLogin: user.login)
        }
    }
}
