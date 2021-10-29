//
//  ProductDetailTableViewCell.swift
//  CollectionView
//
//  Created by Kaung Htet Hein on 10/22/21.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {

    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var productDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
