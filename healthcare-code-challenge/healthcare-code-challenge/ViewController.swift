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
    
    private let endpoint: URL = URL(string: "https://healthcare.googleapis.com/v1beta1/projects/charismatic-tea-262213/locations/europe-west2/datasets/med_tech_challenge/dicomStores")!

    override func viewDidLoad() {
        super.viewDidLoad()
        connectEndpoint(completion: ({ result in
            switch result {
            case .success(_):
                print("Success")
            case .failure(let error):
                print("Could not connect due to: ")
                print(error)
            }
        })
)
        // Do any additional setup after loading the view.
    }

    func connectEndpoint(completion: @escaping(Result<Bool, APIError>)
            -> Void) {
        let authString = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImtpZCI6ImMyMWQxYWJjNWVjMGZiYTA0OWQ3OTE2ZTllZDkyOTJhNjE4ODQ5MzkifQ.eyJpc3MiOiJ0ZWNoLWNoYWxsZW5nZS1hcHBAY2hhcmlzbWF0aWMtdGVhLTI2MjIxMy5pYW0uZ3NlcnZpY2VhY2NvdW50LmNvbSIsInN1YiI6InRlY2gtY2hhbGxlbmdlLWFwcEBjaGFyaXNtYXRpYy10ZWEtMjYyMjEzLmlhbS5nc2VydmljZWFjY291bnQuY29tIiwiYXVkIjoiaHR0cHM6Ly9oZWFsdGhjYXJlLmdvb2dsZWFwaXMuY29tLyIsImlhdCI6MTU3NzQ1MTE3OS4zNTMzMDk5LCJleHAiOjE1Nzc0NTQ3NzkuMzUzMzA5OX0.Ib2Fg55vnQLh37LLcgBUQ9ERe3PutrCU_ZHUYAjyGnMzOLd-MHH7pCxgRzEWm4vMFhXbt8G-wVr6nGUX53qaMzqKKPRZG0EARxrvUkCQb6ExBIvrowy6T4gZJKl924jU9lFdfhdG_ztGmgkDZlxERD6F_b_o6_IP6ouB3t-9x4KPNUB95VkHhsmgMDKONI1REw_F57xyvlLgFDtrxjrqcn6QpQmtLh23LHcBca7Xplm11Xj0bWy16DVQ7k5lXepUZrS5ew1yxMGE7vqxUTcBpH-AzYLHibrA9sCoL0TgIg4w4Zu8c9RkiAuZlBoS55qsJGSmAfcgdVg-6XPQQLJQWw"
        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue(authString, forHTTPHeaderField: "Authorization")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        _ = URLSession.shared.dataTask(with: urlRequest) {data, response, _ in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                completion(.failure(.responseProblem))
                return
            }
            do {
                let response = try // JSONDecoder().decode(AuthenticationResponse.self, from: jsonData)
                completion(.success(true))
            } catch let error {
                print(error)
                completion(.failure(APIError.decodingProblem))
            }
            }.resume()
    }



}

