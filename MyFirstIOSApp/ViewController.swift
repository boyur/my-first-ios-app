import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        // Устанавливаем белый фон
        view.backgroundColor = .white
        
        // Создаем label с текстом Hello World
        let helloWorldLabel = UILabel()
        helloWorldLabel.text = "Anna + Artem = ❤️"
        helloWorldLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        helloWorldLabel.textColor = .black
        helloWorldLabel.textAlignment = .center
        helloWorldLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Добавляем label на view
        view.addSubview(helloWorldLabel)
        
        // Устанавливаем constraints для центрирования
        NSLayoutConstraint.activate([
            helloWorldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            helloWorldLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
} 
