//
//  Test.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/14.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class Test: UIViewController {
    
    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mTableView.frame = CGRect(x: 0, y: 0, width: 30, height: 500)
        
        // Do any additional setup after loading the view.
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
