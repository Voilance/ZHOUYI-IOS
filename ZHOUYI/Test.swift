//
//  Test.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/14.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class Test: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var mCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mCollectionView.delegate = self
        mCollectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var mCell: GuaXiangCollectionViewCell = GuaXiangCollectionViewCell(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        mCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mCell", for: indexPath) as! GuaXiangCollectionViewCell
//        mCell.setImage(image: UIImage(named: "default_avatar")!)
        mCell.setTitle(title: "hi")
        return mCell
    }
    
    func select() {
    
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
