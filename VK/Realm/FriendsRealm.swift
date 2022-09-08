//
//  FriendsRealm.swift
//  VK
//
//  Created by Alexander Bubeshka on 23.08.22.
//

import Foundation
import RealmSwift

class RealmGetFriendsResponse: Object {
    @Persisted var response: List <RealmResponse>
}

class RealmResponse: Object {
    @Persisted var count: Int
    @Persisted var items: List <FriendsRealm>
}

class FriendsRealm: Object {
    @Persisted var id: Int
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var photo: String
}


