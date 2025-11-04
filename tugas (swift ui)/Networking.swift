import Foundation
import SwiftyJSON
import Alamofire
import Combine

class Networking: ObservableObject {
    @Published var dataYangDiambil: [Quote] = []

    func ambilData() {
        let url = "https://dummyjson.com/quotes"

        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSON(data: data)
                    let quotesJSON = json["quotes"].arrayValue
                    var quotes: [Quote] = []

                    for item in quotesJSON {
                        let id = item["id"].intValue
                        let quote = item["quote"].stringValue
                        let author = item["author"].stringValue
                        quotes.append(Quote(id: id, quote: quote, author: author))
                    }

                    DispatchQueue.main.async {
                        self.dataYangDiambil = quotes
                        print("✅ Berhasil ambil data dari API (\(quotes.count) quotes)")
                    }

                } catch {
                    print("❌ Gagal parsing JSON:", error.localizedDescription)
                }

            case .failure(let error):
                print("❌ Gagal ambil data:", error.localizedDescription)
            }
        }
    }
}

