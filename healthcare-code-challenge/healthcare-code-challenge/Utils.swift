//
//  Utils.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 29.12.19.
//  Copyright © 2019 Florian Abel. All rights reserved.
//

import Foundation

class Utils {
    
    static func generateImage(chain: ImebraTransformsChain, image: ImebraImage) -> UIImage? {
        do {
            let draw = ImebraDrawBitmap(transform: chain)
            return try draw?.getImebraImage(image)
        } catch {
            return nil
        }
    }
    
    static func applyTransformation(colorSpace: String?,
                                    dataSet: ImebraDataSet,
                                    image: ImebraImage,
                                    width: UInt32,
                                    height: UInt32) -> ImebraTransformsChain? {
        let chain = ImebraTransformsChain()
        do {
            if(ImebraColorTransformsFactory.isMonochrome(colorSpace)) {

                let voiDescription = try ImebraVOILUT.getOptimalVOI(image, inputTopLeftX: 0, inputTopLeftY: 0, inputWidth: width, inputHeight: height)
                let voilutTransform = ImebraVOILUT(voiDescription: voiDescription)
                chain?.add(voilutTransform)
            }
        } catch {
            print("Error occured")
        }
        return chain
    }
    
}
