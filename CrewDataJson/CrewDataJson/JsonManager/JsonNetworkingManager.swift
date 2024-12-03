import Foundation

public class JsonNetworkingManager: JsonNetworking {
    
    public init() {}
    
    public func retrieveDataFromURL<T: Decodable>(url: String, modelType: T.Type) async throws -> T {
        // Local File: Attempt to read JSON data from a file
        guard let filePath = Bundle.main.path(forResource: "crewData", ofType: "json") else {
            throw NetworkError.fileNotFound
        }
        
        let data = try Data(contentsOf: URL(fileURLWithPath: filePath))
        return try decodeJSON(data: data, modelType: modelType)
    }
    
    /// Helper function to decode JSON data into the specified type.
    private func decodeJSON<T: Decodable>(data: Data, modelType: T.Type) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError
        }
    }
}
