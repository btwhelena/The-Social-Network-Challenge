import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
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
                    
                    
                    TextField("example@email.com",
                              text: $email)
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
                        await API.login(username: email, password: password)
                    }
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                .padding(.top, 25)
            }.padding(.bottom, 150)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
