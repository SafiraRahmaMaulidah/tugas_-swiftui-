import SwiftUI
import Combine

class QuoteViewModel: ObservableObject {
  var network = Networking()
  @Published var dataYangDiambil = [Quote]()
  
  func ambilQuote() {
    network.ambilData { hasil in
//      print("EHHEHEHE:", hasil)
      self.dataYangDiambil = hasil
    }
  }
}

struct QuoteView: View {
  @StateObject var vm = QuoteViewModel()
  var body: some View {
    NavigationStack {
      ZStack {
        
        Color.white
          .ignoresSafeArea()
        
        List(vm.dataYangDiambil, id: \.self) { item in
//          Text(item.quote)
          NavigationLink {
            DetailQuoteView(quote: item)
          } label: {
            Text(item.quote)
          }

        }
        
//        VStack(spacing: 15) {
//          
//          
//          if network.dataYangDiambil.isEmpty {
//            ProgressView("Mengambil kutipan...")
//              .tint(.pink)
//              .foregroundColor(.pink.opacity(0.8))
//              .onAppear {
//                network.ambilData()
//              }
//          } else {
//            
//            List(network.dataYangDiambil, id: \.id) { item in
//              NavigationLink(destination: DetailQuoteView(quote: item)) {
//                VStack(alignment: .leading, spacing: 6) {
//                  Text("“\(item.quote)”")
//                    .font(.headline)
//                    .foregroundColor(Color.pink.opacity(0.8))
//                  Text("- \(item.author)")
//                    .font(.subheadline)
//                  .foregroundColor(Color.pink.opacity(0.5))                                 }
//                .padding(.vertical, 6)
//              }
//            }
//            .listStyle(.plain)
//            .scrollContentBackground(.hidden)
//            .background(Color.white)
//          }
//        }
//        .padding(.horizontal)
      }
      .onAppear {
        vm.ambilQuote()
      }
      .navigationTitle("Quote Today")
    }
  }
}

#Preview {
  QuoteView()
}
