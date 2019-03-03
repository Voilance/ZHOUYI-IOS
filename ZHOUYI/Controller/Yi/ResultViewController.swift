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
    
    // 控件
    // 六神
    @IBOutlet weak var LiuShen0: UILabel!
    @IBOutlet weak var LiuShen1: UILabel!
    @IBOutlet weak var LiuShen2: UILabel!
    @IBOutlet weak var LiuShen3: UILabel!
    @IBOutlet weak var LiuShen4: UILabel!
    @IBOutlet weak var LiuShen5: UILabel!
    var LiuShenList: [UILabel] = []
    // 六亲
    @IBOutlet weak var LiuQin0: UILabel!
    @IBOutlet weak var LiuQin1: UILabel!
    @IBOutlet weak var LiuQin2: UILabel!
    @IBOutlet weak var LiuQin3: UILabel!
    @IBOutlet weak var LiuQin4: UILabel!
    @IBOutlet weak var LiuQin5: UILabel!
    var LiuQinList: [UILabel] = []
    // 本卦
    @IBOutlet weak var BenGua0: UIImageView!
    @IBOutlet weak var BenGua1: UIImageView!
    @IBOutlet weak var BenGua2: UIImageView!
    @IBOutlet weak var BenGua3: UIImageView!
    @IBOutlet weak var BenGua4: UIImageView!
    @IBOutlet weak var BenGua5: UIImageView!
    var BenGuaList: [UIImageView] = []
    
    // 控件功能
    
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
    
    func initView() {
        LiuShenList.append(LiuShen0)
        LiuShenList.append(LiuShen1)
        LiuShenList.append(LiuShen2)
        LiuShenList.append(LiuShen3)
        LiuShenList.append(LiuShen4)
        LiuShenList.append(LiuShen5)
        
        LiuQinList.append(LiuQin0)
        LiuQinList.append(LiuQin1)
        LiuQinList.append(LiuQin2)
        LiuQinList.append(LiuQin3)
        LiuQinList.append(LiuQin4)
        LiuQinList.append(LiuQin5)
        
        BenGuaList.append(BenGua0)
        BenGuaList.append(BenGua1)
        BenGuaList.append(BenGua2)
        BenGuaList.append(BenGua3)
        BenGuaList.append(BenGua4)
        BenGuaList.append(BenGua5)
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
    
    func getResult() {
        HTTP.POST(Api.GetResult, parameters: guaXiang, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                
            } catch {
                print("Get Result Error")
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
