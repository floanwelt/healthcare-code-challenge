//
//  ConnectionManager.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 05.01.20.
//  Copyright © 2020 Florian Abel. All rights reserved.
//

import Foundation

class ConnectionManager {
    static let shared = ConnectionManager()
    
    private let authString: String = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6ImMyMWQxYWJjNWVjMGZiYTA0OWQ3OTE2ZTllZDkyOTJhNjE4ODQ5MzkifQ.eyJpc3MiOiJ0ZWNoLWNoYWxsZW5nZS1hcHBAY2hhcmlzbWF0aWMtdGVhLTI2MjIxMy5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsInN1YiI6InRlY2gtY2hhbGxlbmdlLWFwcEBjaGFyaXNtYXRpYy10ZWEtMjYyMjEzLmlhbS5nc2VydmljZWFjY291bnQuY29tIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhjYXJlLmdvb2dsZWFwaXMuY29tLyIsImlhdCI6MTU3ODI1NzU1MC42ODk4OTcsImV4cCI6MTU3ODI2MTE1MC42ODk4OTd9.TcCwjYFzCg_BmxxP2e-b_Mq_HRyaRkN7dCcNI9ChAkV4Nx3YcassPNHqGmGzDUeW95EatdItmWXkirFpxp_hIRa2YCa4chlale2idRU91-3zZKsGqfEgqfRXlfMDBv_NIBW3Wmw7U15u8z0Rxku3s309Q791s-6Q6V4m7RCJd4gtgMbkI7m2Y5kAFLwOQAoFfdF9XSN85cw4SpfU874sQHGNR8CX380D4BvjQ3Zw8jAkZ8wUekG27QnQw6JmHQsFEacnncIovMoFAO17En9WWTF-mDk_y2Rw_RTtjsga1y0V1MsPTbZVDbRknGuawlbpSCaMLCARbh3sr-w7SXOM-Q"
    
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
                print(response)
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
            completion(.success(data!))
            }.resume()
    }
}
