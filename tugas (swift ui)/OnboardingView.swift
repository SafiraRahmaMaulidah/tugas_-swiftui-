import SwiftUI

struct OnboardingView: View {
    @Binding var showLogin: Bool

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

            // Tombol berdampingan
            HStack(spacing: 20) {
                Button("Login") {
                    withAnimation { showLogin = true }
                }
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.pink)
                .foregroundColor(.white)
                .cornerRadius(12)

                Button("Register") {
                    // Bisa diarahkan ke halaman register jika dibutuhkan
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
    }
}

#Preview {
    OnboardingView(showLogin: .constant(false))
}
