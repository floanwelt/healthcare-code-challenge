//
//  DicomCoder.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 16.01.20.
//  Copyright © 2020 Florian Abel. All rights reserved.
//

import Foundation

//struct MetaElement {
//    var groupTag = nil
//    var elementTag = nil
//    var
//}
class DicomCoder {
    
    // Available value representations (VR) and according byte length
    static let VR: [String:Int] = [
        "AE": 16,       // Application Entity - 16 bytes maximum!!!!!!!!!!
        "AS": 4,        // Age String - 4 bytes fixed
        "AT": 4,        // Attribute Tag - 4 bytes fixed
        "CS": 16,       // Code String - 16 bytes maximum!!!!!!!!!!
        "DA": 8,        // Date - 8 bytes fixed
        "DS": 16,       // Decimal String - 16 bytes maximum!!!!!!!!!!
        "DT": 26,       // Date Time - 26 bytes maximum!!!!!!!!
        "FL": 4,        // Floating Point Single - 4 bytes fixed
        "FD": 8,        // Floating Point Double - 8 bytes fixed
        "IS": 12,       // Integer String - 12 bytes maximum!!!!!!!!
        "LO": 64,       // Long String - 64 chars maximu !!!!!!!!!!!!!!!!!!!!!
        "LT": 10240,    // Long Text - 10240 chars maximum
        "OB": 99999,    // Other Byte - ????????
        "OD": 99999,    // Other Double - 2^32-8 bytes maximum!!!!!!!!!!
        "OF": 99999,    // Other Float - 2^32-4 bytes maximum!!!!!!!
        "OL": 99999,    // Other Long - ???????????
        "OV": 99999,    // Other 64-bit very long - ????????
        "OW": 99999,    // Other word - ?????????????
        "PN": 64,       // Person Name - 64 chars maximum per component group!!!!!!!
        "SH": 16,       // Short string - 16 chars maximum !!!!!!!
        "SL": 4,        // Signed Long - 4 bytes fixed
        "SQ": 99999,    // Signed Long - not applicable ???
        "SS": 2,        // Signed Short - 2 bytes fixed
        "ST": 1024,     // Short text - 1024 chard maximum !!!!
        "SV": 8,        // Signed 64-bit very long - 8 bytes fixed
        "TM": 14,       // Time - 14 bytes maximum !!!!!!!!
        "UC": 99999,    // Unlimted characters - 2^32-2 bytes maximum!!!!
        "UI": 64,       // Unique Identifier - 64 bytes maximum!!!
        "UL": 4,        // Unsigned long - 4 bytes fixed
        "UN": 99999,    // Unknown - ??????
        "UR": 99999,    // 2^32-2 bytes maximum!!!!!!
        "US": 2,        // Unsigned Short - 2 bytes fixed
        "UT": 99999,    // Unlimited Text - 2^32-2 bytes maximum
        "UV": 8,        // Unsigned 64-bit very long - 8 bytes fixed
    ]
    
    static let explicitVR16 = ["AE", "AS", "AT", "CS", "DA", "DS", "DT", "FL", "FD", "IS", "LO", "LT", "PN", "SH", "SL", "SS", "ST", "TM", "UI", "UL", "US"]
    
    static func decodeDICM(dcmData: NSData) -> DICM? {
        let preamble: NSString? = decodeRangeAsString(data: dcmData, startByte: 0, byteCount: 128)
        let dicmMarker: NSString? = decodeRangeAsString(data: dcmData, startByte: 128, byteCount: 4)
        if dicmMarker != "DICM" {
            return nil
        }
        
        let metaData = getMetaData(dcmData: dcmData)
//        let imageData = getImageData()
        
        let dicmElement: DICM = DICM(preamble: preamble! as String, metaData: metaData)
        
        return dicmElement
    }
    
    static func getMetaData(dcmData: NSData) -> [[String:Any]] {
        let startPosition: Int = 132
        var position = startPosition
        var metaData: [[String:Any]] = []
        var counter = 0
        while counter < 5 {
            var metaElement: [String:Any] = [:]
            (metaElement, position) = getMetaElement(dcmData: dcmData, position: position)
            if position > 0 {
                print(metaElement)
                metaData.append(metaElement)
            }
            counter += 1
        }
        return metaData
    }
    
    static func getMetaElement(dcmData: NSData, position: Int) -> (metaElement: [String:Any], position: Int) {
        var position = position
        
        var metaElement: [String:Any] = [:]
        
        let byteCount_groupNumber = 2
        let byteCount_elementNumber = 2
        let byteCount_vr = 2
        var byteCount_valueLength = 2
        
        
        let group: Int? = DicomCoder.decodeRangeAsUInt16(data: dcmData, startByte: position, byteCount: byteCount_groupNumber)
        if group == 0 {
            return (metaElement, 0)
        }
        position += byteCount_groupNumber
        let element: Int? = DicomCoder.decodeRangeAsUInt16(data: dcmData, startByte: position, byteCount: byteCount_elementNumber)
        position += byteCount_elementNumber
        let vr: NSString? = DicomCoder.decodeRangeAsString(data: dcmData, startByte: position, byteCount: byteCount_vr)
        position += byteCount_vr
        guard let vr_new = vr else { return (metaElement, 0)}
        if !explicitVR16.contains(String(vr_new)) {
            position += 2
            byteCount_valueLength += 2
        }
        let byteCount_value: Int? = DicomCoder.decodeRangeAsUInt16(data: dcmData, startByte: position, byteCount: byteCount_valueLength)
        position += byteCount_valueLength
        let value: Int? = DicomCoder.decodeRangeAsUInt32(data: dcmData, startByte: position, byteCount: byteCount_value!)
        position += byteCount_value!
        metaElement["GroupTag"] = String(group!)
        metaElement["ElementTag"] = String(element!)
        metaElement["VR"] = vr!
        metaElement["ValueLength"] = String(byteCount_value!)
        metaElement["ValueField"] = String(value!)
        
        return (metaElement, position)
    }
    
    static func decodeRangeAsString(data: NSData, startByte: Int, byteCount: Int) -> NSString? {
        let buffer = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: 1)
        let range = NSRange(location: startByte, length: byteCount)
        data.getBytes(buffer, range: range)
        let decoded = NSString(bytes: buffer, length: byteCount, encoding: String.Encoding.utf8.rawValue)
        return decoded
    }

    static func decodeRangeAsUInt16(data: NSData, startByte: Int, byteCount: Int) -> Int? {
        var int_buffer = [UInt16](repeating: 0, count: 1)
        let range = NSRange(location: startByte, length: byteCount)
        data.getBytes(&int_buffer, range: range)
        let decoded = Int(int_buffer[0])
        return decoded
    }

    static func decodeRangeAsUInt32(data: NSData, startByte: Int, byteCount: Int) -> Int? {
        var int_buffer = [UInt32](repeating: 0, count: 1)
        let range = NSRange(location: startByte, length: byteCount)
        data.getBytes(&int_buffer, range: range)
        let decoded = Int(int_buffer[0])
        return decoded
    }
    
//    static func decodeRangeAsUInt16(data: NSData, startByte: Int, byteCount: Int) -> UInt16? {
//        let buffer = UnsafeMutableRawPointer.allocate(byteCount: byteCount, alignment: 1)
//        let vcariab: [UInt16] = 
//        let range = NSRange(location: startByte, length: byteCount)
//        data.getBytes(buffer, range: range)
//        let decoded = UInt16(
//        let old = NSString(bytes: buffer, length: byteCount, encoding: String.Encoding.utf8.rawValue)
//        return decoded
//    }
}
