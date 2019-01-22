//
//  tViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/22.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class tViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "s0" {
            let t = segue.destination as! Test
//            t.reloadView()
        }
        
    }
    

}
