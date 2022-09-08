

import Foundation

struct GetFriendsResponse: Decodable {
    let response: Response
}
struct Response: Decodable {
    let count: Int
    let items: [Getfriends]
}

struct Getfriends: Decodable {
    let id: Int
    let firstName: String
    let lastName: String
    let photo: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo = "photo_200_orig"
    }
 }



