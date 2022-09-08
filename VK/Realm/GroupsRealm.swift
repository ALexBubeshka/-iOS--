
import Foundation
import RealmSwift

class RealmGroupsResponse: Object {
    @Persisted var response: List <RealmResponse2>
}

class RealmResponse2: Object {
    @Persisted var count: Int
    @Persisted var items: List <RealmGetGroups>
}

class RealmGetGroups: Object {
    @Persisted var id: Int
    @Persisted var name: String
    @Persisted var photo200: String
}
