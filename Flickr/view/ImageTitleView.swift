//
//  ImageTitleView.swift
//  Flickr
//
//  Created by SUCHAN MAHARJAN on 25/09/2024.
//

import SwiftUI

struct ImageTitleView: View {
    var systemImageName = "magnifyingglass"
    var title = ""
    var body: some View {
        ZStack {
            VStack(spacing : 24) {
                Image(systemName: systemImageName)
                    .resizable()
                    .frame(width: 80, height: 80)
                    .opacity(0.5)
                
                Text(title)
                    .font(.title3)
                    .multilineTextAlignment(.center)
                
            }
        }
    }
}

#Preview {
    ImageTitleView()
}
