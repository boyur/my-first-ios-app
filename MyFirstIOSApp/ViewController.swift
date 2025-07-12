import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupTapGesture()
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
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap(_ gesture: UITapGestureRecognizer) {
        let tapLocation = gesture.location(in: view)
        createFlyingHearts(at: tapLocation)
    }
    
    private func createFlyingHearts(at location: CGPoint) {
        let numberOfHearts = Int.random(in: 3...6)
        
        for i in 0..<numberOfHearts {
            let heartImageView = UIImageView(image: UIImage(named: "HeartIcon"))
            heartImageView.contentMode = .scaleAspectFit
            
            // Размер сердечка (в 2 раза больше)
            let heartSize = CGFloat.random(in: 40...80)
            heartImageView.frame = CGRect(x: location.x - heartSize/2, 
                                        y: location.y - heartSize/2, 
                                        width: heartSize, 
                                        height: heartSize)
            
            // Небольшой рандомный offset для каждого сердечка
            let offsetX = CGFloat.random(in: -30...30)
            let offsetY = CGFloat.random(in: -30...30)
            heartImageView.center = CGPoint(x: location.x + offsetX, y: location.y + offsetY)
            
            view.addSubview(heartImageView)
            
            // Анимация полета сердечка
            animateHeart(heartImageView, delay: Double(i) * 0.1)
        }
    }
    
    private func animateHeart(_ heartImageView: UIImageView, delay: Double) {
        // Начальная трансформация
        heartImageView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        heartImageView.alpha = 0.0
        
        // Конечная позиция - вверх и в стороны
        let endX = heartImageView.center.x + CGFloat.random(in: -100...100)
        let endY = heartImageView.center.y - CGFloat.random(in: 200...400)
        
        UIView.animate(withDuration: 0.3, delay: delay, options: .curveEaseOut) {
            // Появление сердечка
            heartImageView.alpha = 1.0
            heartImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        
        UIView.animate(withDuration: 2.0, delay: delay + 0.2, options: .curveEaseOut, animations: {
            // Полет сердечка
            heartImageView.center = CGPoint(x: endX, y: endY)
            heartImageView.alpha = 0.0
            heartImageView.transform = CGAffineTransform(scaleX: 0.3, y: 0.3).rotated(by: CGFloat.random(in: -0.5...0.5))
        }) { _ in
            // Удаление сердечка после анимации
            heartImageView.removeFromSuperview()
        }
    }
} 
