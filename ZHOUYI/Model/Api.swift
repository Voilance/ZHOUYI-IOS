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
    
    static let SignInUrl: String =  "http://120.76.128.110:12510/web/UserLogin"
    
    static func signIn(nickname: String?, password: String?) -> Bool {
        var result: Bool = false
        let reqJson = ["name": nickname, "password": password]
        HTTP.POST(SignInUrl, parameters: reqJson, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                print(respJson)
                result = true
                print(result)
                
                DispatchQueue.main.async {
                    return true
                }
            } catch {
                print("Sign In Error:")
                print(error)
            }
        }
        return result
    }
}
