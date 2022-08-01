//
//  GameViewController.swift
//  Alias
//
//  Created by Dyadichev on 27.07.2022.
//

import Foundation
import UIKit

class GameViewController: UIViewController {
    //MARK: - let/var
    var index : Int = 0
    var aliasTimer = Timer()
    var aliasRandomIventTimer = Timer()
    var time : Int = 60
    var greenCount : Int = 0
    var redCount : Int = 0
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
    ///Логотип игры
    private let logoAliasImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoAlias")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    ///Зеленый лейбл справа от логотипа
    private lazy var greenLabel: UILabel = .createLabel(text: "0", font: 48, color: .green)
    ///Красный лейбл справа от логотипа
    private lazy var redLabel: UILabel = .createLabel(text: "0", font: 48, color: .systemRed)
    ///Лейбл отсчёта одной минуты до конца игры.
    private lazy var timerLabel: UILabel = .createLabel(text: "1:00", font: 40, color: .black)
    ///Лейбл слова которого нужно угадать
    private lazy var guessWordLabel: UILabel = .createLabel(text: "Картошка", font: 48, color: .black)
    ///Серая кнопка сброса игры
    private let showAlertButton: UIButton = .createButton(title: "Сбросить", height: 60, color: .systemGray, image: nil)
    ///Зеленая кнопка правильного ответа.
    private let correctButton: UIButton = .createButton(title: "Правильно", height: 60, color: .systemGreen, image: nil)
    ///Красная кнопка пропуска вопроса
    private let skipButton: UIButton = . createButton(title: "Пропустить", height: 60, color: .systemRed, image: nil)
    
    //MARK: - LifeCycle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        layout()
        setupButtonsTarget()
        startTimer()
        startRandomTimer()
    }
    
    //MARK: - Methods
    ///Установка таргетов на кнопки.
    func setupButtonsTarget() {
        correctButton.addTarget(self, action: #selector(correctButtonTapped), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        showAlertButton.addTarget(self, action: #selector(showAlertTapped), for: .touchUpInside)
    }
///Рандомный диапазон цифр
    func randomNumber(in range: ClosedRange<Double>) -> Double {
        return(Double.random(in: 1...58))
    }
    ///Функция запуска таймера
    private func startTimer() {
        aliasTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
}
    ///Запуск рандомного события.
    private func startRandomTimer() {
    aliasRandomIventTimer = Timer.scheduledTimer(timeInterval: randomNumber(in: 15...58), target: self, selector: #selector (randomIventTimer), userInfo: nil, repeats: false)
    }
    ///Остановить основной таймер
    private func stopTimer() {
        aliasTimer.invalidate()
    }
    ///Счётчик рандомного срабатывания таймера.
    @objc func randomIventTimer() {
        aliasTimer.invalidate()
        UIView.animate(withDuration: 0.3) { [self] in
        guessWordLabel.text = emodjyArray.randomElement()
            guessWordLabel.font = .systemFont(ofSize: CGFloat (180))
        timerLabel.text = "Выразите эмоцию!"
        }
        //Выбор ответа и начисление рандомного количества баллов.
        if index == 1 {
            greenCount += Int(randomNumber(in: 3...7))
        } else if index == 2 {
            redCount += Int(randomNumber(in: 3...7))
        }
        guessWordLabel.font = .systemFont(ofSize: CGFloat (48))
            startTimer()
    }
    ///Счётчик таймера
    @objc func updateTimer() {
        if time > 0 {
            time -= 1
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
    //MARK: - Objc func buttons
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
                self.dismiss(animated: true, completion: nil)
                self.modalPresentationStyle = .fullScreen
                self.present(mainViewController, animated: true)
            })
        ///Добавление кнопки "Сбросить" в Alert
            alert.addAction(closeAction)
        ///Показать Alert
            present(alert, animated: true, completion: nil)
        }
    
    @objc func correctButtonTapped(_ sender : UIButton) {
        sender.tag = 1
        index = sender.tag
        greenCount += 1
        greenLabel.text = greenCount.description
        guessWordLabel.text = aliasWords?.randomElement()
}
    @objc func skipButtonTapped(_ sender : UIButton) {
        sender.tag = 2
        index = sender.tag
        redCount += 1
        redLabel.text = redCount.description
        guessWordLabel.text = aliasWords?.randomElement()
}
}
    //MARK: - SetConstraints
extension GameViewController {
    private func layout() {
    ///Добавление lable-stack, button-stack в StackMain.
    [logoAliasImage, greenLabel, redLabel, timerLabel, guessWordLabel, stackButtonsView].forEach
    { view.addSubview($0) }
    
    ///Добавление кнопок в Стак-вью кнопок
    [correctButton, skipButton, showAlertButton].forEach
    { stackButtonsView.addArrangedSubview($0) }
                                                         
    let indent: CGFloat = 125
    
    NSLayoutConstraint.activate([
        logoAliasImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
        logoAliasImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        logoAliasImage.widthAnchor.constraint(equalToConstant: 80),
        logoAliasImage.heightAnchor.constraint(equalToConstant: 70),
        ])
    
    NSLayoutConstraint.activate([
        greenLabel.topAnchor.constraint(equalTo: logoAliasImage.topAnchor, constant: 5),
        greenLabel.leadingAnchor.constraint(equalTo: logoAliasImage.trailingAnchor, constant: 10),
        redLabel.topAnchor.constraint(equalTo: logoAliasImage.topAnchor, constant: 5),
        redLabel.trailingAnchor.constraint(equalTo: logoAliasImage.leadingAnchor, constant: -10),
        ])
    
        NSLayoutConstraint.activate([
        timerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: indent),
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
