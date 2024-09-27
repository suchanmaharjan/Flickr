//
//  ApiClient.swift
//  Flickr
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import Foundation
import Combine

struct ApiClient {
    
    func sendRequest<T>(url : URL) -> AnyPublisher<T, Error> where T : Decodable {
        
        let request = URLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, (httpResponse.statusCode == 200) else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .subscribe(on: DispatchQueue.global(qos: .background))
            .eraseToAnyPublisher()
    }
    
}
