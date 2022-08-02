//
//  CrytoTableViewCell.swift
//  Crypto
//
//  Created by Doğan seçilmiş on 5.07.2022.
//

import UIKit

class CrytoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameCrypto: UILabel!
    @IBOutlet weak var priceCrypto: UILabel!
    
   
        override func awakeFromNib() {
            super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
