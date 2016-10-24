//
//  loginTextField.swift
//  Giraffe
//
//  Created by YANGSHENG ZOU on 2016-07-07.
//  Copyright © 2016 YANGSHENG ZOU. All rights reserved.
//

import UIKit

class loginTextField: UITextField {

    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        let context =  UIGraphicsGetCurrentContext()
        context!.setFillColor(UIColor.gray.cgColor)
        context!.fill(CGRect(x: 0, y: self.frame.height - 0.5, width: self.frame.width, height: 0.5))
        
    }
    
    
    
}
