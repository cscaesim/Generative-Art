//
//  ViewController.swift
//  Generative Art
//
//  Created by Caine Simpson on 4/24/20.
//  Copyright © 2020 Caine Simpson. All rights reserved.
//

import UIKit
import ChromaColorPicker

class ViewController: UIViewController {
    
    let titleText: UILabel = {
        let label = UILabel()
        label.text = "Generative Art (Alpha)"
        label.textColor = UIColor.cyan
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let generateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Generate", for: .normal)
        
//        button.backgroundColor = .red
        button.layer.borderColor = CGColor.init(srgbRed: 100/255, green: 100/255, blue: 213/255, alpha: 1)
        button.layer.borderWidth = 5
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(TransitionToGenerateView), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    let segmentControl: UISegmentedControl = {
        let sg = UISegmentedControl()
        
        return sg
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.view.backgroundColor = .white
        self.view.addSubview(generateButton)
        self.view.addSubview(titleText)
        setupViews()
        
        
//        let draw = DrawView(frame: self.view.bounds)
//        view.addSubview(draw)
        
    }
    
    @objc func TransitionToGenerateView() {
        let generateVC = GenerateViewController()
        present(generateVC, animated: true, completion: nil)
    }
    
    func setupViews() {
        setupButton()
        setupTitle()
    }
    
    func setupButton() {
        self.generateButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.generateButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.generateButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        self.generateButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func setupTitle() {
        self.titleText.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -120).isActive = true
        self.titleText.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0).isActive = true
        self.titleText.widthAnchor.constraint(equalToConstant: 240).isActive = true
        self.titleText.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
