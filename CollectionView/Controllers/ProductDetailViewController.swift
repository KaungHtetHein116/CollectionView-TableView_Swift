//
//  ProductDetailViewController.swift
//  CollectionView
//
//  Created by Kaung Htet Hein on 10/23/21.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var productName: UILabel!
    @IBOutlet var productPrice: UILabel!
    @IBOutlet var productDescription: UILabel!
    
    var productDetail: ProductDetail?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = productDetail?.name
        
        productImage.image = UIImage(named: productDetail?.image ?? "")
        productName.text = productDetail?.name
        productPrice.text = productDetail?.price
        productDescription.text = productDetail?.description
    }
}

