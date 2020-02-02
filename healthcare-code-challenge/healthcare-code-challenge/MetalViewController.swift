//
//  MetalViewController.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 28.01.20.
//  Copyright © 2020 Florian Abel. All rights reserved.
//

import Foundation
import UIKit
import MetalKit

enum Colors {
    static let randomGreen = MTLClearColor(red: 0.0, green: 0.4, blue: 0.21, alpha: 1.0)
}

class MetalViewController: UIViewController {
    var metalView: MTKView {
           return view as! MTKView
       }
       
       var device: MTLDevice!
       var commandQueue: MTLCommandQueue!
    
    override func viewDidLoad() {
        metalViewSetup()
    }
    override func viewDidAppear(_ animated: Bool) {
//            metalViewSetup()
    }
    
    func metalViewSetup() {
        metalView.device = MTLCreateSystemDefaultDevice()
        device = metalView.device
        
        metalView.clearColor = Colors.randomGreen
        
        commandQueue = device.makeCommandQueue()
        let commandBuffer = commandQueue.makeCommandBuffer()
        let commandEncoder = commandBuffer?.makeRenderCommandEncoder(descriptor: metalView.currentRenderPassDescriptor!)
        
        commandEncoder?.endEncoding()
        commandBuffer?.present(metalView.currentDrawable!)
        commandBuffer!.commit()
    }
}
