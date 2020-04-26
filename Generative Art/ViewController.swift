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
    
    let button: UIButton = {
        let button = UIButton()
        
        
        return button
    }()
    
    let segmentControl: UISegmentedControl = {
        let sg = UISegmentedControl()
        
        return sg
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        
        let draw = DrawView(frame: self.view.bounds)
        view.addSubview(draw)
        
    }
}
