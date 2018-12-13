//
//  TestUIViewController.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/12/10.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit
import ToastSwiftFramework

class TestUIViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var timeLabel: UITextField!
    @IBOutlet weak var label: UILabel!
    
    @IBAction func onTest(_ sender: Any) {
        
        
    }
    @IBAction func showDatePicker(_ sender: Any) {
        self.view.makeToast("click")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        button.titleLabel?.numberOfLines = 0
        button.setAttributedTitle(fuWenBen(), for: UIControl.State.normal)
        // Do any additional setup after loading the view.
    }
    
    func fuWenBen() -> NSMutableAttributedString {
        let ns = NSMutableAttributedString()
        let a = NSAttributedString.init(string: "a  ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        let b = NSAttributedString.init(string: "b\n", attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
        let c = NSAttributedString.init(string: "c  ", attributes: [NSAttributedString.Key.foregroundColor : UIColor.red])
        let d = NSAttributedString.init(string: "d", attributes: [NSAttributedString.Key.foregroundColor : UIColor.blue])
        ns.append(a)
        ns.append(b)
        ns.append(c)
        ns.append(d)
        return ns
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
