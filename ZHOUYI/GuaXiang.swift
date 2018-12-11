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
        pickGuaXiang(inputRow: 1)
    }
    @IBAction func guaXiangButton2PickGuaXiang(_ sender: Any) {
        pickGuaXiang(inputRow: 2)
    }
    @IBAction func guaXiangButton3PickGuaXiang(_ sender: Any) {
        pickGuaXiang(inputRow: 3)
    }
    @IBAction func guaXiangButton4PickGuaXiang(_ sender: Any) {
        pickGuaXiang(inputRow: 4)
    }
    @IBAction func guaXiangButton5PickGuaXiang(_ sender: Any) {
        pickGuaXiang(inputRow: 5)
    }
    @IBAction func guaXiangButton6PickGuaXiang(_ sender: Any) {
        pickGuaXiang(inputRow: 6)
    }
    @IBAction func getRandomGuaXiang1(_ sender: Any) {
        pickRandomGuaXiang(inputRow: 1)
    }
    @IBAction func getRandomGuaXiang2(_ sender: Any) {
        pickRandomGuaXiang(inputRow: 2)
    }
    @IBAction func getRandomGuaXiang3(_ sender: Any) {
        pickRandomGuaXiang(inputRow: 3)
    }
    @IBAction func getRandomGuaXiang4(_ sender: Any) {
        pickRandomGuaXiang(inputRow: 4)
    }
    @IBAction func getRandomGuaXiang5(_ sender: Any) {
        pickRandomGuaXiang(inputRow: 5)
    }
    @IBAction func pickRandomGuaXiang6(_ sender: Any) {
        pickRandomGuaXiang(inputRow: 6)
    }
    
    var guaXiangPickerView: UIPickerView!
    let guaXiangNameList = ["阴变阳", "阳爻", "阴爻", "阳变阴"]
    let guaXiangAList = [UIImage(named: "GA6"), UIImage(named: "GA7"), UIImage(named: "GA8"), UIImage(named: "GA9")]
    let guaXiangBList = [UIImage(named: "GB6"), UIImage(named: "GB7"), UIImage(named: "GB8"), UIImage(named: "GB9")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.applicationSupportsShakeToEdit = true
        self.becomeFirstResponder()
        
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
            case 1:
                self.guaXiangButton1.setImage(self.guaXiangAList[row], for: UIControl.State.normal)
                self.guaXiangLabel1.text = self.guaXiangNameList[row]
                break;
            case 2:
                self.guaXiangButton2.setImage(self.guaXiangAList[row], for: UIControl.State.normal)
                self.guaXiangLabel2.text = self.guaXiangNameList[row]
                break;
            case 3:
                self.guaXiangButton3.setImage(self.guaXiangAList[row], for: UIControl.State.normal)
                self.guaXiangLabel3.text = self.guaXiangNameList[row]
                break;
            case 4:
                self.guaXiangButton4.setImage(self.guaXiangAList[row], for: UIControl.State.normal)
                self.guaXiangLabel4.text = self.guaXiangNameList[row]
                break;
            case 5:
                self.guaXiangButton5.setImage(self.guaXiangAList[row], for: UIControl.State.normal)
                self.guaXiangLabel5.text = self.guaXiangNameList[row]
                break;
            case 6:
                self.guaXiangButton6.setImage(self.guaXiangAList[row], for: UIControl.State.normal)
                self.guaXiangLabel6.text = self.guaXiangNameList[row]
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
    
    func pickRandomGuaXiang(inputRow: Int) -> Void {
        let randomNum = Int.random(in: 0..<4)
        switch inputRow {
        case 1:
            self.guaXiangButton1.setImage(self.guaXiangAList[randomNum], for: UIControl.State.normal)
            self.guaXiangLabel1.text = self.guaXiangNameList[randomNum]
            break;
        case 2:
            self.guaXiangButton2.setImage(self.guaXiangAList[randomNum], for: UIControl.State.normal)
            self.guaXiangLabel2.text = self.guaXiangNameList[randomNum]
            break;
        case 3:
            self.guaXiangButton3.setImage(self.guaXiangAList[randomNum], for: UIControl.State.normal)
            self.guaXiangLabel3.text = self.guaXiangNameList[randomNum]
            break;
        case 4:
            self.guaXiangButton4.setImage(self.guaXiangAList[randomNum], for: UIControl.State.normal)
            self.guaXiangLabel4.text = self.guaXiangNameList[randomNum]
            break;
        case 5:
            self.guaXiangButton5.setImage(self.guaXiangAList[randomNum], for: UIControl.State.normal)
            self.guaXiangLabel5.text = self.guaXiangNameList[randomNum]
            break;
        case 6:
            self.guaXiangButton6.setImage(self.guaXiangAList[randomNum], for: UIControl.State.normal)
            self.guaXiangLabel6.text = self.guaXiangNameList[randomNum]
            break;
        default:
            break;
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        for i in 1..<7 {
            pickRandomGuaXiang(inputRow: i)
        }
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
