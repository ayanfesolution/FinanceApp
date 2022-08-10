//
//  ScreenThreeViewController.swift
//  FinanceApp
//
//  Created by Decagon on 10/08/2022.
//

import UIKit

class ScreenThreeViewController: UIViewController {
    //MARK: UI Items
        lazy var headerText : UILabel = {
            let header = UILabel()
            header.text = "What's New"
            header.textColor = .white
            header.translatesAutoresizingMaskIntoConstraints = false
            return  header
        }()
        
        lazy var startButton : UIButton = {
            let start = UIButton(type: .system)
            start.setTitle("Start                                                     ", for: .normal)
            start.semanticContentAttribute = .forceRightToLeft
            start.setImage(UIImage(named: "iconforforward"), for: .normal)
            start.tintColor = .white
            start.backgroundColor = faPrimaryButtonColor
            start.heightAnchor.constraint(equalToConstant: 60).isActive = true
            start.layer.cornerRadius = 10
            start.translatesAutoresizingMaskIntoConstraints = false
            return start
        }()
    
    lazy var backButton : UIButton = {
        let back = UIButton(type: .system)
        back.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        back.tintColor = .white
        back.translatesAutoresizingMaskIntoConstraints = false
        return back
    }()
        
        lazy var descriptionText : UILabel = {
            let description = UILabel()
            description.text = "Personalize your cards"
            description.font = UIFont.systemFont(ofSize: 34, weight: .bold)
            description.numberOfLines = 0
            description.textColor = .white
            description.translatesAutoresizingMaskIntoConstraints = false
            return description
        }()

        override func viewDidLoad() {
            super.viewDidLoad()
            setupViews()
            view.backgroundColor = UIColor(named: "primaryBackgroundColor")
            
        }
    }

    extension ScreenThreeViewController {
        
        func setupViews() {
            let items = [headerText, descriptionText, backButton, startButton]
            
            items.forEach { item in
                view.addSubview(item)
            }
            
            NSLayoutConstraint.activate([
                headerText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
                headerText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                startButton.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 36),
                
                backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
                
                descriptionText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -176),
                descriptionText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                descriptionText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        }
}
