//
//  Untitled.swift
//  CyberPlay
//
//  Created by Mustapha El Sabbagh on 23/04/2025.
//

import SwiftUI

struct LandingView: View {
    var onStart: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("CyberPlay")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("Scan your website for vulnerabilities in seconds.")
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button(action: onStart) {
                Text("Get Started")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    LandingView(onStart: {})
}
