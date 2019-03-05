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
    
    static let SignInUrl: String = PROTOCOL + HOST + PORT + "/web/UserLogin"
    static let SignUpUrl: String = PROTOCOL + HOST + PORT + "/web/UserSignUp"
    static let AuthTokenUrl: String = PROTOCOL + HOST + PORT + "/web/CheckLogin"
    static let SaveResultUrl: String = PROTOCOL + HOST + PORT + "/appLiuYao/newLiuYaoRecord"
    static let LoadResultUrl: String = PROTOCOL + HOST + PORT + "/appLiuYao/getLiuYaoRecord"
    static let ConvertDateUrl: String = PROTOCOL + HOST + PORT + "/be/GetTime"
    static let GetResult: String = PROTOCOL + "120.76.128.110" + ":8081" + "/table/item"
}
