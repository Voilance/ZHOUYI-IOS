//
//  SettingTableViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/22.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import ToastSwiftFramework

class SettingTableViewController: UITableViewController {
    
    let SettingList = [
        ("界面语言", ["界面语言"], ["简体中文"]),
        ("显示设定", ["六兽", "六亲"], ["全名", "全名"]),
        ("卜卦", ["数字卦", "时间卦", "长生排法", "早夜子"], ["...", "使用年干", "水土共长生", ""]),
        ("万年历", ["假期", "奇门时局"], ["中国", "拆补法"]),
        ("资料管理", ["导出", "导入"], ["", ""])
    ]
    let HeaderHeight: CGFloat = 30
    let RowHeight: CGFloat = 50

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "SettingCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return SettingList.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return SettingList[section].1.count
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return HeaderHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let label = UILabel(frame: CGRect(x: 10, y: 0, width: UIScreen.main.bounds.size.width, height: HeaderHeight))
        label.text = SettingList[section].0
        label.textColor = UIColor(red: 0.31, green: 0.31, blue: 0.31, alpha: 1.0)
        view.addSubview(label)
        tableView.addSubview(view)
        return view
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell", for: indexPath)
        cell.textLabel?.text = SettingList[indexPath.section].1[indexPath.row]
        cell.detailTextLabel?.text = SettingList[indexPath.section].2[indexPath.row]
        cell.detailTextLabel?.textColor = UIColor(red: 0.18, green: 0.49, blue: 0.96, alpha: 1.0)
        if SettingList[indexPath.section].1[indexPath.row] == "早夜子" {
            let sb = UISwitch(frame: CGRect(x: UIScreen.main.bounds.size.width - 100, y: 10, width: 100, height: 30))
            cell.addSubview(sb)
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return RowHeight
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(SettingList[indexPath.section].1[indexPath.row])
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
