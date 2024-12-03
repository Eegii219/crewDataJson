//
//  JsonNetworking.swift
//  CrewDataJson
//
//  Created by Enkhtsetseg Unurbayar on 12/3/24.
//

import Foundation

public protocol JsonNetworking {
    func retrieveDataFromURL<T: Decodable>(url: String, modelType: T.Type) async throws -> T
}
