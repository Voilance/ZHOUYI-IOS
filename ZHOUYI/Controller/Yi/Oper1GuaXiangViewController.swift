//
//  Oper1GuaXiangViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/20.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class Oper1GuaXiangViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    // 控件
    @IBOutlet weak var GuaXiangButton1: UIButton!
    @IBOutlet weak var GuaXiangButton2: UIButton!
    @IBOutlet weak var GuaXiangButton3: UIButton!
    @IBOutlet weak var GuaXiangButton4: UIButton!
    @IBOutlet weak var GuaXiangButton5: UIButton!
    @IBOutlet weak var GuaXiangButton6: UIButton!
    @IBOutlet weak var GuaXiangLabel1: UILabel!
    @IBOutlet weak var GuaXiangLabel2: UILabel!
    @IBOutlet weak var GuaXiangLabel3: UILabel!
    @IBOutlet weak var GuaXiangLabel4: UILabel!
    @IBOutlet weak var GuaXiangLabel5: UILabel!
    @IBOutlet weak var GuaXiangLabel6: UILabel!
    @IBOutlet weak var RandomButton1: UIButton!
    @IBOutlet weak var RandomButton2: UIButton!
    @IBOutlet weak var RandomButton3: UIButton!
    @IBOutlet weak var RandomButton4: UIButton!
    @IBOutlet weak var RandomButton5: UIButton!
    @IBOutlet weak var RandomButton6: UIButton!
    // 控件功能
    @IBAction func ClickGuaXiangButton1(_ sender: Any) {
        selectGuaXiang(index: 1)
    }
    @IBAction func ClickGuaXiangButton2(_ sender: Any) {
        selectGuaXiang(index: 2)
    }
    @IBAction func ClickGuaXiangButton3(_ sender: Any) {
        selectGuaXiang(index: 3)
    }
    @IBAction func ClickGuaXiangButton4(_ sender: Any) {
        selectGuaXiang(index: 4)
    }
    @IBAction func ClickGuaXiangButton5(_ sender: Any) {
        selectGuaXiang(index: 5)
    }
    @IBAction func ClickGuaXiangButton6(_ sender: Any) {
        selectGuaXiang(index: 6)
    }
    @IBAction func ClickRandomButton1(_ sender: Any) {
        randomGuaXiang(index: 1)
    }
    @IBAction func ClickRandomButton2(_ sender: Any) {
        randomGuaXiang(index: 2)
    }
    @IBAction func ClickRandomButton3(_ sender: Any) {
        randomGuaXiang(index: 3)
    }
    @IBAction func ClickRandomButton4(_ sender: Any) {
        randomGuaXiang(index: 4)
    }
    @IBAction func ClickRandomButton5(_ sender: Any) {
        randomGuaXiang(index: 5)
    }
    @IBAction func ClickRandomButton6(_ sender: Any) {
        randomGuaXiang(index: 6)
    }
    
    let GuaXiangNameList: [String] = ["阴变阳", "阳爻", "阴爻", "阳变阴"]
    let GuaXiangImageAList = [UIImage(named: "GA6"), UIImage(named: "GA7"), UIImage(named: "GA8"), UIImage(named: "GA9")]
    let GuaXiangImageBList = [UIImage(named: "GB6"), UIImage(named: "GB7"), UIImage(named: "GB8"), UIImage(named: "GB9")]
    var date: String?
    var yongShen: String?
    var reason: String?
    var name: String?
    var note: String?
    var guaXiang: [Int] = [6, 6, 6, 6, 6, 6]
    let PickRowHeight: CGFloat = 50

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        RandomButton1.layer.masksToBounds = true
        RandomButton1.layer.cornerRadius = 5
        RandomButton2.layer.masksToBounds = true
        RandomButton2.layer.cornerRadius = 5
        RandomButton3.layer.masksToBounds = true
        RandomButton3.layer.cornerRadius = 5
        RandomButton4.layer.masksToBounds = true
        RandomButton4.layer.cornerRadius = 5
        RandomButton5.layer.masksToBounds = true
        RandomButton5.layer.cornerRadius = 5
        RandomButton6.layer.masksToBounds = true
        RandomButton6.layer.cornerRadius = 5
        
        UIApplication.shared.applicationSupportsShakeToEdit = true
        self.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return GuaXiangImageBList.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return PickRowHeight
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 220, height: 50))
        imageView.image = GuaXiangImageBList[row]
        return imageView
    }
    
    func selectGuaXiang(index: Int) {
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
        let guaXiangPicker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 270, height: 200))
        guaXiangPicker.delegate = self
        guaXiangPicker.dataSource = self
        let yAction = UIAlertAction(title: "确定", style: .default, handler: { action in
            let row = guaXiangPicker.selectedRow(inComponent: 0)
            self.guaXiang[index - 1] = row + 6
            switch index {
            case 1:
                self.GuaXiangButton1.setImage(self.GuaXiangImageAList[row], for: .normal)
                self.GuaXiangLabel1.text = self.GuaXiangNameList[row]
                break;
            case 2:
                self.GuaXiangButton2.setImage(self.GuaXiangImageAList[row], for: .normal)
                self.GuaXiangLabel2.text = self.GuaXiangNameList[row]
                break;
            case 3:
                self.GuaXiangButton3.setImage(self.GuaXiangImageAList[row], for: .normal)
                self.GuaXiangLabel3.text = self.GuaXiangNameList[row]
                break;
            case 4:
                self.GuaXiangButton4.setImage(self.GuaXiangImageAList[row], for: .normal)
                self.GuaXiangLabel4.text = self.GuaXiangNameList[row]
                break;
            case 5:
                self.GuaXiangButton5.setImage(self.GuaXiangImageAList[row], for: .normal)
                self.GuaXiangLabel5.text = self.GuaXiangNameList[row]
                break;
            case 6:
                self.GuaXiangButton6.setImage(self.GuaXiangImageAList[row], for: .normal)
                self.GuaXiangLabel6.text = self.GuaXiangNameList[row]
                break;
            default:
                break;
            }
        })
        let nAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        alert.view.addSubview(guaXiangPicker)
        alert.addAction(yAction)
        alert.addAction(nAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func randomGuaXiang(index: Int) {
        let num = Int.random(in: 0..<4)
        self.guaXiang[index - 1] = num + 6
        switch index {
        case 1:
            self.GuaXiangButton1.setImage(self.GuaXiangImageAList[num], for: .normal)
            self.GuaXiangLabel1.text = self.GuaXiangNameList[num]
            break;
        case 2:
            self.GuaXiangButton2.setImage(self.GuaXiangImageAList[num], for: .normal)
            self.GuaXiangLabel2.text = self.GuaXiangNameList[num]
            break;
        case 3:
            self.GuaXiangButton3.setImage(self.GuaXiangImageAList[num], for: .normal)
            self.GuaXiangLabel3.text = self.GuaXiangNameList[num]
            break;
        case 4:
            self.GuaXiangButton4.setImage(self.GuaXiangImageAList[num], for: .normal)
            self.GuaXiangLabel4.text = self.GuaXiangNameList[num]
            break;
        case 5:
            self.GuaXiangButton5.setImage(self.GuaXiangImageAList[num], for: .normal)
            self.GuaXiangLabel5.text = self.GuaXiangNameList[num]
            break;
        case 6:
            self.GuaXiangButton6.setImage(self.GuaXiangImageAList[num], for: .normal)
            self.GuaXiangLabel6.text = self.GuaXiangNameList[num]
            break;
        default:
            break;
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        for i in 1..<7 {
            randomGuaXiang(index: i)
        }
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
