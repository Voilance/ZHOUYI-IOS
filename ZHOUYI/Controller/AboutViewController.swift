//
//  AboutViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/18.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var AvatarImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 设置圆形Icon
        AvatarImageView.layer.masksToBounds = true
        AvatarImageView.layer.cornerRadius = AvatarImageView.frame.width / 2
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
