//
//  Mine.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/10.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit

class Mine: UIViewController {
    
    // 控件
    @IBOutlet weak var avatarButton: UIButton!
    // 控件功能

    override func viewDidLoad() {
        super.viewDidLoad()

        avatarButton.imageView?.layer.cornerRadius = avatarButton.frame.width / 2
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
