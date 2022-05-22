//
//  Home.swift
//  AppleLogin
//
//  Created by LeeJiSoo on 2022/05/22.
//

import SwiftUI
import Firebase

struct Home: View {
    @AppStorage("log_status") var log_Status = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20){
                Text("Logged in successfully using apple login")
                
                Button(action: {
                    // logging out user
                    DispatchQueue.global(qos: .background).async {
                        try? Auth.auth().signOut()
                    }
                    
                    // setting back view to login
                    withAnimation(.easeInOut) {
                        log_Status = false
                    }
                }, label: {
                    Text("Log Out")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding(.vertical, 12)
                        .frame(width: UIScreen.main.bounds.width / 2)
                        .background(Color.pink)
                        .clipShape(Capsule())
                })
            }
            .navigationTitle("Home")
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
