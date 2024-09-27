//
//  ContentView.swift
//  Flickr
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = HomeViewModel()
    
    
    var body: some View {
        NavigationStack {
            ZStack {
                getContentView()
            }
            .navigationTitle(AppStrings.flickr)
        }
        .searchable(text: $viewModel.searchQuery)
        
    }
    
    
    @ViewBuilder
    func getContentView() -> some View {
        switch viewModel.viewState {
            case ViewState.Success:
                ImageGridContentView(flickrArray: viewModel.flickrArray)
                
            case ViewState.Idle:
                ImageTitleView(title: AppStrings.searchIdleMessage)
                
            case ViewState.Error :
                ImageTitleView(systemImageName: "exclamationmark.magnifyingglass", title: viewModel.errorMessage)
                
            default:
                ProgressView().progressViewStyle(.circular)
        }
    }
    
    
}

#Preview {
    ContentView()
}
