//
//  APIResponse.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 05.01.20.
//  Copyright © 2020 Florian Abel. All rights reserved.
//

import Foundation

struct RawServerResponse: Decodable {
    enum CodingKeys: String, CodingKey {
        case studyUID = "0020000D"
        case seriesUID = "0020000E"
        case instanceUID = "00080018"
    }
    
    struct StudyUID: Decodable {
        var Value: [String]
    }
    
    struct SeriesUID: Decodable {
        var Value: [String]
    }
    
    struct InstanceUID: Decodable {
        var Value: [String]
    }
    
    var studyUID: StudyUID
    var seriesUID: SeriesUID
    var instanceUID: InstanceUID
}

struct StudyMetaData: Decodable{
    var studyUID: String
    var seriesUID: String
    var instanceUID: String
    
    init(from decoder: Decoder) throws {
        let rawResponse = try RawServerResponse(from: decoder)
        
        studyUID = rawResponse.studyUID.Value[0]
        seriesUID = rawResponse.seriesUID.Value[0]
        instanceUID = rawResponse.instanceUID.Value[0]
    }
}


//    {
//    # SPECIFIC CHARACTER_SET
//    "00080005":
//      {
//        "vr":"CS","Value":["ISO_IR 100"]
//      },
//
//    # SOP_CLASS UID
//    "00080016":
//      {
//        "vr":"UI","Value":["1.2.840.10008.5.1.4.1.1.2"]
//      },
//
//    # SOP_INSTANCE_UID
//    "00080018":
//      {
//        "vr":"UI","Value":["1.2.392.100224.1.1230.0161147205223207676813923613179320744200"]
//      },
//
//    # STUDY DATE
//    "00080020":
//      {
//        "vr":"DA","Value":["2017-02-16"]
//      },
//
//    # ???
//    "00080030":
//      {
//        "vr":"TM","Value":["000000"]
//      },
//
//    # ACCESSION_NUMBER
//    "00080050":
//      {
//        "vr":"SH"
//      },
//
//    # MODALITY
//    "00080060":
//      {
//        "vr":"CS","Value":["CT"]
//      },
//
//    # ???
//    "00080090":
//      {
//        "vr":"PN"
//      },
//
//    # ???
//    "00080201":
//      {
//        "vr":"SH","Value":["+0100"]
//      },
//
//    # ???
//    "0008103E":
//      {
//        "vr":"LO"
//      },
//
//    # ???
//    "00100010":
//      {
//        "vr":"PN","Value":[{"Alphabetic":"Patient Name 1"}]
//      },
//
//    # PATIENT_ID
//    "00100020":
//      {
//        "vr":"LO","Value":["0001"]
//      },
//
//    # ???
//    "00100030":
//      {
//        "vr":"DA","Value":["19890101"]
//      },
//
//    # ???
//    "00100040":
//      {
//        "vr":"CS","Value":["F"]
//      },
//
//    # STUDY_INSTANCE_UID
//    "0020000D":
//      {
//         "vr":"UI","Value":["1.2.392.100224.1.1210.3722113121538292546519015974142145381201"]
//      },
//
//    # SERIES_INSTANCE_UID
//    "0020000E":
//      {
//        "vr":"UI","Value":["1.2.392.100224.1.1220.207224862311741079268136963293236137135254"]
//      },
//
//    # ???
//    "00200010":
//      {
//        "vr":"SH"
//      },
//
//    # INSTANCE_NUMBER
//    "00200013":
//      {
//        "vr":"IS","Value":[396]
//      },
//
//    # ROWS
//    "00280010":
//      {
//        "vr":"US","Value":[512]
//      },
//
//    # COLUMNS
//    "00280011":
//      {
//        "vr":"US","Value":[512]
//      },
//
//    # BITS_ALLOCATED
//    "00280100":
//      {
//        "vr":"US","Value":[16]
//      }
//    },
