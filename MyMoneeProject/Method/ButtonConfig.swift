//
//  ButtonConfig.swift
//  MyMoneeProject
//
//  Created by MacBook on 15/05/21.
//

import Foundation
import UIKit

func disabledBtn(_ button: UIButton){
    button.isUserInteractionEnabled = false
    button.isEnabled = false
    button.backgroundColor = Colors.mainGrey
}

func enabledBtn(_ button: UIButton){
    button.isUserInteractionEnabled = true
    button.isEnabled = true
    button.backgroundColor = Colors.mainBlue
}
