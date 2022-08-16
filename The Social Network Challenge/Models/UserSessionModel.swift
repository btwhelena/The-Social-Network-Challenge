import Foundation

struct UserSession : Codable {
    let token: String
    let user: User
}
