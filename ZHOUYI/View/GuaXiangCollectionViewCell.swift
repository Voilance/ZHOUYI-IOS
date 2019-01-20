//
//  GuaXiangCollectionViewCell.swift
//  ZHOUYI
//
//  Created by 祝鹏富 on 2019/1/20.
//  Copyright © 2019 FENGYX. All rights reserved.
//

import UIKit

class GuaXiangCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var GuaXiangButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setImage(image: UIImage) {
        self.GuaXiangButton.setImage(image, for: .normal)
    }
    
    func setTitle(title: String?) {
        self.GuaXiangButton.setTitle(title, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
}
