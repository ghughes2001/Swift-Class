import Foundation
import SwiftUI


let names = ["Michael", "Jason", "Sarah", "Emma"]
struct Lecture2: View {
	@State var showMore: Bool = false
	@State var searchText: String = ""
	
	var body: some View {
		NavigationStack {
			let filteredNames = names.filter { name in
				name.starts(with: searchText)
			}
			
			List(filteredNames, id: \.self) { name in
				NavigationLink(destination: {
					DetailPage(name: name)
				}, label: {
					Text(name)
				})
			}
			.searchable(text: $searchText, prompt: "Search")
			.navigationTitle("Contacts")
			
		}
	}
}

struct DetailPage: View {
	let name: String
	
	var body: some View {
		Text("This is \(name)'s page.")
			.navigationTitle(name)
	}
}


#Preview {
	Lecture2()
}

//var body: some View {
//	List {
//		ForEach(0..<5, content: { arg in
//			Text("\(arg)")
//		})
//		
//		Section {
//			Text("Name: Mike")
//			Text("Name: Mike")
//		}
//		
//		DisclosureGroup("More Details", isExpanded: $showMore, content: {
//			Text("Name: Mike")
//			Text("Name: Mike")
//		})
//	}
//}
