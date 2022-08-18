import SwiftUI

struct FeedView: View {
    
    @State var posts: [Post] = []
    @State var showSheet = false
    //@State var textEditor:String = ""
    
    var body: some View {
        VStack{
            HStack{
                
                Button("Postar"){
                    showSheet = true
                }
                .sheet(isPresented: $showSheet,
                       onDismiss: {print("dismissed")},
                       content: {ExampleSheet()})
                
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                .padding(.top, 25)
                

                
                                NavigationLink(
                                    destination: {ProfileView()
                
                                    },
                                    label: {
                                        Image("avatar_img")
                                            .resizable()
                                            .frame(width: 50, height: 50, alignment: .trailing)
                                    }
                                )
                
            }
            List {
                ForEach(posts) { post in
                    HStack{
                        Image("avatar_img")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .topLeading)
                        Text(post.content)
                        
                        VStack{
                            
                            //NOME
                            //DATA
                            //POST
                        }
                    }
                }
            }
            .task {
                posts = await API.getAllPosts()
            }
        }
    }
    
}

struct ExampleSheet: View {
    @Environment(\.presentationMode) var presentationMode
    @State var content:String = ""
    @State var token: String = "sGZiGMupHItrE0S+XGRbEA=="
    
    var body: some View{
        TextEditor(text: $content)
            .frame(width: 350, height: 100, alignment: .center)
            .border(Color.blue)
            .padding(.bottom,30)
            
        Button("POSTAR", action: {
            Task{
                await API.createPost(content:content, token: token)
            }
        })
            //.presentationMode.wrappedValue.dismiss()
            .buttonStyle(.borderedProminent)
            .controlSize(.regular)
            .padding(.top, 25)

    }
}


struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
