//
//  Api.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/17.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import Foundation
import SwiftHTTP

class Api: NSObject {
    
    static let PROTOCOL: String = "http://"
    static let HOST: String = "120.76.128.110"
    static let PORT: String = ":12510"
    
    static let GetCaptchaUrl: String = PROTOCOL + HOST + PORT + "user/GetCAPTCHA"
    static let SignInUrl: String = PROTOCOL + HOST + PORT + "/user/UserLogin"
    static let SignUpUrl: String = PROTOCOL + HOST + PORT + "/user/UserSignUp"
    static let AuthTokenUrl: String = PROTOCOL + HOST + PORT + "/user/CheckLogin"
    static let EditInfoUrl: String = PROTOCOL + HOST + PORT + "/user/SetUserInfo"
    static let SaveRecordUrl: String = PROTOCOL + HOST + PORT + "/app/newRecord"
    static let LoadRecordUrl: String = PROTOCOL + HOST + PORT + "/app/getRecord"
    static let deleteRecordUrl: String = PROTOCOL + HOST + PORT + "/app/deleteRecord"
    static let ConvertDateUrl: String = PROTOCOL + HOST + PORT + "/be/GetTime"
    static let GetResult: String = PROTOCOL + HOST + ":8081" + "/table/item"
    static let GetHuGua: String = PROTOCOL + HOST + ":8081" + "/table/huGua"
    static let GetLiuYao: String = PROTOCOL + HOST + ":8081" + "/table/origin"
}
