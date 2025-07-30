import SwiftUI

@main
struct SwiftUI_3_State_InteractionApp: App {
    @State var data: String = "That was neat, wasn't it?"
    
    var body: some Scene {
        WindowGroup {
            EnvironmentVariableExample()
							.environmentObject(GlobalState())
        }
    }
}
