import Foundation

struct Post: Codable, Identifiable {
    let id: String
    let content: String
    let user_id: String
    let created_at: String
    let updated_at: String
}
