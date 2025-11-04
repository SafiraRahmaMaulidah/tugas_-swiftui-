import SwiftUI

struct QuoteView: View {
    @StateObject private var network = Networking()

    var body: some View {
        NavigationStack {
            ZStack {
              
                Color.white
                    .ignoresSafeArea()

                VStack(spacing: 15) {
                  

                    if network.dataYangDiambil.isEmpty {
                        ProgressView("Mengambil kutipan...")
                            .tint(.pink)
                            .foregroundColor(.pink.opacity(0.8))
                            .onAppear {
                                network.ambilData()
                            }
                    } else {
                       
                        List(network.dataYangDiambil, id: \.id) { item in
                            NavigationLink(destination: DetailQuoteView(quote: item)) {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text("“\(item.quote)”")
                                        .font(.headline)
                                        .foregroundColor(Color.pink.opacity(0.8))
                                    Text("- \(item.author)")
                                        .font(.subheadline)
                                        .foregroundColor(Color.pink.opacity(0.5))                                 }
                                .padding(.vertical, 6)
                            }
                        }
                        .listStyle(.plain)
                        .scrollContentBackground(.hidden)
                        .background(Color.white)
                    }
                }
                .padding(.horizontal)
            }
            .navigationTitle("Quote Today")
        }
    }
}

#Preview {
    QuoteView()
}
