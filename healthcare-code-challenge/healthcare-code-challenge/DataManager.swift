//
//  DataManager.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 05.01.20.
//  Copyright © 2020 Florian Abel. All rights reserved.
//

import Foundation

protocol dataInteraction: class {
    func setupView()
}

class DataManager {
    static let shared = DataManager()
    private weak var delegate: dataInteraction?

    private var studyMetaData: [StudyMetaData] = []
    var studyInstances: [Int: Data] = [:]
    var finishedLoading: Bool = false
    
    private init() {
        ConnectionManager.shared.loadStudyMetaData(
            completion: (
                { result in
                    switch result {
                    case .success(let metaData):
                        print("Success loading MetaData")
                        self.studyMetaData = metaData
                        self.loadInstances()
                    case .failure(let error):
                        print("Could not connect due to: ")
                        print(error)
                    }
                }
            )
        )
    }
    
    func setDelegate(_ delegate: dataInteraction) {
        self.delegate = delegate
    }
    
    private func loadInstances() {
        var instancesToLoad = studyMetaData.count
        for element in studyMetaData {
            let studyUID = element.studyUID
            let seriesUID = element.seriesUID
            let instanceUID = element.instanceUID
            let instanceNumber = element.instanceNumber
            ConnectionManager.shared.loadWSI(
                studyUID: studyUID,
                seriesUID: seriesUID,
                instanceUID: instanceUID,
                completion:(
                    { result in
                        switch result {
                        case .success(let data):
                            self.studyInstances[instanceNumber] = data
                            instancesToLoad -= 1
                            if instancesToLoad == 0 {
                                print("Finished loading")
                                self.finishedLoading = true
                                self.delegate?.setupView()
                            }
                        case .failure(let error):
                            print("Could not connect due to: ")
                            print(error)
                        }
                    }
                )
            )
        }
    }
}
