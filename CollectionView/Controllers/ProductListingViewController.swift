//
//  ProductListingViewController.swift
//  CollectionView
//
//  Created by Kaung Htet Hein on 10/22/21.
//

import UIKit

class ProductListingViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var productListing: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = productListing?.category
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let cell = sender as? UITableViewCell,
               let indexPath = tableView.indexPath(for: cell),
               let productDetailVC = segue.destination as? ProductDetailViewController {
                productDetailVC.productDetail = productListing?.products[indexPath.row]
        }
    }
}

extension ProductListingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productListing?.products.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductDetailTableViewCell") as? ProductDetailTableViewCell else {
            return UITableViewCell()
        }
        
        cell.productName.text = productListing?.products[indexPath.row].name
        cell.productPrice.text = productListing?.products[indexPath.row].price
        cell.productDescription.text = productListing?.products[indexPath.row].description
        cell.productImage.image = UIImage(named: (productListing?.products[indexPath.row].image)!)
        
        return cell
    }
}
