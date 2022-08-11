import Foundation

class API{
    
    static func getAllPosts() async -> [Post] {
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/posts")!)
        
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let allPosts: [Post] = try! JSONDecoder().decode([Post].self, from: data)
            print(allPosts)
            return allPosts
        }
        catch{
            print(error)
        }
        return []
    }
    
}
