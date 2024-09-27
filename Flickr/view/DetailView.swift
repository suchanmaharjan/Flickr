//
//  DetailView.swift
//  Flickr
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import SwiftUI

struct DetailView: View {
    @StateObject var viewModel = DetailViewModel()
    var item: FlickrItem
    let screenWidth = UIScreen.main.bounds.width
    let imageHeight : CGFloat = 400
    
    var body: some View {
        ScrollView(showsIndicators : false) {
            VStack {
                
                AsyncImage(url: URL(string: item.media.m)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: viewModel.screenWidth, height: viewModel.scaledImageHeight)
                            .clipped()
                    case .failure(_):
                        Image(systemName: "photo.fill")
                            .resizable()
                            .frame(width: 44, height: 44)
                    @unknown default:
                        Image(systemName: "photo.fill")
                            .resizable()
                            .frame(width: 44, height: 44)
                    }
                }
                
                detailInfo()
                
                
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.setDetail(item: self.item, screenWidth: screenWidth)
        }
    }
    
    @ViewBuilder
    private func detailInfo() -> some View {
        VStack {
            Spacer()
            
            VStack(alignment : .leading, spacing : 4) {
                
                HStack {
                    
                    Text(viewModel.item?.title ?? "Unknown Title")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                
                Text(viewModel.item?.author ?? "Unknown Author")
                    .fontWeight(.medium)
                
                
                Text(AppDateUtils.formattedDate(from: viewModel.item?.published ?? ""))
                    .font(.subheadline)
                
                Text("\(viewModel.imageHeight)h x \(viewModel.imageWidth)w")
                    .font(.subheadline)
                
                
                
                Text("\(viewModel.item?.description.htmlAttributedString() ?? NSMutableAttributedString(string: viewModel.item?.description ?? ""))")
                    .font(.body)
                
                
            }
            .padding()
            
        }
    }
    
}
