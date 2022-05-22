import SwiftUI
import AuthenticationServices

struct Login: View {
    @StateObject var loginData = LoginViewModel()
    
    var body: some View {
        SignInWithAppleButton(.signIn,
                              onRequest: { request in
            loginData.nonce = randomNonceString()
            request.requestedScopes = [.fullName, .email]
            request.nonce = sha256(loginData.nonce)
        },
                              onCompletion: { result in
            switch result {
            case .success(let authResults):
                print("Authorization successful.")
                guard let credential = authResults.credential as? ASAuthorizationAppleIDCredential else {
                    print("error with firebase")
                    return
                }
                loginData.authenticate(credential: credential)
            case .failure(let error):
                print("Authorization failed: " + error.localizedDescription)
            }
        })
        .frame(height: 55)
        .clipShape(Capsule())
        .padding(.horizontal, 30)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
