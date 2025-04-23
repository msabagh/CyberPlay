//
//  FlowController.swift
//  CyberPlay
//
//  Created by Mustapha El Sabbagh on 23/04/2025.
//

import SwiftUI

enum AppScreen: Hashable {
    case landing
    case dashboard
    case results(url: String)
}

struct FlowController: View {
    @State private var path: [AppScreen] = []

    var body: some View {
        NavigationStack(path: $path) {
            LandingView {
                path.append(.dashboard)
            }
            .navigationDestination(for: AppScreen.self) { screen in
                switch screen {
                case .dashboard:
                    DashboardView { scannedURL in
                        path.append(.results(url: scannedURL))
                    }
                case .results(let url):
                    ResultsView(url: url) {
                        path = [] // Go back to LandingView
                    }
                case .landing:
                    LandingView {
                        path.append(.dashboard)
                    }
                }
            }
        }
    }
}
