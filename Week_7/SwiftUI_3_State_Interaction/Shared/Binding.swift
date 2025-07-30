import SwiftUI

struct BindingExample: View {
    @State var tapCount: Int = 0

    var body: some View {
        VStack {
            CustomButton()
            CustomButton()
        }
    }
}

struct CustomButton: View {
    @State var taps: Int = 0
    
    var body: some View {
        ZStack {
            Text("Tap count: \(taps)")
                .foregroundColor(Color.white)
                .padding()
                .background {
                    RoundedRectangle(
                        cornerSize: CGSize(width: 8, height: 8))
                    .fill(Color.blue)
                    .shadow(radius: 3)
                }.onTapGesture {
                    taps += 1
                }
        }
    }
}
