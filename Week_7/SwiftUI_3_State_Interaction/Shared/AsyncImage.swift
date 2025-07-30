import Foundation
import SwiftUI

struct AsyncImageExample: View {
    var body: some View {
        
        AsyncImage(url: URL(string: "https://images.unsplash.com/photo-1509043759401-136742328bb3?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80")) { imageView in
            
//            ProgressView()
            imageView//.resizable()
                
        } placeholder: {
            
            ProgressView()
        }
        .frame(width: 100, height: 100)

    }
}

#Preview {
	AsyncImageExample()
}
