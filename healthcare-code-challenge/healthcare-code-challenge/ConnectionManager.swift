//
//  ConnectionManager.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 05.01.20.
//  Copyright © 2020 Florian Abel. All rights reserved.
//

import Foundation

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
    case otherProblem
}

class ConnectionManager {
    static let shared = ConnectionManager()
    
    private let authString: String = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6ImMyMWQxYWJjNWVjMGZiYTA0OWQ3OTE2ZTllZDkyOTJhNjE4ODQ5MzkifQ.eyJpc3MiOiJ0ZWNoLWNoYWxsZW5nZS1hcHBAY2hhcmlzbWF0aWMtdGVhLTI2MjIxMy5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsInN1YiI6InRlY2gtY2hhbGxlbmdlLWFwcEBjaGFyaXNtYXRpYy10ZWEtMjYyMjEzLmlhbS5nc2VydmljZWFjY291bnQuY29tIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhjYXJlLmdvb2dsZWFwaXMuY29tLyIsImlhdCI6MTU4MDY0MTcyMC4zNjkxNzMsImV4cCI6MTU4MDY0NTMyMC4zNjkxNzN9.RlM5_dSD--CAwD5CiYWTYdG0QnqdVG8k0pDvxMAUlUFMDvs1R8CaNcxzS3IkdQ3wIttBeZEhhxcpqZhtbkmv2Qth5znW7Yy05xIfGJLCwDZ5iZ4ZX1mIvfYvQ7YS9H9mr6Gq4nmRK6YgJwJ5Y2cQXldfKsa7vDYxhhKdB_19kjtVqtK4IY-BLCkhlCG11eD24dk9hZwrIwRA3jigOkVOXJK1e3ZN2_TTa-vvCseB0Ng7llbl_gQZcstbZK_4HCoqR2OygmfjTV5LbQ5hsa7I4EouBmBvSNuEm--4o6FRk05lHyjEMjqnqZSV1WROzCKEj45kGFteyDrkW1NsLh9UWQ"
    
     private let studyMetaDataEndpoint: URL = URL(string: "https://healthcare.googleapis.com/v1beta1/projects/charismatic-tea-262213/locations/europe-west2/datasets/med_tech_challenge/dicomStores/tech_challenge_dicom_store/dicomWeb/instances?StudyInstanceUID=1.2.392.100224.1.1210.3722113121538292546519015974142145381201")!
    
    private let sampleWSIEndpoint: URL = URL(string: "https://healthcare.googleapis.com/v1beta1/projects/charismatic-tea-262213/locations/europe-west2/datasets/med_tech_challenge/dicomStores/tech_challenge_dicom_store/dicomWeb/studies/1.2.392.100224.1.1210.3722113121538292546519015974142145381201/series/1.2.392.100224.1.1220.207224862311741079268136963293236137135254/instances/1.2.392.100224.1.1230.02390100247997378184152312248135213187")!
    
    func loadStudyMetaData(completion: @escaping(Result<[StudyMetaData], APIError>)
            -> Void) {
        var urlRequest = URLRequest(url: studyMetaDataEndpoint)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(authString, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        _ = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                completion(.failure(.responseProblem))
                return
            }
            do {
                let response = try JSONDecoder().decode([StudyMetaData].self, from: jsonData)
                completion(.success(response))
            } catch let error {
                print(error)
                completion(.failure(APIError.decodingProblem))
            }
            }.resume()
    }
    
    
    func loadWSI(studyUID: String, seriesUID: String, instanceUID: String, completion: @escaping(Result<Data, APIError>)
            -> Void) {
        
        let WSIEndpoint: URL = URL(string: "https://healthcare.googleapis.com/v1beta1/projects/charismatic-tea-262213/locations/europe-west2/datasets/med_tech_challenge/dicomStores/tech_challenge_dicom_store/dicomWeb/studies/\(studyUID)/series/\(seriesUID)/instances/\(instanceUID)")!
        var urlRequest = URLRequest(url: WSIEndpoint)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(authString, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/dicom", forHTTPHeaderField: "Accept")
        _ = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.responseProblem))
                return
            }
            if let data = data {
                completion(.success(data))
            }
        }.resume()
    }
}
