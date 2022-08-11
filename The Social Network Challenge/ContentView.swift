import SwiftUI
import Foundation

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .task {
                let users = await API.getAllUsers()
                for i in 0...users.count {
                    print(users[i])
                }
                
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
