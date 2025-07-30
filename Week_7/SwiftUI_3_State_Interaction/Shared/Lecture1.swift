import Foundation
import SwiftUI

struct ColorPickerExample: View {
	static let corner: CGSize = CGSize(width: 22,height: 22)
	
	@State var red:   CGFloat = 0.0
	@State var green: CGFloat = 0.0
	@State var blue:  CGFloat = 0.0
	
	var color: Color {
		Color(cgColor: CGColor(red: red, green: green, blue: blue, alpha: 1.0))
	}
	
	var body: some View {
		ZStack {
			Rectangle()
				.fill(color)
			
			HStack {
				ColorChannelButton(channelEnum: .red,   channel: $red)
				ColorChannelButton(channelEnum: .green, channel: $green)
				ColorChannelButton(channelEnum: .blue,  channel: $blue)
			}
			.frame(maxHeight: 150)
			.padding()
			// top-most elements
		}
		
	}
}

enum ColorChannel {
	case red,
			 green,
			 blue
}

struct ColorChannelButton: View {
	var channelEnum: ColorChannel
	@Binding var channel: CGFloat
	
	var buttonColor: Color {
		switch channelEnum {
		case .red: Color.red
		case .green: Color.green
		case .blue: Color.blue
		}
	}
	
	var body: some View {
		RoundedRectangle(cornerSize: ColorPickerExample.corner)
			.fill(buttonColor)
			.onTapGesture {
				channel += 0.1
			}
	}
}

#Preview {
	ColorPickerExample()
}
