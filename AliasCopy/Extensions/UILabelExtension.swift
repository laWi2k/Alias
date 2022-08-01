//
//  UILabelExtension.swift
//  Alias
//
//  Created by Daniel on 29.07.2022.
//

import Foundation
import UIKit
extension UILabel {
class func createLabel(text: String, font: CGFloat, color: UIColor) -> UILabel {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = color
        label.font = .systemFont(ofSize: font)
        label.text = text
        //Автомат ресайз по ширине от сайза экрана.
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }
}

