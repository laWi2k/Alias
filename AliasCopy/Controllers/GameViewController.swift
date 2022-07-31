//
//  GameViewController.swift
//  Alias
//
//  Created by Dyadichev on 27.07.2022.
//

import Foundation
import UIKit

class GameViewController: UIViewController{
    
    //MARK: - let/var
    var aliasTimer = Timer()
    var time = 70
    
//    let aliasManager = AliasManager()
    //MARK: - Properties
    ///Главный стек-вью содержащий в себе Label и Button Stack.
    private let stackButtonsView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.layer.cornerRadius = 6
        return stack
    }()
    ///Лейбл отсчёта одной минуты до конца игры.
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 40)
        label.textColor = .black
        label.text = "1:00"
        //Автомат ресайз по ширине от сайза экрана.
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .center
        return label
    }()
    ///Лейбл слова которого нужно угадать
    private lazy var guessWordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 48)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.text = "Картошка"
        label.textAlignment = .center
        return label
    }()
    ///Серая кнопка сброса игры
    private let showAlertButton: UIButton = .createButton(title: "Сбросить", height: 60, color: .systemGray, image: nil)
    ///Зеленая кнопка правильного ответа.
    private let correctButton: UIButton = .createButton(title: "Правильно", height: 60, color: .systemGreen, image: nil)
    ///Красная кнопка пропуска вопроса
    private let skipButton: UIButton = . createButton(title: "Пропустить", height: 60, color: .systemRed, image: nil)
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        localParse()
//        load()
        layout()
        startTimer()
        showAlertButton.addTarget(self, action: #selector(showAlertTapped), for: .touchUpInside)
        
        
    }
    
    //MARK: - Methods
    
//    func load() {
//        loadJson(fromURLString: urlString) { (result) in
//            switch result {
//            case .success(let data):
//                parse(jsonData: data)
//            case .failure(let error):
//                print(error)
//            }
//        }
//    }
//
//    func localParse() {
//        if let localData = readLocalFile(forName: "simpleJson") {
//            parse(jsonData: localData)
//        }
//    }
    
    ///Функция запуска таймера
    private func startTimer() {
        aliasTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    private func stopTimer() {
        aliasTimer.invalidate()
    }
    ///Счётчик таймера
    @objc func updateTimer() {
        if time > 0 {
            time -= 1
//            guessWordLabel.text = aliasManager.words.randomElement()
            timerLabel.text = formatTime()
        }  else if time == 0 {
            stopTimer()
            timerLabel.text = "Конец"
        }
    }
    ///Форматирование Int в String
    private func formatTime() -> String {
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format:"%02i:%02i", minutes, seconds)
    }
    
    ///Алерт  кнопки сброса игры и перехода в ViewController.
    @objc func showAlertTapped() {
        let alert = UIAlertController(
            title: "Сбросить игру",
            message: "Вы хотите сбросить вашу игру и вернуться в меню?",
            preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(
            title: "Отмена",
            style: .cancel,
            handler: { _ in
                print("Кнопка отмены в GameVc-Alert нажата")
            })
        ///Добавление кнопки "Отмена" в Alert
        alert.addAction(cancelAction)
        
        let closeAction = UIAlertAction(
            title: "Сбросить",
            style: .destructive,
            handler: { _ in
                print("Кнопка сброса в GameVc-Alert нажата")
                let mainViewController = MainViewController()
//                self.dismiss(animated: true, completion: nil)
//                self.modalPresentationStyle = .fullScreen
//                self.present(mainViewController, animated: true)
                
                
                
                mainViewController.modalPresentationStyle = .fullScreen
                mainViewController.modalTransitionStyle = .coverVertical
                self.navigationController?.pushViewController(mainViewController, animated: true)
            })
        
        ///Добавление кнопки "Сбросить" в Alert
        alert.addAction(closeAction)
        ///Показать Alert
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - SetConstraints
extension GameViewController {
    private func layout() {
        ///Добавление lable-stack, button-stack в StackMain.
        [timerLabel, guessWordLabel, stackButtonsView].forEach
        { view.addSubview($0) }
        
        ///Добавление кнопок в Стак-вью кнопок
        [correctButton, skipButton, showAlertButton].forEach
        { stackButtonsView.addArrangedSubview($0) }
        
        let indent: CGFloat = 125
        
        NSLayoutConstraint.activate([
            timerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            timerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: indent),
            timerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -indent),
            timerLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            guessWordLabel.topAnchor.constraint(equalTo: timerLabel.bottomAnchor, constant: indent),
            guessWordLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: indent),
            guessWordLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -indent),
            guessWordLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        NSLayoutConstraint.activate([
            //        stackButtonsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300),
            stackButtonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            stackButtonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            stackButtonsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
        ])
        
        NSLayoutConstraint.activate([
            correctButton.heightAnchor.constraint(equalToConstant: 60),
            skipButton.heightAnchor.constraint(equalToConstant: 60),
            showAlertButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        
    }
}

