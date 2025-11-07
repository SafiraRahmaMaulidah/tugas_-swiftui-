//import SwiftUI
//
//struct GreetingView: View {
//    @Binding var showGreeting: Bool
//    var namaUser: String
//
//    var body: some View {
//        NavigationStack { // 👈 penting
//            VStack(spacing: 25) {
//                Spacer()
//
//                Text("Haloo, \(namaUser.isEmpty ? "Sahabat" : namaUser)! 💕")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.pink)
//                    .multilineTextAlignment(.center)
//
//                Text("Mau konsul apa hari ini?")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//
//                Image(systemName: "person.2.fill")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 150)
//                    .foregroundColor(.pink.opacity(0.7))
//                    .padding(.top, 20)
//
//                Spacer()
//
//                // Tombol ke QuoteView
//                NavigationLink(destination: QuoteView()) {
//                    Text("See Quote Today")
//                        .fontWeight(.semibold)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.pink.opacity(0.9))
//                        .foregroundColor(.white)
//                        .cornerRadius(12)
//                }
//                .padding(.horizontal, 40)
//                .shadow(radius: 2)
//
//                // Tombol logout
//                Button("Logout") {
//                    withAnimation { showGreeting = false }
//                }
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(Color.white)
//                .foregroundColor(.pink)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 12)
//                        .stroke(Color.pink, lineWidth: 1)
//                )
//                .padding(.horizontal, 40)
//
//                Spacer(minLength: 20)
//            }
//            .padding()
//            .background(Color.white.ignoresSafeArea())
//            .navigationTitle("Selamat Datang 🌸")
//        }
//    }
//}
import SwiftUI
import Combine

class GreetingViewModel: ObservableObject {
    @Binding var showGreeting: Bool
  @Binding var showLogin: Bool
     @Binding var namaUser: String
     
     init(showGreeting: Binding<Bool>, showLogin: Binding<Bool>, namaUser: Binding<String>) {
         _showGreeting = showGreeting
         _showLogin = showLogin
         _namaUser = namaUser
     }
    
  func logout() {
         withAnimation {
             showGreeting = false
             showLogin = false   // 👈 balik ke onboarding
             namaUser = ""
         }
     }
}

struct GreetingView: View {
    @ObservedObject var vm: GreetingViewModel
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 25) {
                Spacer()
                
                Text("Haloo, \(vm.namaUser.isEmpty ? "Sahabat" : vm.namaUser)! 💕")
                    .font(.title2)
                    .fontWeight(.bold) 
                    .foregroundColor(.pink)
                    .multilineTextAlignment(.center)
                
                Text("Mau konsul apa hari ini?")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Image(systemName: "person.2.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150)
                    .foregroundColor(.pink.opacity(0.7))
                    .padding(.top, 20)
                
                Spacer()
                
                NavigationLink(destination: QuoteView()) {
                    Text("See Quote Today")
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.pink.opacity(0.9))
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
                .padding(.horizontal, 40)
                .shadow(radius: 2)
                
                Button("Logout") {
                    vm.logout()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .foregroundColor(.pink)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.pink, lineWidth: 1)
                )
                .padding(.horizontal, 40)
                
                Spacer(minLength: 20)
            }
            .padding()
            .background(Color.white.ignoresSafeArea())
            .navigationTitle("Selamat Datang 🌸")
        }
    }
}

#Preview {
    GreetingView(
        vm: GreetingViewModel(
            showGreeting: .constant(true),
            showLogin: .constant(false),
            namaUser: .constant("sapira")
        )
    )
}
