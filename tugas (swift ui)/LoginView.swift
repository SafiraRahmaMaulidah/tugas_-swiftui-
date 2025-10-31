import SwiftUI

struct LoginView: View {
    @Binding var showLogin: Bool
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            Text("Login")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.pink)

            VStack(spacing: 15) {
                TextField("Email", text: $email)
                    .textFieldStyle(.roundedBorder)
                SecureField("Password", text: $password)
                    .textFieldStyle(.roundedBorder)
            }
            .padding(.horizontal, 40)

            Button("Sign In") {
                // nanti di sini bisa tambah API login
            }
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.pink)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding(.horizontal, 50)

            Button("Kembali") {
                withAnimation { showLogin = false }
            }
            .foregroundColor(.gray)

            Spacer()
        }
    }
}

#Preview {
    LoginView(showLogin: .constant(true))
}
