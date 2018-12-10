//
//  TestUIViewController.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/10.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit

class TestUIViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var mTableView: UITableView!
    @IBAction func onTest(_ sender: Any) {
        list.append("B")
        mTableView.reloadData()
        
    }
    
    var list: [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mTableView.delegate = self
        mTableView.dataSource = self
        list.append("A")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "this is cell"
        return cell
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
