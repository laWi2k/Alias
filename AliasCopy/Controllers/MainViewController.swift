import UIKit

class MainViewController: UIViewController {
    
    //MARK: Properties
    
    private let aliasGameLabel: UILabel = {
        let label = UILabel()
        label.text = "Alias Game"
        label.textColor = UIColor.systemBlue
        label.adjustsFontSizeToFitWidth = true
        label.font = .boldSystemFont(ofSize: 29)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var startButton: UIButton = .createButton(title: "СТАРТ", height: 96, color: #colorLiteral(red: 0, green: 0.7130450606, blue: 0.222219348, alpha: 1), image: .none)
    
    private lazy var rulesButton: UIButton = .createButton(title: "Правила", height: 96, color: UIColor.white, image: .none)
    
    private func setupButtons() {
        startButton.addTarget(self, action: #selector (startButtonPressed), for: .touchUpInside)
        
        rulesButton.addTarget(self, action: #selector(rulesButtonPressed), for: .touchUpInside)
        rulesButton.setTitleColor(UIColor.black, for: .normal)
        rulesButton.layer.borderWidth = 1
        rulesButton.layer.borderColor = UIColor.black.cgColor
    }
    
    
    private let homeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "home")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let grassImageLeft: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "grass")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let grassImageRight: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "grass")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: - LifeCycle ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupViews()
        setupButtons()
        setConstraints()
    }
    
    //MARK: Buttons
    
    @objc private func startButtonPressed() {
        
        let topicViewController = TopicViewController()
        
        topicViewController.modalPresentationStyle = .fullScreen
        topicViewController.modalTransitionStyle = .flipHorizontal
        navigationController?.pushViewController(topicViewController, animated: true)
    }
    
    @objc private func rulesButtonPressed() {

        let rulesViewController = RulesViewController()

        rulesViewController.modalPresentationStyle = .fullScreen
        rulesViewController.modalTransitionStyle = .flipHorizontal
        navigationController?.pushViewController(rulesViewController, animated: true)
    }
    
    //MARK: Setup View
    
    private func setupViews() {
        
        view.addSubview(homeImage)
        homeImage.addSubview(aliasGameLabel)
        view.addSubview(startButton)
        view.addSubview(rulesButton)
        view.addSubview(grassImageLeft)
        view.addSubview(grassImageRight)
        
    }
}

//MARK: - SetConstraints
extension MainViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            aliasGameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 30),
            aliasGameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            homeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            homeImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            homeImage.bottomAnchor.constraint(equalTo: startButton.topAnchor,constant: -50)
        ])
        NSLayoutConstraint.activate([
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            startButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.heightAnchor.constraint(equalToConstant: 96)
        ])
        NSLayoutConstraint.activate([
            rulesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 80),
            rulesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -80),
            rulesButton.bottomAnchor.constraint(equalTo: grassImageLeft.bottomAnchor,constant: -80),
            rulesButton.heightAnchor.constraint(equalToConstant: 80)
        ])
        NSLayoutConstraint.activate([
            grassImageLeft.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 5),
            grassImageLeft.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -1),
            grassImageLeft.heightAnchor.constraint(equalToConstant: 70),
            grassImageLeft.widthAnchor.constraint(equalToConstant: 100),
            
            grassImageRight.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -5),
            grassImageRight.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: -1),
            grassImageRight.heightAnchor.constraint(equalToConstant: 70),
            grassImageRight.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
