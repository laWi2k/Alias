//
//  UIButtonExtension.swift
//  Alias
//
//  Created by Daniel on 27.07.2022.
//

import Foundation
import UIKit

extension UIButton {
    class func createButton(title: String, height: CGFloat, color: UIColor, image: UIImage?) -> UIButton {
        
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = color
        button.layer.cornerRadius = 10
        button.titleLabel?.font = .systemFont(ofSize: 20)
        
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: height),
        ])
        
        //если есть картинка, то сетим ее на кнопку, если нет, то ничего не делаем
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.image = image
        
            button.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                imageView.widthAnchor.constraint(equalToConstant: 56),
                imageView.heightAnchor.constraint(equalToConstant: 56),
                imageView.centerYAnchor.constraint(equalTo: button.centerYAnchor),
                imageView.leadingAnchor.constraint(equalTo: button.leadingAnchor, constant: 19)
            ])
        return button
    }
}
