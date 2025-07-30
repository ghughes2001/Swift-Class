import Foundation
import SwiftUI

struct EnvironmentVariableExample: View {
	@EnvironmentObject var model: GlobalState
	
	var body: some View {
		Button("\(model.message)") {
			withAnimation(.easeIn(duration: 0.250)) {
				model.beCool()
			}
		}
		.rotationEffect(model.weCoolYet ? .degrees(34) : .degrees(0))
		.scaleEffect(model.weCoolYet ? 2 : 1)
	}
}

class GlobalState: ObservableObject {
	@Published var message: String = "That was cool, wasn't it?"
	@Published var weCoolYet: Bool = false
	
	func beCool() {
		weCoolYet = !weCoolYet
	}
}

//
//#Preview {
//	EnvironmentVariableExample()
//}
