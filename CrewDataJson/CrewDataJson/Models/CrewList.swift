import Foundation

// MARK: - Root Response
struct RootResponse: Decodable {
    let responseStatus: String
    let statusCode: String
    let responseMessage: String
    let crudIndicator: String
    let crewCount: Int
    let crewFlightDetails: CrewFlightDetails
    let crewList: [CrewList]
}

// MARK: - Crew Flight Details
struct CrewFlightDetails: Decodable {
    let crudIndicator: String
    let crewFltId: Int
    let crewId: Int
    let fltNumber: String
    let depApt: String
    let arrApt: String
    let depDate: String
    let oprSts: String
    let oprPos: String
    let paLang: String
    let rosterGrade: String
    let destVisitCount: Int
    let fltSufxNum: String
    let airlineCode: String
    let oprSufx: String
}

// MARK: - Crew List
struct CrewList: Decodable {
    let crudIndicator: String
    let crewId: Int
    let staffNumber: String
    let firstName: String
    let middleName: String
    let lastName: String
    let crewGrade: String
    let rosterGrade: String
    let crewDob: String
    let crewDoj: String
    let gender: String
    let oprPos: String
    let destVisitCount: Int
    let oprSts: String
    let nationality: String
    let rankIndicator: String
    let crewType: String
    let languages: [Language]
    let paLang: [Language]
    let crewServPos: [CrewServPo]?
    let specialPermission: [String]
    let expInCurrentGrade: Int
}

// MARK: - Language
struct Language: Decodable {
    let code: String
    let value: String
}

// MARK: - Crew Service Position
struct CrewServPo: Decodable {
    let postionChar: String
    let count: String
}
