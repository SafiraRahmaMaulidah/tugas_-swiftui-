import Foundation
import SwiftyJSON
import Alamofire
import Combine

class Networking {
   

//    func ambilData() -> [Quote] {
//        let url = "https://dummyjson.com/quotes"
//
//        AF.request(url).responseData { response in
//            switch response.result {
//            case .success(let data):
//                do {
//                    let json = try JSON(data: data)
//                    let quotesJSON = json["quotes"].arrayValue
//                    var quotes: [Quote] = [] // ini
//
//                    for item in quotesJSON {
//                        let id = item["id"].intValue
//                        let quote = item["quote"].stringValue
//                        let author = item["author"].stringValue
//                        quotes.append(Quote(id: id, quote: quote, author: author))
//                    }
//
//                    return quotes
//
//                } catch {
//                    print("❌ Gagal parsing JSON:", error.localizedDescription)
//                }
//
//            case .failure(let error):
//                print("❌ Gagal ambil data:", error.localizedDescription)
//            }
//        }
//    }
    
    func ambilData(sapire: @escaping (_ hasil: [Quote]) -> Void) { // completion handler (trailing closure)
        let url = "https://dummyjson.com/quotes"

        AF.request(url).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let json = try JSON(data: data)
                    let quotesJSON = json["quotes"].arrayValue
                    var quotes: [Quote] = [] // ini

                    for item in quotesJSON {
                        let id = item["id"].intValue
                        let quote = item["quote"].stringValue
                        let author = item["author"].stringValue
                        quotes.append(Quote(id: id, quote: quote, author: author))
                    }

//                    return quotes
                    sapire(quotes)

                } catch {
                    print("❌ Gagal parsing JSON:", error.localizedDescription)
                }

            case .failure(let error):
                print("❌ Gagal ambil data:", error.localizedDescription)
            }
        }
    }
}

