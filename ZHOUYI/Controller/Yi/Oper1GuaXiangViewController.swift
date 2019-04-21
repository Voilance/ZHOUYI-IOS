//
//  Oper1GuaXiangViewController.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/20.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit
import SwiftHTTP

class Oper1GuaXiangViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
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
        buttonIndex = 1
        selectGuaXiang()
    }
    @IBAction func ClickGuaXiangButton2(_ sender: Any) {
        buttonIndex = 2
        selectGuaXiang()
    }
    @IBAction func ClickGuaXiangButton3(_ sender: Any) {
        buttonIndex = 3
        selectGuaXiang()
    }
    @IBAction func ClickGuaXiangButton4(_ sender: Any) {
        buttonIndex = 4
        selectGuaXiang()
    }
    @IBAction func ClickGuaXiangButton5(_ sender: Any) {
        buttonIndex = 5
        selectGuaXiang()
    }
    @IBAction func ClickGuaXiangButton6(_ sender: Any) {
        buttonIndex = 6
        selectGuaXiang()
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
    @IBAction func ClickOkButton(_ sender: Any) {
//        self.performSegue(withIdentifier: "Oper1GuaXiangToResult", sender: nil)
        self.saveHistory()
    }
    
    let GuaXiangNameList: [String] = ["阴变阳", "阳爻", "阴爻", "阳变阴"]
    let GuaXiangImageAList = [UIImage(named: "GA6"), UIImage(named: "GA7"), UIImage(named: "GA8"), UIImage(named: "GA9")]
    let GuaXiangImageBList = [UIImage(named: "GB6"), UIImage(named: "GB7"), UIImage(named: "GB8"), UIImage(named: "GB9")]
    var guaXiangButtonList: [UIButton] = []
    var guaXiangLabelList: [UILabel] = []
    var gua: Gua?
//    let PickRowHeight: CGFloat = 50
    var buttonIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guaXiangButtonList.append(GuaXiangButton1)
        guaXiangButtonList.append(GuaXiangButton2)
        guaXiangButtonList.append(GuaXiangButton3)
        guaXiangButtonList.append(GuaXiangButton4)
        guaXiangButtonList.append(GuaXiangButton5)
        guaXiangButtonList.append(GuaXiangButton6)
        guaXiangLabelList.append(GuaXiangLabel1)
        guaXiangLabelList.append(GuaXiangLabel2)
        guaXiangLabelList.append(GuaXiangLabel3)
        guaXiangLabelList.append(GuaXiangLabel4)
        guaXiangLabelList.append(GuaXiangLabel5)
        guaXiangLabelList.append(GuaXiangLabel6)
        
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
    
    func saveHistory() {
        let reqJson = ["guaxiang": gua?.guaXiang, "date": gua?.date, "yongshen": gua?.yongShen, "name": gua?.name, "reason": gua?.reason, "note": gua?.note, "way": gua?.method] as [String : Any]
        let reqHeader = ["x-zhouyi-token": GlobalUser.token!, "x-zhouyi-userid": String(GlobalUser.id!)]
        HTTP.POST(Api.SaveRecordUrl, parameters: reqJson, headers: reqHeader as [String : String], requestSerializer: JSONParameterSerializer()) { resp in
            do {
                let respJson = try JSONSerialization.jsonObject(with: resp.data, options: .mutableContainers) as AnyObject
//                let result = respJson.object(forKey: "result") as? String
//                let reason = respJson.object(forKey: "reason") as? String
                DispatchQueue.main.async {
                    
                    self.performSegue(withIdentifier: "Oper1GuaXiangToResult", sender: nil)
                }
            } catch {
                print("Save Result Error")
                print(error)
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GuaXiangCell", for: indexPath)
        cell.imageView?.image = GuaXiangImageBList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 58
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guaXiangButtonList[buttonIndex - 1].setImage(GuaXiangImageAList[indexPath.row], for: .normal)
        guaXiangLabelList[buttonIndex - 1].text = GuaXiangNameList[indexPath.row]
        gua?.guaXiang?[buttonIndex - 1] = indexPath.row + 6
        self.dismiss(animated: true, completion: nil)
        return
    }
    
    func selectGuaXiang() {
        let alert = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 270, height: 250))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GuaXiangCell")
        tableView.delegate = self
        tableView.dataSource = self
        let nAction = UIAlertAction(title: "取消", style: .default, handler: nil)
        alert.view.addSubview(tableView)
        alert.addAction(nAction)
//        alert.show(self, sender: nil)
        self.present(alert, animated: true, completion: nil)
    }
    
    
    func randomGuaXiang(index: Int) {
        let num = Int.random(in: 0..<4)
        self.gua?.guaXiang?[index - 1] = num + 6
        guaXiangButtonList[index - 1].setImage(self.GuaXiangImageAList[num], for: .normal)
        guaXiangLabelList[index - 1].text = self.GuaXiangNameList[num]
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        for i in 1..<7 {
            randomGuaXiang(index: i)
        }
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Oper1GuaXiangToResult" {
            let destination = segue.destination as! ResultViewController
            destination.gua = gua
        }
    }
 

}
