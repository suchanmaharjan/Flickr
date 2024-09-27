//
//  ImageGridContentView.swift
//  Flickr
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import SwiftUI

struct ImageGridContentView: View {
    let gridSize = UIScreen.main.bounds.width / 3
    var flickrArray : [FlickrItem] = []
    
    var body: some View {
        ScrollView(showsIndicators : false) {
            LazyVGrid(columns: gridColumns, spacing: 2,
                      content: {
                ForEach(flickrArray, id: \.self) { item in
                    NavigationLink {
                        DetailView(item: item)
                    } label: {
                        FlickrItemView(item: item, gridSize: gridSize)
                    }
                }
            })
        }
    }
    
    private var gridColumns: [GridItem] {
        Array(repeating: GridItem(.fixed(gridSize), spacing: 2), count: 3)
    }
}

#Preview {
    ImageGridContentView()
}
