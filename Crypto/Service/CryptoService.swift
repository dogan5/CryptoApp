//
//  CryptoService.swift
//  Crypto
//
//  Created by Doğan seçilmiş on 5.07.2022.
//

import Foundation

class CryptoService {
    
    
    func takeCurrencies(url: URL , completion:@escaping ([CryptoCurreny]?) -> ()){
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
                
                let cryptoList = try? JSONDecoder().decode([CryptoCurreny].self, from: data)
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
            
        }.resume()
    }
}
