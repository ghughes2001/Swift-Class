//
//  ContentView.swift
//  SwiftUI_Profile_Page
//
//  Created by Grant David Hughes on 7/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 16) {
            Image("images")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 100)
                .clipShape(Circle())
                .shadow(radius: 5)
            
            VStack(spacing: 4) {
                Text("Klein Moretti")
                    .font(.title2)
                    .fontWeight(.semibold)
                Text("Transmigrators, The Fool, Beyonder, and many more...")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            
            Divider()
            
            HStack(spacing: 20) {
                StatView(number: "33", label: "Age")
                StatView(number: "1.8m", label: "Height")
                StatView(number: "The Fool (Fool, Error, and Door Pathways)", label: "Pathway")
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.gray.opacity(0.1))
        .cornerRadius(20)
        .shadow(color: Color.black.opacity(0.05), radius: 8, x: 0, y: 4)
        .padding(.horizontal)
    }
}

struct StatView: View {
    var number: String
    var label: String

    var body: some View {
        VStack {
            Text(number)
                .font(.headline)
                .fontWeight(.bold)
            Text(label)
                .font(.caption)
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: 100)
    }
}

#Preview {
    ContentView()
}
