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
    
    static func applyTransformation(
        colorSpace: String?,
        dataSet: ImebraDataSet,
        image: ImebraImage,
        width: UInt32,
        height: UInt32) -> ImebraTransformsChain? {
            let chain = ImebraTransformsChain()
            do {
                if(ImebraColorTransformsFactory.isMonochrome(colorSpace)) {
                    let voiDescription = try ImebraVOILUT.getOptimalVOI(
                        image, inputTopLeftX: 0, inputTopLeftY: 0, inputWidth: width, inputHeight: height)
                    let voilutTransform = ImebraVOILUT(voiDescription: voiDescription)
                    chain?.add(voilutTransform)
                }
            } catch {
                print("Error occured")
            }
            return chain
        }
    
    static func loadWSI(data: Data) -> UIImage? {
            do {
                let memoryStreamInput = ImebraMemoryStreamInput(read: ImebraMemory(data: data))
                let streamReader = ImebraStreamReader(inputStream: memoryStreamInput)
                let dataSet = try ImebraCodecFactory.load(fromStream: streamReader)
                
//                let metaData = loadMetaData(dataSet: dataSet)
                let image = loadUIImage(dataSet: dataSet)
                
                return image
                } catch {
                    print("Could not load dataset from stream")
                }
                return nil
        }
    
//    private static func loadMetaData(dataSet: ImebraDataSet) {
    //                // patientNameCharacter
    //                _ = try dataSet.getString(ImebraTagId(group: 0x10, tag: 0x10), elementNumber: 0, defaultValue: "")
    //
    //                // patientNameIdeographic
    //                _ = try dataSet.getString(ImebraTagId(group: 0x10, tag: 0x10), elementNumber: 1, defaultValue: "")

//        let tags = dataSet.getTags()
//                    print("--------TAGS---------")
//                    print(tags)
//                    print("---------------------")
//                    if let tags = tags {
//                        for tagId in tags {
//                            do {
//                                let tag = try dataSet.getTag(tagId as! ImebraTagId)
//                                print(tag)
//                                print("--------------")
//                                let tagString = try dataSet.getString(tagId as! ImebraTagId, elementNumber: 0)
//                                print(tagString)
//                                let tagType = try dataSet.getDataType(tagId as! ImebraTagId)
//                                print(tagType)
//        //                        let tagSequence = try dataSet.getSequenceItem(tagId as! ImebraTagId, item: 0)
//        //                        print(tagSequence)
//                                print(" ")
//
//                            }
//                            catch let error {
//                                print(error)
//                            }
//
//                        }
//                    }
//    }
    
    private static func loadUIImage(dataSet: ImebraDataSet) -> UIImage? {
        do {
            let image = try dataSet.getImageApplyModalityTransform(0)
            let colorSpace = image.colorSpace
            let width = image.width
            let height = image.height
                        
            let chain = Utils.applyTransformation(
                colorSpace: colorSpace,
                dataSet: dataSet,
                image: image,
                width: width,
                height: height
            )
            
            return Utils.generateImage(chain: chain!, image: image)
            
        } catch {
            print("Could not get image data from dataset")
            return nil
        }
    }
    
}
