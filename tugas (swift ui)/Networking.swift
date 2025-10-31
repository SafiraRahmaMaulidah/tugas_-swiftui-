//
//  Networking.swift
//  fetching api
//
//  Created by iCodeWave Community on 07/10/25.
//

import Foundation
import SwiftyJSON
import Alamofire

class Networking {
    
    static let shared = Networking()
    
    func ambilData(completion: @escaping ([Quote]) -> Void) {
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

                    print("✅ Berhasil ambil data dari API (\(quotes.count) quotes)")
                    completion(quotes)

                } catch {
                    print("❌ Gagal parsing JSON:", error.localizedDescription)
                    completion([])
                }

            case .failure(let error):
                print("❌ Gagal ambil data:", error.localizedDescription)
                completion([])
            }
        }
    }
}


