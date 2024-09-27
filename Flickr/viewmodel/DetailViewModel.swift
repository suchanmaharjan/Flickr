//
//  DetailViewModel.swift
//  Flickr
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import Foundation

class DetailViewModel : ObservableObject {
    @Published var item : FlickrItem? = nil
    @Published var imageHeight  = 0
    @Published var imageWidth = 0
    @Published var scaledImageHeight : CGFloat = 0
    @Published var screenWidth : CGFloat = 0
    
    func setDetail(item : FlickrItem?, screenWidth : CGFloat) {
        self.item = item
        self.screenWidth = screenWidth
        displayHeightWidth()
        scaleImageDimensions()
    }
    
    private func displayHeightWidth() {
        let dimensions = extractDimensions(from: item?.description ?? "")
        if let width = dimensions.width, let height = dimensions.height {
            imageHeight = height
            imageWidth = width
        }
    }
    
    
    func extractDimensions(from html: String) -> (width: Int?, height: Int?) {
        let pattern = #"width="(\d+)" height="(\d+)""#
        let regex = try? NSRegularExpression(pattern: pattern)
        let nsString = html as NSString
        let matches = regex?.matches(in: html, range: NSRange(location: 0, length: nsString.length))
        
        if let match = matches?.first, match.numberOfRanges == 3 {
            let widthString = nsString.substring(with: match.range(at: 1))
            let heightString = nsString.substring(with: match.range(at: 2))
            
            if let width = Int(widthString), let height = Int(heightString) {
                return (width, height)
            }
        }
        return (nil, nil)
    }
    
    func scaleImageDimensions() {
        let aspectRatio = CGFloat(imageWidth) / CGFloat(imageHeight)
        scaledImageHeight = CGFloat(screenWidth / aspectRatio)
    }

    
    
}
