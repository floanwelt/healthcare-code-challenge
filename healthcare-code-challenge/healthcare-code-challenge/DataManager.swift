//
//  DataManager.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 05.01.20.
//  Copyright © 2020 Florian Abel. All rights reserved.
//

import Foundation

class DataManager {
    static let shared = DataManager()
    
    private var studyMetaData: [StudyMetaData] = []
    var studyInstances: [Int: Data] = [:]
    
    private init() {
        ConnectionManager.shared.loadStudyMetaData(completion: ({ result in
            switch result {
            case .success(let metaData):
                print("Success loading MetaData")
                self.studyMetaData = metaData
                self.loadInstances()
            case .failure(let error):
                print("Could not connect due to: ")
                print(error)
            }
        }))
    }
    
    private func loadInstances() {
        for element in studyMetaData {
            let studyUID = element.studyUID
            let seriesUID = element.seriesUID
            let instanceUID = element.instanceUID
            let instanceNumber = element.instanceNumber
            ConnectionManager.shared.loadWSI(studyUID: studyUID, seriesUID: seriesUID, instanceUID: instanceUID, completion: ({ result in
                switch result {
                case .success(let data):
                    print("Success loading WSIData")
                    self.studyInstances[instanceNumber] = data
                case .failure(let error):
                    print("Could not connect due to: ")
                    print(error)
                }
            }))
        }
    }
}
