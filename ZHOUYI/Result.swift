//
//  Result.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/3.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class Result: UIViewController {

    // 起卦日期
    var date: String? = "2019-01-01"
    // 起卦天干列表[日,月,年]
    var dateList: [String?] = ["日", "月", "年"]
    // 起卦卦象列表
    var guaXiangList: [Int?] = [9, 7, 7, 7, 7, 8]
    // 六神表
    var LiuShenList: [String] = ["青龙", "朱雀", "勾陈", "螣蛇", "白虎", "玄武"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onGetLiuShen(inputDay: "甲")
        onGetLiuShen(inputDay: "乙")
        onGetLiuShen(inputDay: "丙")
        onGetLiuShen(inputDay: "丁")
        onGetLiuShen(inputDay: "戊")
        onGetLiuShen(inputDay: "己")
        onGetLiuShen(inputDay: "庚")
        onGetLiuShen(inputDay: "辛")
        onGetLiuShen(inputDay: "0")
//        onGetDate()
//        onGetResult()
        // Do any additional setup after loading the view.
    }
    
    // 用起卦日期"yyyy-mm-dd"换算日月年的天干表示，并算出六神表顺序
    func onGetDate() -> Void {
        let requestJson = ["time": date]
        HTTP.POST("http://120.76.128.110:12510/be/GetTime", parameters: requestJson, requestSerializer: JSONParameterSerializer()) { response in
            do {
                let responseJson = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as AnyObject
                let day = responseJson.object(forKey: "day") as? String
                let month = responseJson.object(forKey: "month") as? String
                let year = responseJson.object(forKey: "year") as? String
                self.dateList[0] = day
                self.dateList[1] = month
                self.dateList[2] = year
                self.onGetLiuShen(inputDay: self.getSubCharacterAsString(inputString: day, inputIndex: 0))
            } catch {
                print("onGetDate:")
                print(error)
            }
        }
    }
    
    // 获取卜卦的结果
    func onGetResult() -> Void {
        HTTP.POST("http://119.23.76.43:8081/table/item", parameters: guaXiangList, requestSerializer: JSONParameterSerializer()) { response in
            do {
                let responseJson = try JSONSerialization.jsonObject(with: response.data, options: .mutableContainers) as AnyObject
                print(responseJson)
            } catch {
                print("onGetResult:")
                print(error)
            }
        }
    }
    
    // 根据下标以String的类型返回字符串的字符
    func getSubCharacterAsString(inputString: String?, inputIndex: Int) -> String {
        var str = ""
        let len = inputString?.count
        if inputIndex < len! {
            let startIndex = inputString?.index((inputString?.startIndex)!, offsetBy: inputIndex)
            let endIndex = inputString?.index((inputString?.startIndex)!, offsetBy: inputIndex + 1)
            str = String(inputString![startIndex!..<endIndex!])
        }
        return str
    }
    
    // 返回字符串的竖式形式
    func getVerticalString(inputString: String?) -> String {
        let len = inputString?.count
        var str: String = ""
        for i in 0..<len! {
            let startIndex = inputString?.index((inputString?.startIndex)!, offsetBy: i)
            let endIndex = inputString?.index((inputString?.startIndex)!, offsetBy: i + 1)
            str += String(inputString![startIndex!..<endIndex!])
            if (i + 1 < len!) {
                str += "\n"
            }
        }
        return str
    }
    
    // 根据日期的天干初始化六神表
    func onGetLiuShen(inputDay: String?) -> Void {
        let list = ["青龙", "朱雀", "勾陈", "螣蛇", "白虎", "玄武"]
        var index = 0
        if inputDay == "甲" || inputDay == "乙" {
            index = 0
        } else if inputDay == "丙" || inputDay == "丁" {
            index = 1
        } else if inputDay == "戊" {
            index = 2
        } else if inputDay == "己" {
            index = 3
        } else if inputDay == "庚" || inputDay == "辛" {
            index = 4
        } else {
            index = 5
        }
        for i in 0..<6 {
            LiuShenList[i] = list[(index + i) % 6]
        }
        print(LiuShenList)
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
