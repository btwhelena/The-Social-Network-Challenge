import SwiftUI

struct SignInView: View {
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        
            VStack{
                Text("Cadastro")
                    .font(.system(size: 36))
                    .padding(.bottom, 50)
                
                VStack{
                    Text("Nome")
                        .font(.system(size: 16))
                        .padding(.trailing, 250)
                    
                    
                    TextField("Seu nome",
                              text: $name)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                    .frame(width: 300, height: 20, alignment: .center)
                    .textFieldStyle(.roundedBorder)
                    .padding(.bottom,30)
                }
                
                VStack{
                    Text("E-mail")
                        .font(.system(size: 16))
                        .padding(.trailing, 250)
                    
                    
                    TextField("example@email.com",
                              text: $email)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
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
                
                Button("Cadastre-se", action: {
                    //if
                    Task {
                        await API.createUser(name: name, email: email, password: password)                    }
                })
                .buttonStyle(.borderedProminent)
                .controlSize(.regular)
                .padding(.top, 25)
            }.padding(.bottom, 100)
        }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
