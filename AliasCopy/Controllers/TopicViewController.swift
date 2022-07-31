//
//  TopicViewController.swift
//  Alias
//
//  Created by Dyadichev on 27.07.2022.
//

import Foundation
import UIKit

class TopicViewController: UIViewController{
    
    let vStack = StackView()
    
    var selectionButton = UIButton.createButton(title: "Играть!", height: 63, color: .systemGreen, image: nil)
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
       return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = contentSize
        return contentView
    }()
    
    
    private var contentSize: CGSize{
        CGSize(width: view.frame.width, height: view.frame.height + 100)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectionButton.isHidden = true
        view.backgroundColor = .white
        addSubviews()
        targeting()
        settingConstraints()
    }
    
    func settingConstraints(){
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            
            selectionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            selectionButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            selectionButton.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -24)
        ])
    }
    
    
    func addSubviews(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(vStack)
        view.addSubview(selectionButton)
    }
    
    func targeting(){
        
        vStack.categoryOne.addTarget(
            self,
            action: #selector(categoryOne),
            for: .touchUpInside)
        
        vStack.categoryTwo.addTarget(
            self,
            action: #selector(categoryTwo),
            for: .touchUpInside)
        
        vStack.categoryThree.addTarget(
            self,
            action: #selector(categoryThree),
            for: .touchUpInside)
        
        vStack.categoryFour.addTarget(
            self,
            action: #selector(categoryFour),
            for: .touchUpInside)
        
        selectionButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
    }
    
    
    
    @objc func categoryOne(){
        clearSelection()
        print("category One")
        vStack.categoryOne.backgroundColor = .systemGreen
        selectionButton.isHidden = false
    }
    @objc func categoryTwo(){
        clearSelection()
        print("Category Two")
        vStack.categoryTwo.backgroundColor = .systemGreen
        selectionButton.isHidden = false
    }
    @objc func categoryThree(){
        clearSelection()
        print("Category Three")
        vStack.categoryThree.backgroundColor = .systemGreen
        selectionButton.isHidden = false
    }
    @objc func categoryFour(){
        clearSelection()
        print("Category Three")
        vStack.categoryFour.backgroundColor = .systemGreen
        selectionButton.isHidden = false
    }
    @objc func selectButtonTapped(){
        let gameViewController = GameViewController()
        
        gameViewController.modalPresentationStyle = .fullScreen
        gameViewController.modalTransitionStyle = .flipHorizontal
        navigationController?.pushViewController(gameViewController, animated: true)
        print("Selected")
    }
    
    func clearSelection(){
        vStack.categoryOne.backgroundColor = .systemBlue
        vStack.categoryTwo.backgroundColor = .systemBlue
        vStack.categoryThree.backgroundColor = .systemBlue
        vStack.categoryFour.backgroundColor = .systemBlue
    }
}
