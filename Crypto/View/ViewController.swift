//
//  ViewController.swift
//  Crypto
//
//  Created by Doğan seçilmiş on 5.07.2022.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
   
    @IBOutlet weak var tableView: UITableView!
    private var cryptoListViewModel : CryptoListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
      
        
    getData()
                    
    }
    
    func getData () {
        
        let url = URL(string:"https://api.nomics.com/v1/currencies/ticker?key=4d8bacf2c8b3b024e62e77b694aa2ba3606014b3")!
        
        CryptoService().takeCurrencies(url: url) { (Cryptos) in
            if let Cryptos = Cryptos {
            
                self.cryptoListViewModel = CryptoListViewModel.init(CryptoCurrencyList: Cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CrytoTableViewCell
        
        let cryptoViewModel = cryptoListViewModel.cryptoAtIndex(indexPath.row)
        
        cell.nameCrypto.text = cryptoViewModel.name
        cell.nameCrypto.textColor = .systemRed
        cell.priceCrypto.text = cryptoViewModel.price
        cell.priceCrypto.textColor = .systemGreen
        
        return cell
    }
    
    
}

