//
//  ResultsView.swift
//  CyberPlay
//
//  Created by Mustapha El Sabbagh on 23/04/2025.
//

import SwiftUI

struct ResultsView: View {
    let url: String
    let isSafe = Bool.random()
    var onRestart: () -> Void

    var body: some View {
        VStack(spacing: 20) {
            Text("Scan Results")
                .font(.title)
                .fontWeight(.bold)

            Text("URL: \(url)")
                .foregroundColor(.gray)
                .padding()

            if isSafe {
                Label("No vulnerabilities found", systemImage: "checkmark.seal.fill")
                    .foregroundColor(.green)
                    .font(.headline)
            } else {
                Label("Vulnerabilities detected!", systemImage: "exclamationmark.triangle.fill")
                    .foregroundColor(.red)
                    .font(.headline)
            }

            Button(action: onRestart) {
                Text("Restart")
                    .fontWeight(.semibold)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(12)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding()
        .navigationTitle("Results")
    }
}

#Preview {
    ResultsView(url: "https://example.com", onRestart: {})
}
