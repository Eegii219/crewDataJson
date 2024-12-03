//
//  ContentView.swift
//  CrewDataJson
//
//  Created by Enkhtsetseg Unurbayar on 12/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = CrewViewModel()

    var body: some View {
        NavigationView {
            VStack {
                if let flightDetails = viewModel.flightDetails {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Flight Details")
                            .font(.headline)
                        Text("Flight Number: \(flightDetails.fltNumber)")
                        Text("Departure: \(flightDetails.depApt)")
                        Text("Arrival: \(flightDetails.arrApt)")
                    }
                    .padding()
                }

                List(viewModel.crewList, id: \.crewId) { crew in
                    VStack(alignment: .leading) {
                        Text("\(crew.firstName) \(crew.lastName)")
                            .font(.headline)
                        Text("Grade: \(crew.crewGrade)")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                    }
                }

            }
            .navigationTitle("Crew Details")
            .task {
                await viewModel.loadCrewData()
            }
            .alert("Error", isPresented: Binding<Bool>(
                get: { viewModel.errorMessage != nil },
                set: { if !$0 { viewModel.errorMessage = nil } }
            )) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.errorMessage ?? "Unknown Error")
            }
        }
    }
}

#Preview {
    ContentView()
}
