//
//  ButtonSetting.swift
//  SustainableApp
//
//  Created by Masaki on 10/27/1 R.
//  Copyright © 1 Reiwa Sugita Masaki. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class SettingButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var borderWidth: CGFloat = 0.0
    @IBInspectable var borderColor: UIColor = UIColor.clear

    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = (cornerRadius > 0)
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        
        super.draw(rect)
    }
}
