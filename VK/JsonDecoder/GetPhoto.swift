

import Foundation

struct GetPhotoResponse: Decodable {
    let response: Response1
}
struct Response1: Decodable {
    let count: Int
    let items: [GetPhoto]
}

struct GetPhoto: Decodable {
   let id: Int
   let sizes: [PhotoSizes]
}

struct PhotoSizes: Decodable {
    let url: String
}


