//
//  tViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/22.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class tViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scoll: UIScrollView!
    @IBOutlet weak var stack: UIStackView!
    @IBOutlet weak var l1: UILabel!
    @IBOutlet weak var l2: UILabel!
    @IBOutlet weak var l3: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        scoll.contentSize=CGSize(width: 900, height: 300)
//        stack.frame=CGRect(x: 0, y: 0, width: 900, height: 300)
//        scoll.addSubview(stack)
        test()
    }
    
    func test() {
        let width = scoll.bounds.width
        let height = scoll.bounds.height
        scoll.contentSize = CGSize(width: width * 3, height: height)
        stack.frame = CGRect(x: 0, y: 0, width: width * 3, height: height)
        l1.text="l1"
        l2.text="l2"
        l3.text="l3"
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
    

}
