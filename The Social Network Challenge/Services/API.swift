import Foundation

class API{
    
    static func getAllPosts() async -> [Post] {
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/posts")!)
        urlRequest.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let allPostsDecoded = try JSONDecoder().decode([Post].self, from: data)
            
            return allPostsDecoded
        } catch {
            print(error)
        }
        return []
    }
    
    static func createUser() async -> Bool{
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/users")!)
        urlRequest.httpMethod = "POST"

        
        do{
            urlRequest.httpBody = try JSONEncoder().encode(User(name: "Hanah",
                                                                email: "hanah.santana6@gmail.com",
                                                                password: "bolodemurango"))
            let (_, response) = try await URLSession.shared.data(for: urlRequest)
            if let responseHeader = response as? HTTPURLResponse {
                return (responseHeader.statusCode == 200)
            }
        }
        catch{
            print(error)
        }
        return false
        
        //let userData: Data? = try? JSONSerialization.data(withJSONObject: body, options: .fragmentsAllowed)
        //urlRequest.httpBody = userData
 
        
//        let string = "{\"key\": \"value\"}"
//        let data = string.data(using: .utf8)!
//        if let json: [String : Any] = try? JSONSerialization.jsonObject(with: data) as? [String: Any] {
//            print(json)
//            print(json["key"])
//        }
        
//        do{
//            let (_, response) = try await URLSession.shared.data(for: urlRequest)
//
//        }
    }
    
    static func getAllUsers() async -> [User] {
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/users")!)
        urlRequest.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let allUsersDecoded = try JSONDecoder().decode([User].self, from: data)
            
            return allUsersDecoded
        } catch {
            print(error)
        }
        return []
    }

}
