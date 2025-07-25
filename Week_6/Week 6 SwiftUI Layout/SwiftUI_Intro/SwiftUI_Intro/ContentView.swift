import SwiftUI

struct ForecastDay: View {
	let day: String
	let isSunny: Bool
	
	var body: some View {
		let image: String = isSunny
			? "sun.min.fill"
			: "cloud.fill"
		
		let imageColor: Color = isSunny
			? .yellow
			: .white
		
		VStack {
			Image(systemName: image)
				.foregroundStyle(imageColor)
				.imageScale(.large)
				.padding([.bottom], 4)
			Text(day)
				.bold()
			Spacer()
			Group {
				Text("High: 101")
				Text("Low: 90")
					.foregroundStyle(.gray)
			}
			.font(.caption)
		}
		.padding(.all, 16)
		.background()
		.backgroundStyle(
			Color(
				CGColor(red: 0.9, green: 0.9, blue: 1.0, alpha: 1.0)))
		.frame(maxWidth: 90, maxHeight: 120)
		.border(.black)
		
	}
}

struct ContentView: View {
	var body: some View {
		ScrollView([.horizontal]) {
			HStack {
				ForecastDay(day: "Mon", isSunny: true)
				ForecastDay(day: "Tue", isSunny: false)
				ForecastDay(day: "Wed", isSunny: false)
				ForecastDay(day: "Thu", isSunny: true)
			}
		}
	}
}

#Preview {
	ContentView()
}

// Everything is a View
// View Modifiers help us add functionality
// Views are a Tree of Views
