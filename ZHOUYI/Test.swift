//
//  Test.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/14.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class Test: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mCell", for: indexPath)
        cell.textLabel?.text = "hi"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @IBOutlet weak var mtv: UITableView!
    @IBAction func test(_ sender: Any) {
        reloadView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mtv.delegate = self
        mtv.dataSource = self
        // Do any additional setup after loading the view.
//        reloadView()
        DispatchQueue.main.async {
            self.mtv.frame.size = CGSize(width: self.mtv.frame.width, height: 1000)
            self.mtv.reloadData()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func reloadView() {
        mtv.frame.size = CGSize(width: mtv.frame.width, height: 300)
        mtv.reloadData()
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
