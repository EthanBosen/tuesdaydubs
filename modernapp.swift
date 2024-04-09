import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = UIColor.black
        
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(container)
        
        NSLayoutConstraint.activate([
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Modern App"
        titleLabel.font = UIFont(name: "Press Start 2P", size: 36)
        titleLabel.textColor = UIColor.white
        container.addSubview(titleLabel)
        
        let buttons = [
            ("Email", #selector(openEmail)),
            ("GPS", #selector(openMaps)),
            ("Text", #selector(openText)),
            ("Contacts", #selector(openContacts)),
            ("Music", #selector(openMusic)),
            ("Plans", #selector(openPlans)),
            ("Social", #selector(openSocial)),
            ("Health", #selector(openHealth))
        ]
        
        var previousButton: UIButton?
        for (title, action) in buttons {
            let button = UIButton(type: .system)
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setTitle(title, for: .normal)
            button.titleLabel?.font = UIFont(name: "Press Start 2P", size: 20)
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.black, for: .normal)
            button.layer.cornerRadius = 5
            button.addTarget(self, action: action, for: .touchUpInside)
            container.addSubview(button)
            
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: container.centerXAnchor),
                button.widthAnchor.constraint(equalToConstant: 200),
                button.heightAnchor.constraint(equalToConstant: 40),
                button.topAnchor.constraint(equalTo: previousButton?.bottomAnchor ?? titleLabel.bottomAnchor, constant: 20)
            ])
            
            previousButton = button
        }
    }
    
    @objc func openEmail() {
        if let url = URL(string: "mailto:") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func openMaps() {
        if let url = URL(string: "maps:") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func openText() {
        if let url = URL(string: "messages:") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func openContacts() {
        if let url = URL(string: "contacts:") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func openMusic() {
        if let url = URL(string: "music:") {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func openPlans() {
        // Add Calendar syntax here
    }
    
    @objc func openSocial() {
        // Add Social here (working progress) / awaiting new concept
    }
    
    @objc func openHealth() {
        // Add Health app shortcut basically. / awaiting new concept
    }
}
