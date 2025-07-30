import Foundation
import SwiftUI

struct MoreOnListViews: View {
    var body: some View {
        let pokemonTypes = ["Poison", "Leaf"]
        List {
            Section {
              Text("200 LB")
            }  header: {
                Text("Weight")
            }
            Section {
              Text("5'9")
            }  header: {
                Text("Height")
            }
            Section {
              ForEach(pokemonTypes, id: \.self) { type in
                Text(type)
            }
            }  header: {
                Text("Types")
            }
            
        }
    }
}


#Preview {
	MoreOnListViews()
}
