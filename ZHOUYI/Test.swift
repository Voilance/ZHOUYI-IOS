//
//  Test.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/14.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class Test: UIViewController, UITableViewDelegate, UITableViewDataSource, UIAlertViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    @IBAction func test(_ sender: Any) {
        show()
    }
    
    var mCell: UITableViewCell = UITableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
//        reloadView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func show() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
        let mtv = UITableView(frame: CGRect(x: 0, y: 0, width: 270, height: 200))
        mtv.delegate = self
        mtv.dataSource = self
        mtv.register(UITableViewCell.self, forCellReuseIdentifier: "mCell")
        let yAction = UIAlertAction(title: "y", style: .default, handler: nil)
        alert.view.addSubview(mtv)
        alert.addAction(yAction)
        self.present(alert, animated: true, completion: nil)
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
