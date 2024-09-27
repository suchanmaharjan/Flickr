import SwiftUI

struct AppImageView: View {
    @State var imageUrl : String
    var contentMode = ContentMode.fit
    @State var size : CGSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
                    .frame(width: size.width, height: size.height)
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
    }
}

#Preview {
    AppImageView(imageUrl: "")
}
