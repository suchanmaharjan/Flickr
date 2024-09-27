//
//  FlickrResponseModel.swift
//  Flickr
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import Foundation


struct FlickrResponseModel : Decodable {
    let title : String?
    let link : String?
    let description : String?
    let modified : String?
    let generator : String?
    let items : [FlickrItem]?
}


struct FlickrItem : Decodable, Hashable {
    let title: String
    let link: String
    let media: Media
    let dateTaken: String
    let description: String
    let published: String
    let author: String
    let authorId: String
    let tags: String
    
    enum CodingKeys: String, CodingKey {
        case dateTaken = "date_taken"
        case authorId = "author_id"
        case title, link, media, description
        case published, author, tags
    }
    
    
}


struct Media : Decodable, Hashable {
    let m : String
}
