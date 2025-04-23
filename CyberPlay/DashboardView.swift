//
//  DashboardView.swift
//  CyberPlay
//
//  Created by Mustapha El Sabbagh on 23/04/2025.
//

import SwiftUI

struct DashboardView: View {
    var onScanComplete: (String) -> Void
    @State private var url: String = ""
    @State private var isScanning: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Enter Website URL")
                .font(.headline)

            TextField("https://example.com", text: $url)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: {
                isScanning = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isScanning = false
                    onScanComplete(url)
                }
            }) {
                if isScanning {
                    ProgressView()
                } else {
                    Text("Scan Website")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .disabled(url.isEmpty || isScanning)
            .padding(.horizontal)
        }
        .padding()
        .navigationTitle("Dashboard")
    }
}

#Preview {
    DashboardView(onScanComplete: { _ in })
}
