//
//  GenerateViewController.swift
//  Generative Art
//
//  Created by Caine Simpson on 4/26/20.
//  Copyright © 2020 Caine Simpson. All rights reserved.
//

import UIKit

class GenerateViewController: UIViewController {
    
    var artView: UIView!
    
    let saveButton: UIButton = {
        let bt = UIButton()
        bt.setTitle("Save", for: .normal)
//        bt.backgroundColor = .red
        bt.tintColor = .gray
        bt.translatesAutoresizingMaskIntoConstraints = false
        bt.addTarget(self, action: #selector(save), for: .touchUpInside)
        return bt
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = .red
        // Do any additional setup after loading the view.
//        let drawView = DrawView(frame: self.view.bounds)
        artView = DrawView(frame: self.view.bounds)
        view.addSubview(artView)
        view.addSubview(saveButton)

//        UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        setupButton()
    }
    
    func setupButton() {
//        self.saveButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 1).isActive = true
//        self.saveButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 1).isActive = true
        self.saveButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 1).isActive = true
        self.saveButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 1).isActive = true
        self.saveButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.saveButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        self.saveButton.layer.zPosition = -10
        
    }
    
    @objc func save() {
        let image = artView.saveAsImage()
        let saver = ImageSaver()
        saver.writeToPhotoAlbum(image: image)
        let alertController = UIAlertController(title: "Image Saved", message: "Your image is saved to your photo library!", preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true)
    }

}

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}

extension UIView {
    func saveAsImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { (context) in
            layer.render(in: context.cgContext)
        }
    }
}
