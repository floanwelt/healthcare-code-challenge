//
//  ViewController.swift
//  healthcare-code-challenge
//
//  Created by Florian Abel on 22.12.19.
//  Copyright © 2019 Florian Abel. All rights reserved.
//

import UIKit

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
    case otherProblem
}

class ViewController: UIViewController {
    
    private let authString: String = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6ImMyMWQxYWJjNWVjMGZiYTA0OWQ3OTE2ZTllZDkyOTJhNjE4ODQ5MzkifQ.eyJpc3MiOiJ0ZWNoLWNoYWxsZW5nZS1hcHBAY2hhcmlzbWF0aWMtdGVhLTI2MjIxMy5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsInN1YiI6InRlY2gtY2hhbGxlbmdlLWFwcEBjaGFyaXNtYXRpYy10ZWEtMjYyMjEzLmlhbS5nc2VydmljZWFjY291bnQuY29tIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhjYXJlLmdvb2dsZWFwaXMuY29tLyIsImlhdCI6MTU3ODI0NTc5MC45NTI5MzksImV4cCI6MTU3ODI0OTM5MC45NTI5Mzl9.MftNopitAoUs36TlEAnMo1cEhm-ywJk_Ah592o_Hu7MPXBgGig19BD5d5dEYSUfIPaKBhXh_x8xkSgrb6G0SahKj7taxHcvp5sa6MWk6X_kGPWUJsJsAzbUBQpGWrMQIQXoaY-9nHfcoEvpF37uAltBbG1wHNv91cP-eflCUt1xQ4Yqd2UfJW3ReLi6u0yJ3Aw9_3VNS0wHNYtOEcH8hBJ0xVA9KmrLuCLBdHa215c996A4dDU2U1-LcA3kEWJf1QH1nuvKlGvqSSl3DoyjuDTxjFrLXXrRZpHgiRj_GG2niZH3rJzO-liTCL-nz0_QyWE16HvJHH--IZAAlomiH4A"
    private let endpoint: URL = URL(string: "https://healthcare.googleapis.com/v1beta1/projects/charismatic-tea-262213/locations/europe-west2/datasets/med_tech_challenge/dicomStores")!
    private let studyMetaDataEndpoint: URL = URL(string: "https://healthcare.googleapis.com/v1beta1/projects/charismatic-tea-262213/locations/europe-west2/datasets/med_tech_challenge/dicomStores/tech_challenge_dicom_store/dicomWeb/instances?StudyInstanceUID=1.2.392.100224.1.1210.3722113121538292546519015974142145381201")!
    private let sampleJPEGENdpoint: URL = URL(string: "https://healthcare.googleapis.com/v1beta1/projects/charismatic-tea-262213/locations/europe-west2/datasets/med_tech_challenge/dicomStores/tech_challenge_dicom_store/dicomWeb/studies/1.2.392.100224.1.1210.3722113121538292546519015974142145381201/series/1.2.392.100224.1.1220.207224862311741079268136963293236137135254/instances/1.2.392.100224.1.1230.02390100247997378184152312248135213187/frames/1/rendered")!
    private let WSIEndpoint: URL = URL(string: "https://healthcare.googleapis.com/v1beta1/projects/charismatic-tea-262213/locations/europe-west2/datasets/med_tech_challenge/dicomStores/tech_challenge_dicom_store/dicomWeb/studies/1.2.392.100224.1.1210.3722113121538292546519015974142145381201/series/1.2.392.100224.1.1220.207224862311741079268136963293236137135254/instances/1.2.392.100224.1.1230.02390100247997378184152312248135213187")!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        connectEndpoint(completion: ({ result in
//            switch result {
//            case .success(_):
//                print("Success")
//            case .failure(let error):
//                print("Could not connect due to: ")
//                print(error)
//            }
//        })
//)
        // Do any additional setup after loading the view.
    }

    func connectEndpoint(completion: @escaping(Result<Bool, APIError>)
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
                
                completion(.success(true))
            } catch let error {
                print(error)
                completion(.failure(APIError.decodingProblem))
            }
            }.resume()
    }
    
    
    func loadWSI(completion: @escaping(Result<Bool, APIError>)
            -> Void) {
        var urlRequest = URLRequest(url: WSIEndpoint)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(authString, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("Accept", forHTTPHeaderField: "application/dicom")
        _ = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.responseProblem))
                return
            }
            do {
                
                completion(.success(true))
            } catch let error {
                print(error)
                completion(.failure(APIError.decodingProblem))
            }
            }.resume()
    }



}
