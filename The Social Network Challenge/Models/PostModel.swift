import Foundation

struct Post: Decodable {
    let id: String
    let content: String
    let userId: String
    let createdAt: String
    let updatedAt: String
}
