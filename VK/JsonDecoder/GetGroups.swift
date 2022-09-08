
import Foundation

struct GetGroupsResponse: Decodable {
    let response: Response2
}

struct Response2: Decodable {
    let count: Int
    let items: [GetGroups]
}
struct GetGroups: Decodable {
    let id: Int
    let name: String
    let photo200: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case photo200 = "photo_200"
    }
}
    
