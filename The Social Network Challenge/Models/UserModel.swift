import Foundation

struct User: Codable{
    let id: UUID
    let name: String
    let email: String
    let avatar: String?
}
