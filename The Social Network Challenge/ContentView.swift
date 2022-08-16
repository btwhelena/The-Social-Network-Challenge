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
                //await API.createUser()
                let user = await API.getAllUsers()
                for i in 0...user.count {
                    print("------- Users --------")
                    print(user[i])
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
