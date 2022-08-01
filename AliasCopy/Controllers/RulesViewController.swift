//
//  RulesViewController.swift
//  Alias
//
//  Created by Dyadichev on 27.07.2022.
//

import Foundation
import UIKit

class RulesViewController: UIViewController{
    
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
        CGSize(width: view.frame.width, height: view.frame.height + 200)
    }
    
    var titleLabel = UILabel.createLabel(text: "Правила", font: 34, color: .black)
    
    private lazy var textLabel: UILabel = {
        let textLabel = UILabel()
        textLabel.font = .boldSystemFont(ofSize: 15)
        textLabel.text = "В игру играют командами из двух или более человек. Задача каждого игрока команды - объяснить как можно больше слов отображаемых на экране за ограниченное время другими словами, используя, например, синонимы, антонимы и подсказки так, чтобы члены вашей команды смогли отгадать как можно больше слов прежде чем истечет время. Чем больше слов отгадала команда, тем больше она заработает баллов. При объяснении слов нельзя упоминать какую-либо часть слова. Например, слово «кофеварка» нельзя объяснять как «аппарат для варки кофе». Правильный способ объяснения будет следующий: «аппарат для приготовления крепкого напитка, который обычно пьют за завтраком». Можно использовать синонимы - то есть вы можете сказать «кипятить», но не «варить». Вы можете использовать антонимы. Слово «большой» может быть объяснено как «антоним слова маленький». Вы не можете использовать иностранные языки, за исключением тех случаев, когда все игроки согласились с этим. Отгаданное слово должно точно совпадать. Объясняющий игрок помогает отгадывающим найти правильную форму слова. Если слово состоит из двух частей и кто-то отгадывает первую часть, вы потом можете использовать эту часть слова в дальнейшем объяснении. За каждое отгаданное слово команда получает одно очко, а за пропущенное или отгаданное с нарушением - штрафуется (в зависимости от настроек). Если объясняющий игрок допускает ошибку - например, называет часть слова, указанного в карточке, слово не будет принято и команда потеряет 1 очко. Поэтому каждая команда должна внимательно слушать объяснения других команд. Если слово кажется слишком тяжелым, вы можете его пропустить, но помните, что за это вы потеряете очки. Однако, иногда это того стоит, так как вы можете сэкономить время. 'Последнее слово для всех' - если включена эта опция, по истечении времени раунда, слово могут отгадывать все команды. В этом случае 1 очко получит команда отгадавшее слово. Победителем считается команда, набравшая необходимое для победы количество очков. Если на момент завершения победного раунда у команд одинаковое количество очков - проводиться дополнительный раунд (Овертайм). Если в раунде есть задание - команда может получить бонусные балы за его выполнение. Если вам удастся объяснить все слова в соответствии с заданием, то ваша команда получает бонусные очки, но только если другие команды считают ваше выполнение убедительным. Количество бонусных балов определяется случайно в интервале от 7 до 10."
        textLabel.numberOfLines = 0
        textLabel.textColor = .black
        textLabel.textAlignment = .center
        textLabel.sizeToFit()
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        return textLabel
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        loadSubview()
        settingConstraints()
        }
    
    func settingConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            textLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
    }
    func loadSubview() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(textLabel)
    }
    
}
