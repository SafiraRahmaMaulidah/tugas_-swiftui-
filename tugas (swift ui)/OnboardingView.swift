//import SwiftUI
//import Combine
//
//
//
//struct OnboardingView: View {
//    @Binding var showLogin: Bool
//
//    var body: some View {
//        VStack(spacing: 25) {
//            Spacer()
//
//            Image(systemName: "heart.text.square.fill")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 140)
//                .foregroundColor(.pink)
//
//            Text("Konseling Keluarga Online")
//                .font(.title2)
//                .fontWeight(.bold)
//                .foregroundColor(.pink)
//
//            Text("Temukan solusi keluarga harmonis lewat konselor profesional secara daring.")
//                .font(.subheadline)
//                .multilineTextAlignment(.center)
//                .foregroundColor(.gray)
//                .padding(.horizontal, 40)
//
//            Spacer()
//
//            // Tombol berdampingan
//            HStack(spacing: 20) {
//                Button("Login") {
//                    withAnimation { showLogin = true }
//                }
//                .fontWeight(.semibold)
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(Color.pink)
//                .foregroundColor(.white)
//                .cornerRadius(12)
//
//                Button("Register") {
//                    // Bisa diarahkan ke halaman register jika dibutuhkan
//                }
//                .fontWeight(.semibold)
//                .frame(maxWidth: .infinity)
//                .padding()
//                .background(Color.white)
//                .foregroundColor(.pink)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 12)
//                        .stroke(Color.pink, lineWidth: 1)
//                )
//            }
//            .padding(.horizontal, 50)
//
//            Spacer()
//        }
//        .background(Color(.systemPink).opacity(0.05).ignoresSafeArea())
//    }
//}
//
//#Preview {
//    OnboardingView(showLogin: .constant(false))
//}
//import SwiftUI
//import Combine
//
//// VIEW MODEL
//class OnboardingViewModel: ObservableObject {
//    @Published var showLogin: Bool = false
//    
//    func goToLogin() {
//        withAnimation {
//            showLogin = true
//        }
//    }
//    
//    func goToRegister() {
//        // Nanti bisa diarahkan ke halaman register
//        print("Register ditekan")
//    }
//}
//
//// VIEW
//struct OnboardingView: View {
//    @StateObject var vm = OnboardingViewModel()
//    
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 25) {
//                Spacer()
//
//                Image(systemName: "heart.text.square.fill")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 140)
//                    .foregroundColor(.pink)
//
//                Text("Konseling Keluarga Online")
//                    .font(.title2)
//                    .fontWeight(.bold)
//                    .foregroundColor(.pink)
//
//                Text("Temukan solusi keluarga harmonis lewat konselor profesional secara daring.")
//                    .font(.subheadline)
//                    .multilineTextAlignment(.center)
//                    .foregroundColor(.gray)
//                    .padding(.horizontal, 40)
//
//                Spacer()
//
//                HStack(spacing: 20) {
//                    Button("Login") {
//                        vm.goToLogin()
//                    }
//                    .fontWeight(.semibold)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.pink)
//                    .foregroundColor(.white)
//                    .cornerRadius(12)
//
//                    Button("Register") {
//                        vm.goToRegister()
//                    }
//                    .fontWeight(.semibold)
//                    .frame(maxWidth: .infinity)
//                    .padding()
//                    .background(Color.white)
//                    .foregroundColor(.pink)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 12)
//                            .stroke(Color.pink, lineWidth: 1)
//                    )
//                }
//                .padding(.horizontal, 50)
//
//                Spacer()
//            }
//            .background(Color(.systemPink).opacity(0.05).ignoresSafeArea())
//            .navigationTitle("Onboarding")
//        }
//    }
//}
//
//#Preview {
//    OnboardingView()
//}
import SwiftUI
import Combine

class OnboardingViewModel: ObservableObject {
    @Binding var showLogin: Bool

    init(showLogin: Binding<Bool>) {
        _showLogin = showLogin
    }
    
    func goToLogin() {
        withAnimation {
            showLogin = true
        }
    }
    
    func goToRegister() {
        print("Register ditekan")
    }
}

struct OnboardingView: View {
    @ObservedObject var vm: OnboardingViewModel

    var body: some View {
        VStack(spacing: 25) {
            Spacer()

            Image(systemName: "heart.text.square.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 140)
                .foregroundColor(.pink)

            Text("Konseling Keluarga Online")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.pink)

            Text("Temukan solusi keluarga harmonis lewat konselor profesional secara daring.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                .padding(.horizontal, 40)

            Spacer()

            HStack(spacing: 20) {
                Button("Login") {
                    vm.goToLogin()
                }
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(12)

                Button("Register") {
                    vm.goToRegister()
                }
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.white)
                .foregroundColor(.pink)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.pink, lineWidth: 1)
                )
            }
            .padding(.horizontal, 50)

            Spacer()
        }
        .background(Color(.systemPink).opacity(0.05).ignoresSafeArea())
        .navigationTitle("Onboarding")
    }
}

#Preview {
    OnboardingView(vm: OnboardingViewModel(showLogin: .constant(false)))
}
