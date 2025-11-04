import SwiftUI

struct ContentView: View {
    @State private var showLogin = false
    @State private var showGreeting = false
    @State private var namaUser = ""

    var body: some View {
        ZStack {
            // Warna background lembut pastel pink
            LinearGradient(
                gradient: Gradient(colors: [Color.pink.opacity(0.15), Color.white]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            if showGreeting {
                GreetingView(showGreeting: $showGreeting, namaUser: namaUser)
                    .transition(.opacity)
            } else if showLogin {
                LoginView(showLogin: $showLogin, showGreeting: $showGreeting, namaUser: $namaUser)
                    .transition(.move(edge: .trailing))
            } else {
                OnboardingView(showLogin: $showLogin)
                    .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: showLogin)
        .animation(.easeInOut, value: showGreeting)
    }
}

#Preview {
    ContentView()
}

