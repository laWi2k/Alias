//
//  UILabelExtension.swift
//  Alias
//
//  Created by Daniel on 29.07.2022.
//

import Foundation
import UIKit

extension UILabel{
    class func createLabel(text: String, size: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .boldSystemFont(ofSize: size)
        label.textColor = .black
        return label
    }
}
