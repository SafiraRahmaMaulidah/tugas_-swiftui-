//import SwiftUI
//
//struct ContentView: View {
//    @State private var showLogin = false
//    @State private var showGreeting = false
//    @State private var namaUser = ""
//
//    var body: some View {
//        ZStack {
//            // Warna background lembut pastel pink
//            LinearGradient(
//                gradient: Gradient(colors: [Color.pink.opacity(0.15), Color.white]),
//                startPoint: .top,
//                endPoint: .bottom
//            )
//            .ignoresSafeArea()
//
//            if showGreeting {
//                GreetingView(showGreeting: $showGreeting, namaUser: namaUser)
//                    .transition(.opacity)
//            } else if showLogin {
//                LoginView(showLogin: $showLogin, showGreeting: $showGreeting, namaUser: $namaUser)
//                    .transition(.move(edge: .trailing))
//            } else {
//                OnboardingView()
//                    .transition(.move(edge: .leading))
//            }
//        }
//        .animation(.easeInOut, value: showLogin)
//        .animation(.easeInOut, value: showGreeting)
//    }
//}
//
//#Preview {
//    ContentView()
//}
//
import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var showLogin = false
    @Published var showGreeting = false
    @Published var namaUser = ""
}

struct ContentView: View {
    @StateObject private var vm = ContentViewModel()

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.pink.opacity(0.15), Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            if vm.showGreeting {
              GreetingView(vm: GreetingViewModel(showGreeting: $vm.showGreeting, showLogin: $vm.showLogin, namaUser: $vm.namaUser))
                    .transition(.opacity)
            } else if vm.showLogin {
                LoginView(vm: LoginViewModel(showLogin: $vm.showLogin, showGreeting: $vm.showGreeting, namaUser: $vm.namaUser))
                    .transition(.move(edge: .trailing))
            } else {
                OnboardingView(vm: OnboardingViewModel(showLogin: $vm.showLogin))
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: vm.showLogin)
        .animation(.easeInOut, value: vm.showGreeting)
    }
}

#Preview {
    ContentView()
}
