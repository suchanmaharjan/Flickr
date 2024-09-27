//
//  FlickrItemView.swift
//  Flickr
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import SwiftUI

struct FlickrItemView: View {
    let item: FlickrItem
    let gridSize: CGFloat

    var body: some View {
        ZStack {
            AppImageView(imageUrl: item.media.m, contentMode: .fill, size: CGSize(width: gridSize, height: gridSize))
            
        }
        .frame(width: gridSize, height: gridSize)
        .background(Color.gray.opacity(0.5))
        .cornerRadius(4)
    }
}
