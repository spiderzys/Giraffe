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
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context =  UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context!, UIColor.grayColor().CGColor)
        CGContextFillRect(context!,CGRectMake(0, CGRectGetHeight(self.frame) - 0.5, CGRectGetWidth(self.frame), 0.5))
        
    }
    
    
    
}
