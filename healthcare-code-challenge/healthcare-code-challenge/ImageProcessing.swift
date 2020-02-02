//
//  ImageProcessing.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 01.02.20.
//  Copyright © 2020 Florian Abel. All rights reserved.
//



// Collection of code snippets from various approaches.
//
// pixelValues() and imageFunc() are most interesting

import Foundation
import DCDicom

class ImageProcessing {
    static func pixelValues(fromCGImage imageRef: CGImage?) -> (pixelValues: [UInt8]?, width: Int, height: Int)
    {
        var width = 0
        var height = 0
        var pixelValues: [UInt8]?
        if let imageRef = imageRef {
            width = imageRef.width
            height = imageRef.height
            let bitsPerComponent = imageRef.bitsPerComponent
            let bytesPerRow = imageRef.bytesPerRow
            let totalBytes = height * bytesPerRow
            let bitmapInfo = imageRef.bitmapInfo.rawValue

            let colorSpace = CGColorSpaceCreateDeviceRGB()
            var intensities = [UInt8](repeating: 0, count: totalBytes)

            let contextRef = CGContext(data: &intensities, width: width, height: height, bitsPerComponent: bitsPerComponent, bytesPerRow: bytesPerRow, space: colorSpace, bitmapInfo: bitmapInfo)
            contextRef?.draw(imageRef, in: CGRect(x: 0.0, y: 0.0, width: CGFloat(width), height: CGFloat(height)))

            pixelValues = intensities
        }

        return (pixelValues, width, height)
    }

    static func imageFunc(fromPixelValues pixelValues: [UInt8]?, width: Int, height: Int) -> CGImage?
    {
        var imageRef: CGImage?
        if var pixelValues = pixelValues {
            let bitsPerComponent = 8
            let bytesPerPixel = 4
            let bitsPerPixel = bytesPerPixel * bitsPerComponent
            let bytesPerRow = bytesPerPixel * width
            let totalBytes = height * bytesPerRow

            imageRef = withUnsafePointer(to: &pixelValues, {
                ptr -> CGImage? in
                var imageRef: CGImage?
                let colorSpaceRef = CGColorSpaceCreateDeviceRGB()
                let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.noneSkipLast.rawValue).union(CGBitmapInfo())
                let data = UnsafeRawPointer(ptr.pointee).assumingMemoryBound(to: UInt8.self)
                let releaseData: CGDataProviderReleaseDataCallback = {
                    (info: UnsafeMutableRawPointer?, data: UnsafeRawPointer, size: Int) -> () in
                }

                if let providerRef = CGDataProvider(dataInfo: nil, data: data, size: totalBytes, releaseData: releaseData) {
                    imageRef = CGImage(width: width,
                                       height: height,
                                       bitsPerComponent: bitsPerComponent,
                                       bitsPerPixel: bitsPerPixel,
                                       bytesPerRow: bytesPerRow,
                                       space: colorSpaceRef,
                                       bitmapInfo: bitmapInfo,
                                       provider: providerRef,
                                       decode: nil,
                                       shouldInterpolate: false,
                                       intent: CGColorRenderingIntent.defaultIntent)
                }

                return imageRef
            })
        }

        return imageRef
    }
    
    
    func imebraUIImageToPixelsToUIImage() {
        if let dicm = DataManager.shared.studyInstances[200] {
            let image = Utils.loadWSI(data: dicm)
            let cgImage = image?.cgImage
            print("cgImage Data from Imebra")
            print(cgImage!.width)
            print(cgImage!.height)
            print(cgImage!.bitsPerComponent)
            print(cgImage!.bitsPerPixel)
            print(cgImage!.bytesPerRow)
            print(cgImage!.colorSpace?.baseColorSpace)
            print(cgImage!.alphaInfo.rawValue)
            print(cgImage!.decode)
            print(cgImage!.shouldInterpolate)
            print(cgImage!.renderingIntent.rawValue)
            print(cgImage!.bitmapInfo.rawValue)
            print(cgImage!.byteOrderInfo.rawValue)
            print(cgImage!.pixelFormatInfo.rawValue)
            print("======================")
            let (pixels, width, height) = ImageProcessing.pixelValues(fromCGImage: cgImage)
            print(pixels!.prefix(100))
            let newImage = ImageProcessing.imageFunc(fromPixelValues: pixels, width: width, height: height)
    //        setImage(image: UIImage(cgImage: newImage!))
            
        }
    }



    func dataFromDCDicom() {
        if let dicm = DataManager.shared.studyInstances[0] {
                    do {
                        let dicomObject = try DicomObject(data: dicm)
                        let binary = dicomObject[0x7FE00010]!.rawValue!
                        let newData = NSData(data: binary)
                        let image = UIImage(data: newData as Data)
                        // How to convert the raw data to image data? Which format is it in?
                        // How does Imebra do it?
                        if let slice_thickness = dicomObject[0x00180050] {
                            print("Slice Thickness")
                            print(slice_thickness)
                        }
                        if let samples_per_pixel = dicomObject[0x00280002] {
                            print("Samples per pixel")
                            print(samples_per_pixel)
                        }
                        if let photometric_interpretation = dicomObject[0x00280004] {
                            print("Photometric interpretation")
                            print(photometric_interpretation)
                        }
                        if let rows = dicomObject[0x00280010] {
                            print("Rows")
                            print(rows)
                        }
                        if let columns = dicomObject[0x00280011] {
                            print("Columns")
                            print(columns)
                        }
                        if let bits_allocated = dicomObject[0x00280100] {
                            print("Bits Allocated")
                            print(bits_allocated)
                        }
                        if let bits_stored = dicomObject[0x00280101] {
                            print("Bits stored")
                            print(bits_stored)
                        }
                        if let high_bit = dicomObject[0x00280102] {
                            print("High bit")
                            print(high_bit)
                        }
                        if let pixel_reprensentation = dicomObject[0x00280103] {
                            print("Pixel representation")
                            print(pixel_reprensentation)
                        }
                        if let color_space = dicomObject[0x00282002] {
                            print("Color Space")
                            print(color_space)
                        }
                        if let smallest_image_pixel_value = dicomObject[0x00280106] {
                            print("Smallest Image Pixel Value")
                            print(smallest_image_pixel_value)
                        }
                        if let largest_image_pixel_value = dicomObject[0x00280107] {
                            print("Largest Image Pxiel Value")
                            print(largest_image_pixel_value)
                        }
                        if let pixel_data = dicomObject[0x7FE00010], let pixel_data_raw = pixel_data.rawValue {
                                print("Pixel Data")
                                print(pixel_data_raw)
                            
        //                    var blub = NSBitmapImageRep(bitmapDataPlanes: nil,
        //                    pixelsWide: Int(100),
        //                    pixelsHigh: Int(100),
        //                    bitsPerSample: 8,
        //                    samplesPerPixel: 3,
        //                    hasAlpha: false,
        //                    isPlanar: false,
        //                    colorSpaceName: NSCalibratedRGBColorSpace,
        //                    bytesPerRow: 0, bitsPerPixel: 0)!
                            
        //                    let width  = Int(pixel_data_raw[1]) | Int(pixel_data_raw[0]) << 16
        //                    let height = Int(pixel_data_raw[3]) | Int(pixel_data_raw[2]) << 16
                            let width = 512
                            let height = 512
                            print(width)
                            print(height)
                            
                            let colorSpace = CGColorSpaceCreateDeviceGray()
                            print(colorSpace)
                            
                            let bitmapContext = CGContext(
                                data: nil,
                                width: width,
                                height: height,
                                bitsPerComponent: 12,
                                bytesPerRow: 1024,
                                space: colorSpace,
                                bitmapInfo: CGImageAlphaInfo.alphaOnly.rawValue
                            )
                            print("bitmapinfo")
                            print(CGImageAlphaInfo.alphaOnly.rawValue)
                            print("BitmapContext")
                            print(bitmapContext)
                            print("After")
        //                    if let bitmapContext = bitmapContext {
        //                        print(bitmapContext.data!)
        //                    }
        //                    if let dataPointer: UnsafeMutableRawPointer = bitmapContext!.data! {
        //                        for index in 0 ..< width * height {
        //                            dataPointer.storeBytes(of: pixel_data_raw[index + 16], as: UInt8.self)
        //    //                        dataPointer![index] = pixel_data_raw[index + 16]
        //                        }
        //
        //                        let cgImage2 = bitmapContext!.makeImage()
        //                        let image2 = UIImage(cgImage: cgImage2!)
        //
        //                    }
                            
                            let cgImage = CGImage(
                                width: 512,
                                height: 512,
                                bitsPerComponent: 16,
                                bitsPerPixel: 16,
                                bytesPerRow: 1024,
                                space: colorSpace,
                                bitmapInfo: CGBitmapInfo(rawValue: CGImageAlphaInfo.alphaOnly.rawValue),
                                provider: CGDataProvider(data: pixel_data_raw as CFData)!,
                                decode: nil,
                                shouldInterpolate: false,
                                intent: CGColorRenderingIntent.defaultIntent
                            )
        //                    let image_data = CIImage(bitmapData: pixel_data_raw, bytesPerRow: 1024, size: CGSize(width: 512, height: 512), format: CIFormat.A16, colorSpace: CGColorSpace.linearGray as! CGColorSpace)
                            let image = UIImage(cgImage: cgImage!)
                            
    //                        setImage(image: image)

                        }
                        print("Image set?!")
                    } catch {
                        print("Something went wrong! Error: \(error)")
                    }
                } else {
                    print("Sth does not work")
                }
    }
}

