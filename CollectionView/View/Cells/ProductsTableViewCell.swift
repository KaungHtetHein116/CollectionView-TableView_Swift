//
//  ProductsTableViewCell.swift
//  CollectionView
//
//  Created by Kaung Htet Hein on 10/22/21.
//

import UIKit

typealias SeeAllClosure = ((_ index: Int?) -> Void)
typealias DidSelectClosure = ((_ tableIndex: Int?, _ collectionIndex: Int?) -> Void)

class ProductsTableViewCell: UITableViewCell {
    
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var categoryName: UILabel!
    
    var index: Int?
    var onClickSeeAllClosure: SeeAllClosure?
    var onSelectCollection: DidSelectClosure?
    
    var products: Product? {
        didSet {
            categoryName.text = products?.category
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func onTapViewAll(_ sender: Any) {
        onClickSeeAllClosure?(index)
    }

}

extension ProductsTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        products?.products.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCollectionViewCell", for: indexPath) as? ProductCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.productLabel.text = products?.products[indexPath.row].name
        cell.productImage.image = UIImage(named: products?.products[indexPath.row].image ?? "")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        print("collection -> \(indexPath.row) & table -> \(index)")
        onSelectCollection?(index, indexPath.row)
    }
    
}
