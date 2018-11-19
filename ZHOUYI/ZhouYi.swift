//
//  ZhouYi.swift
//  ZHOUYI
//
//  Created by ZHUPF on 2018/11/19.
//  Copyright © 2018年 FENGYX. All rights reserved.
//

import UIKit
import WebKit

class ZhouYi: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var btGoBack: UIBarButtonItem!
    @IBOutlet weak var btGoForward: UIBarButtonItem!
    @IBOutlet weak var btStopLoading: UIBarButtonItem!
    @IBOutlet weak var btReload: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        let url = URL(string: "http://120.76.128.110:12510")
        let url = URL(string: "https://www.baidu.com")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    @IBAction func goBack(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func goForward(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func stopLoading(_ sender: Any) {
        webView.stopLoading()
    }
    
    @IBAction func reload(_ sender: Any) {
        webView.reload()
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
