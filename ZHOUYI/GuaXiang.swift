//
//  GuaXiang.swift
//  ZHOUYI
//
//  Created by Apple on 2018/12/11.
//  Copyright © 2018 FENGYX. All rights reserved.
//

import UIKit

class GuaXiang: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    // 控件
    @IBOutlet weak var guaXiangButton1: UIButton!
    @IBOutlet weak var guaXiangLabel1: UILabel!
    @IBOutlet weak var guaXiangButton2: UIButton!
    @IBOutlet weak var guaXiangLabel2: UILabel!
    @IBOutlet weak var guaXiangButton3: UIButton!
    @IBOutlet weak var guaXiangLabel3: UILabel!
    @IBOutlet weak var guaXiangButton4: UIButton!
    @IBOutlet weak var guaXiangLabel4: UILabel!
    @IBOutlet weak var guaXiangButton5: UIButton!
    @IBOutlet weak var guaXiangLabel5: UILabel!
    @IBOutlet weak var guaXiangButton6: UIButton!
    @IBOutlet weak var guaXiangLabel6: UILabel!
    // 控件功能
    @IBAction func guaXiangButton1PickGuaXiang(_ sender: Any) {
        pickGuaXiang(inputRow: 0)
    }
    
    var guaXiangPickerView: UIPickerView!
    let guaXiangNameList = ["阴变阳", "阳爻", "阴爻", "阳变阴"]
    let guaXiangAList = [UIImage(named: "GA6"), UIImage(named: "GA7"), UIImage(named: "GA8"), UIImage(named: "GA9")]
    let guaXiangBList = [UIImage(named: "GB6"), UIImage(named: "GB7"), UIImage(named: "GB8"), UIImage(named: "GB9")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guaXiangPickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 270, height: 120))
        guaXiangPickerView.delegate = self
        guaXiangPickerView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func pickGuaXiang(inputRow: Int) -> Void {
        let alert = UIAlertController(title: "\n\n\n\n\n", message: nil, preferredStyle: UIAlertController.Style.alert)
        let YAction = UIAlertAction(title: "确定", style: .default, handler: { action in
            let row = self.guaXiangPickerView.selectedRow(inComponent: 0)
            switch inputRow {
            case 0:
                self.guaXiangButton1.setImage(self.guaXiangAList[row], for: UIControl.State.normal)
                self.guaXiangLabel1.text = self.guaXiangNameList[row]
                break;
            default:
                break;
            }
        })
        let NAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.view.addSubview(guaXiangPickerView)
        alert.addAction(YAction)
        alert.addAction(NAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return guaXiangBList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 60
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 260, height: 60))
        imageView.image = guaXiangBList[row]
        return imageView
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
