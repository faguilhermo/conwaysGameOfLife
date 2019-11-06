//
//  CustomButton.swift
//  gameLife
//
//  Created by Fabrício Guilhermo on 06/11/19.
//  Copyright © 2019 Fabrício Guilhermo. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? #colorLiteral(red: 0.6501478145, green: 0.002538838183, blue: 0.2694326841, alpha: 1) : #colorLiteral(red: 0.7500493597, green: 0, blue: 0.3168480506, alpha: 1)
        }
    }
}
