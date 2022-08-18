import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var isPresenting = false
    
    var body: some View {
        NavigationView{
            
            VStack{
                Text("Login")
                    .font(.system(size: 36))
                    .padding(.bottom, 50)
                
                
                VStack{
                    Text("E-mail")
                        .font(.system(size: 16))
                        .padding(.trailing, 250)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    
                    TextField("example@email.com",
                              text: $email)
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .frame(width: 300, height: 20, alignment: .center)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom,30)
                }
                
                VStack{
                    Text("Senha")
                        .font(.system(size: 16))
                        .padding(.trailing, 250)
                    
                    SecureField("password",
                                text: $password)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(width: 300, height: 20, alignment: .center)
                    .textFieldStyle(.roundedBorder)
                }
                
                Button("Login", action: {
                    //if
                    Task {
                        if let session = await API.login(username: email, password: password) {
                            isPresenting.toggle()
                            // UserDefaults
                        }
                    }
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                .padding(.top, 25)
                
                NavigationLink("", isActive: $isPresenting, destination: { FeedView() })

            }.padding(.bottom, 150)
        
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
