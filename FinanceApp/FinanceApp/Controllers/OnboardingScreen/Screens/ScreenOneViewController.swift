//
//  ScreenOneViewController.swift
//  FinanceApp
//
//  Created by Decagon on 10/08/2022.
//

import UIKit

class ScreenOneViewController: UIViewController {
//MARK: UI Items
    lazy var headerText : UILabel = {
        let header = UILabel()
        header.text = "What's New"
        header.translatesAutoresizingMaskIntoConstraints = false
        return  header
    }()
    
    lazy var skipButton : UIButton = {
        let skip = UIButton(type: .system)
        skip.setTitle("Skip", for: .normal)
        skip.setTitleColor(UIColor.white, for: .normal)
        skip.translatesAutoresizingMaskIntoConstraints = false
        return skip
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        view.backgroundColor = UIColor(named: "primaryBackgroundColor")

        // Do any additional setup after loading the view.
    }
}

extension ScreenOneViewController {
    
    func setupViews() {
        let items = [headerText, skipButton]
        
        items.forEach { item in
            view.addSubview(item)
        }
        
        NSLayoutConstraint.activate([
            headerText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            headerText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            skipButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            skipButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5)
        ])
    }
}
