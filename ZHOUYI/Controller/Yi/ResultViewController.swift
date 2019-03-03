//
//  ResultViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/3/3.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class ResultViewController: UIViewController {
    
    
    var date: String?
    var yongShen: String?
    var reason: String?
    var name: String?
    var note: String?
    var guaXiang: [Int] = [6, 6, 6, 6, 6, 6]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func convertDate() {
        let reqJson = ["time": date]
        HTTP.POST(Api.ConvertDateUrl, parameters: reqJson, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let year = respJson.object(forKey: "year") as? String
                let month = respJson.object(forKey: "month") as? String
                let day = respJson.object(forKey: "day") as? String
                
            } catch {
                print("Convert Date Error")
                print(error)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
