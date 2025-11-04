//
//  DetailQuoteView.swift
//  tugas (swift ui)
//
//  Created by MacBook Pro M1 on 31/10/25.
//

import SwiftUI

struct DetailQuoteView: View {
    let quote: Quote
    
    var body: some View {
        ZStack {
            Color(.systemPink).opacity(0.05).ignoresSafeArea()
            
            VStack(spacing: 20) {
               
                
                Text("“\(quote.quote)”")
                    .font(.title3)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("- \(quote.author)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Spacer()
            }
            .padding()
        }
       
    }
}

#Preview {
    DetailQuoteView(quote: Quote(id: 1, quote: "", author: ""))
}
