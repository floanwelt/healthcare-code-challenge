//
//  ViewController.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 22.12.19.
//  Copyright © 2019 Florian Abel. All rights reserved.
//

import UIKit

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
    case otherProblem
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
