//
//  About.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/14.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit

class About: UIViewController {
    
    // 控件
    @IBOutlet weak var Logo: UIImageView!
    // 控件功能

    override func viewDidLoad() {
        super.viewDidLoad()

        Logo.layer.cornerRadius = Logo.frame.width / 2
        Logo.layer.masksToBounds = true
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
