//
//  CryptoViewModel.swift
//  Crypto
//
//  Created by Doğan seçilmiş on 6.07.2022.
//

import Foundation
import UIKit

struct CryptoListViewModel {
    let CryptoCurrencyList : [CryptoCurreny]
    
    func numberOfRowsInSection() -> Int {
        return CryptoCurrencyList.count
    }
    func cryptoAtIndex(_ index: Int) -> CryptoViewModel {
        let crypto = self.CryptoCurrencyList[index]
        
        return CryptoViewModel (cryptoaCurrency:crypto)
    }
    
}
struct CryptoViewModel {
    let cryptoaCurrency : CryptoCurreny
    
    var name : String{
        return cryptoaCurrency.currency
    }
    var price : String {
        return cryptoaCurrency.price
    }
   
}
