
import Foundation

class Session {
    
    private init (){}
    
    static let instance = Session()

    var token: String = ""
    var userId: Int = 0
    
}
