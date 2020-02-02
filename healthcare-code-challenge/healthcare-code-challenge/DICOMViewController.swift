//
//  DICOMViewController.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 29.12.19.
//  Copyright © 2019 Florian Abel. All rights reserved.
//

import UIKit


class DICOMViewController: UIViewController, dataInteraction {
    
    @IBAction func moveSlider(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        changeImage(imageNumber: currentValue)
    }

    @IBOutlet weak var dicomImageView: UIImageView!
    @IBOutlet weak var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DataManager.shared.setDelegate(self)
        
        //        testingFunc()
        
        if DataManager.shared.finishedLoading {
            setupView()
        }
    }
    
    func setupView() {
        let MINIMUM_VALUE = Float(DataManager.shared.studyInstances.keys.min()!)
        let MAXIMUM_VALUE = Float(DataManager.shared.studyInstances.keys.max()!)
        DispatchQueue.main.async {
            self.slider.minimumValue = MINIMUM_VALUE
            self.slider.maximumValue = MAXIMUM_VALUE
            self.slider.value = MINIMUM_VALUE
        }
        if let data = DataManager.shared.studyInstances[Int(MINIMUM_VALUE)] {
            setImage(image: Utils.loadWSI(data: data)!)
        }
    }
    
    func setImage(image: UIImage) {
        DispatchQueue.main.async {
           self.dicomImageView.image = image
        }
    }

    func setImageWithTransition(image: UIImage) {
        UIView.transition(with: self.dicomImageView, duration: 0.1, options: .transitionCrossDissolve, animations: {
            self.dicomImageView.image = image
        }, completion: nil)
    }

    func changeImage(imageNumber: Int) {
        if let data = DataManager.shared.studyInstances[imageNumber] {
            let newImage = Utils.loadWSI(data: data)
            setImageWithTransition(image: newImage!)
        }
    }
}
