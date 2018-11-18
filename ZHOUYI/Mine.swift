//
//  Mine.swift
//  ZHOUYI
//
//  Created by Apple on 2018/11/18.
//  Copyright © 2018 FENGYX. All rights reserved.
//

import UIKit

class Mine: UITableViewController {
    
    var ACellList : [String] = [String]()
    
    func initList() {
        ACellList.append("设置")
        ACellList.append("关于")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        initList()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func exitFromLogin(_ segue : UIStoryboardSegue) {}

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return tableView.numberOfSections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        switch section {
        case 0: // 头像栏
            return 1
        case 1: // 空白栏:BlankCell0
            return 1
        case 2: // 基本设置栏，不随登陆与否变化
            return 2;
        default:
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Configure the cell...
        switch indexPath.section {
        case 0:
            let AvatarCell = tableView.dequeueReusableCell(withIdentifier: "AvatarCell", for: indexPath)
            AvatarCell.textLabel?.text = "This is Avatar Cell."
            return AvatarCell
        case 2:
            let ACell = tableView.dequeueReusableCell(withIdentifier: "ACell", for: indexPath)
            ACell.textLabel?.text = "This is A Cell."
            return ACell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "BlankCell0", for: indexPath)
            return cell
        }
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
