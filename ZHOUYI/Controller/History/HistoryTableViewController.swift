//
//  HistoryTableViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/23.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class HistoryTableViewController: UITableViewController {
    
    var resultList: [Gua] = []
    var resultPage: Int = 1
    let RowHeight: CGFloat = 50
    
    @IBAction func Exit (_ segue: UIStoryboardSegue) {
        if let selectIndexPath = tableView.indexPathForSelectedRow {
            deleteRecord(id: (resultList[selectIndexPath.row].id)!, row: selectIndexPath.row)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        GlobalUser.loadUserInfo()
        if !(GlobalUser.online ?? false) && (GlobalUser.login ?? false) {
            authenticateToken()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if !(GlobalUser.online ?? false) {
            return
        } else {
            resultList = []
            self.resultPage = 1
            loadHistory(page: resultPage)
        }
    }
    
    // 验证token，如果token有效则尝试自动登录
    func authenticateToken () {
        let reqJson = ["id": GlobalUser.id, "token": GlobalUser.token] as [String : Any]
        HTTP.POST(Api.AuthTokenUrl, parameters: reqJson, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let result = respJson.object(forKey: "result") as? String
                if result == "success" {
                    self.autoSignIn()
                }
            } catch {
                print("Authenticate Token Error:")
                print(error)
            }
        }
    }
    
    // 验证token成功之后，尝试自动登录
    func autoSignIn() {
        let reqJson = ["name": GlobalUser.nickname, "password": GlobalUser.password]
        HTTP.POST(Api.SignInUrl, parameters: reqJson, requestSerializer: JSONParameterSerializer()) {resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let result = respJson.object(forKey: "result") as? String
                if result == "success" {
                    GlobalUser.id = respJson.object(forKey: "userId") as? Int
                    GlobalUser.realname = respJson.object(forKey: "realname") as? String
                    GlobalUser.tel = respJson.object(forKey: "phone") as? String
                    GlobalUser.birthday = respJson.object(forKey: "birthYM") as? String
                    GlobalUser.token = respJson.object(forKey: "token") as? String
                    GlobalUser.login = true
                    GlobalUser.online = true
                    GlobalUser.saveUserInfo()
                    
                    self.loadHistory(page: self.resultPage)
                }
            } catch {
                print("Sign In Error:")
                print(error)
            }
        }
    }
    
    
    func loadHistory(page: Int) {
        let reqJson = ["method": "time", "keyword": nil, "page": page] as [String : Any?]
        let reqHeader = ["x-zhouyi-token": GlobalUser.token!, "x-zhouyi-userid": String(GlobalUser.id!)]
        HTTP.POST(Api.LoadRecordUrl, parameters: reqJson, headers: reqHeader as [String : String], requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                let result = respJson.object(forKey: "result") as? String
                let reason = respJson.object(forKey: "reason") as? String
                if (result == "success") {
                    let record = respJson.object(forKey: "record") as! [AnyObject]
                    self.resultPage += 1
                    DispatchQueue.main.async {
                        for s in record {
                            self.resultList.append(Gua(initJson: s))
                        }
                        self.tableView.reloadData()
                    }
                }
            } catch {
                print("Load History Error")
                print(error)
            }
        }
    }
    
    
    
    func deleteRecord(id: String, row: Int) {
        let reqJson = ["id": id]
        let reqHeader = ["x-zhouyi-token": GlobalUser.token!, "x-zhouyi-userid": String(GlobalUser.id!)]
        HTTP.POST(Api.deleteRecordUrl, parameters: reqJson, headers: reqHeader, requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
                print(respJson)
                let result = respJson.object(forKey: "result") as? String
                if result == "success" {
                    DispatchQueue.main.async {
                        self.resultList.remove(at: row)
                        self.tableView.reloadData()
                    }
                }
            } catch {
                print("Delete Record Error")
                print(error)
            }
        }
    }
    
    func getWeek(date: String) -> String {
        // 取日期的年月日
        let d: String = String(date.prefix(10))
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd"
        let weekdayFormat = DateFormatter()
        weekdayFormat.dateFormat = "EEEE"
        let weekday = weekdayFormat.string(from: dateFormat.date(from: d)!)
        switch weekday {
        case "Sunday":
            return d + " 日"
        case "Monday":
            return d + " 一"
        case "Tuesday":
            return d + " 二"
        case "Wednesday":
            return d + " 三"
        case "Thursday":
            return d + " 四"
        case "Friday":
            return d + " 五"
        case "Saturday":
            return d + " 六"
        default:
            return d
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return resultList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath)
        let reason = resultList[indexPath.row].reason
        if reason?.count ?? 0 > 15 {
            let r = reason?.prefix(15)
            cell.textLabel?.text = String(r!) + "..."
        } else {
            cell.textLabel?.text = reason
        }
        cell.detailTextLabel?.text = resultList[indexPath.row].name! + "(" + self.getWeek(date: resultList[indexPath.row].date!) + ")"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RowHeight
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
//            tableView.deleteRows(at: [indexPath], with: .fade)
//            resultList.remove(at: indexPath.row)
//            tableView.reloadData()
            deleteRecord(id: (resultList[indexPath.row].id)!, row: indexPath.row)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "HistoryToHistoryReason" {
            let destination = segue.destination as! HistoryReasonViewController
            if let cell = sender as? UITableViewCell {
                let indexPath = tableView.indexPath(for: cell)
                let result = resultList[(indexPath)!.row]
                destination.gua = result
            }
        }
    }
 

}
