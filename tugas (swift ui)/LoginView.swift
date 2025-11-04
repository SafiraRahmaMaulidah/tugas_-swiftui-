import SwiftUI

struct LoginView: View {
    @Binding var showLogin: Bool
    @Binding var showGreeting: Bool
    @Binding var namaUser: String

    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer(minLength: 30)

            Text("Login")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.pink)

            Text("Masuk untuk memulai sesi konseling Anda 💬")
                .font(.subheadline)
                .foregroundColor(.gray)

            VStack(spacing: 15) {
                TextField("Nama Anda", text: $namaUser)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .autocapitalization(.words)

                TextField("Email", text: $email)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
            }
            .padding(.horizontal, 40)

            // Tombol Sign In
            Button(action: {
                withAnimation {
                    showLogin = false
                    showGreeting = true
                }
            }) {
                Text("Sign In")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .shadow(radius: 2)
            }
            .padding(.horizontal, 40)
            .padding(.top, 10)

            Button("Kembali") {
                withAnimation { showLogin = false }
            }
            .foregroundColor(.gray)
            .padding(.top, 10)

            Spacer()
        }
        .padding(.top, 40)
        .background(Color.white.ignoresSafeArea())
    }
}

#Preview {
    LoginView(showLogin: .constant(true), showGreeting: .constant(false), namaUser: .constant(""))
}
