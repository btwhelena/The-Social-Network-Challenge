import Foundation

struct GetUser: Decodable{
    let id: String
    let name: String
    let email: String
    let avatar: String?
}
