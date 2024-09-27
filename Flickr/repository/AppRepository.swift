//
//  AppRepository.swift
//  Flickr
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import Foundation
import Combine


struct AppRepository {
    let apiClient = ApiClient()
    
    func callSearchApi(_ searchQuery : String) -> AnyPublisher<FlickrResponseModel, Error> {
        guard let url = ApiUrl.getSearchUrl(searchQuery) else { return Fail(error: URLError(.badURL))
            .eraseToAnyPublisher() }
        return apiClient.sendRequest(url: url)
    }
}
