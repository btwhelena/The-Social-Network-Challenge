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
    
    static func getAllUsers() async -> [GetUser] {
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/users")!)
        urlRequest.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let allUsersDecoded = try JSONDecoder().decode([GetUser].self, from: data)
            return allUsersDecoded
        } catch {
            print(error)
        }
        return []
    }
    
    static func createUser(name: String, email: String, password: String) async -> UserSession?{
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/users")!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String:Any] = ["name": name, "email": email, "password": password]
        
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let userdata = try JSONDecoder().decode(UserSession.self, from: data)
            
            let stringResponse = String(data: data, encoding: .utf8)!
            print(stringResponse)
            return userdata
        }
        catch{
            print(error)
        }
        return nil
    }

    
    static func login(username:String, password:String) async -> UserSession? {
        
        let login: String = "\(username):\(password)"
        let logindata = login.data(using: String.Encoding.utf8)!
        let base64 = logindata.base64EncodedString()
        
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/users/login")!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Basic \(base64)", forHTTPHeaderField: "Authorization")
        
        do{
            
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let session = try JSONDecoder().decode(UserSession.self, from: data)
            let stringResponse = String(data: data, encoding: .utf8)!
            print(stringResponse)
            
            //print(session.token)
            
            // Persistir Token
            // UserDefaults (pra estudar, nao é boa pratica)
            // Keychain!!!!11111! (Segura!!) link muito bom que a lais mandou no #codigo :D
            
            return session
        }
        catch{
            print(error)
        }
        return nil
    }
    
    static func logout(token: String) async -> UserSession?{
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/users/logout")!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            let session = try JSONDecoder().decode(UserSession.self, from: data)
            let stringResponse = String(data: data, encoding: .utf8)!
            print(stringResponse)
            print("Logout Successful")
            return session
        }
        catch{
            print(error)
        }
        return nil
    }
    
    static func createPost(content: String, token: String) async -> Post?{
        var urlRequest = URLRequest(url: URL(string: "http://adaspace.local/posts")!)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue("text/plain", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = content.data(using: .utf8)!
        
        do{
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            
            let stringResponse = String(data: data, encoding: .utf8)!
            print(stringResponse)
            
            let userdata = try JSONDecoder().decode(Post.self, from: data)
            
            return userdata
        }
        catch{
            print(error)
        }
        return nil
    }
}
