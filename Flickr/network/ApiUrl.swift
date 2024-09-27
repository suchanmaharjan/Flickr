//
//  ApiUrl.swift
//  Flickr
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import Foundation


struct ApiUrl {
    static let baseUrl = "https://api.flickr.com/services/feeds/photos_public.gne"
    
    static func getSearchUrl(_ searchQuery : String) -> URL? {
        guard var components = URLComponents(string: baseUrl) else {return nil}
        components.queryItems = [
            URLQueryItem(name: "format", value: "json"),
            URLQueryItem(name: "nojsoncallback", value: "1"),
            URLQueryItem(name: "tags", value: searchQuery),
        ]
        guard let url = components.url else {return nil}
        return url
    }
}
