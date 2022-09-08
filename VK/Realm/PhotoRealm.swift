
import Foundation
import RealmSwift

class RealmGetPhotoResponse: Object {
    @Persisted var response: List <RealmResponse1>
}

class RealmResponse1: Object {
    @Persisted var count: Int
    @Persisted var items: List <RealmGetPhoto>
}

class RealmGetPhoto: Object {
    @Persisted var id: Int
    @Persisted var sizes: List <RealmPhotoSizes>
}

class RealmPhotoSizes: Object {
    @Persisted var url: String
}
