import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .task {
//                let post = await API.getAllPosts()
//                for i in 0...post.count {
//                    print(post[i])
//                }
//                await API.createUser(name: "Helena", email: "helena123@gmail.com", password: "bolodemurango")
//                let user = await API.getAllUsers()
//                for i in 0...user.count {
//                    print("------- Users --------")
//                    print(user[i])
//
//                }
//                await API.login(username: "helena123@gmail.com", password: "bolodemurango")
                await API.logout(token: "se0V\/cU3XJdNoIpvUs48pg=="token: <#String#>)
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
