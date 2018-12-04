//
//  text.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/3.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit

class text: UIViewController {
    
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text = "空" + "\n" + "空";
        // Do any additional setup after loading the view.
    }
    
    func initStackView() {
        
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
