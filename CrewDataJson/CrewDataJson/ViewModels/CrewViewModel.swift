//
//  CrewViewModel.swift
//  CrewDataJson
//
//  Created by Enkhtsetseg Unurbayar on 12/3/24.
//
import Foundation
import Combine

import SwiftUI

@MainActor
class CrewViewModel: ObservableObject {
    @Published var crewList: [CrewList] = []
    @Published var flightDetails: CrewFlightDetails?
    @Published var errorMessage: String?

    private let networkingManager = JsonNetworkingManager()

    func loadCrewData() async {
        do {
            let data: RootResponse = try await networkingManager.retrieveDataFromURL(url: "crewData", modelType: RootResponse.self)
            crewList = data.crewList
            flightDetails = data.crewFlightDetails
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
