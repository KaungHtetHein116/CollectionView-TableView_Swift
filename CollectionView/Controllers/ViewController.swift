//
//  ViewController.swift
//  CollectionView
//
//  Created by Kaung Htet Hein on 10/22/21.
//

import UIKit

class ViewController: UIViewController {
    
    var productData: ProductModel?
    
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        loadJson()
    }
    
    func loadJson(){
        if let path = Bundle.main.path(forResource: "MyData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                let jsonData = try JSONSerialization.data(withJSONObject: jsonResult, options: .prettyPrinted)
                let jsonDecoder = JSONDecoder()
                
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                productData = try jsonDecoder.decode(ProductModel.self, from: jsonData)
                
            } catch {
                print("error decoding json \(error)")
            }
        }
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productData?.response.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell") as? ProductsTableViewCell else {
            return UITableViewCell()
        }
        
        cell.index = indexPath.row
        
        cell.onClickSeeAllClosure = { index in
            guard let vc = self.storyboard?.instantiateViewController(identifier: "ProductListingViewController") as? ProductListingViewController else {
                return
            }
            vc.productListing = self.productData?.response[index!]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.onSelectCollection = { tableIndex, collectionIndex in
            guard let vc = self.storyboard?.instantiateViewController(identifier: "ProductDetailViewController") as? ProductDetailViewController else {
                return
            }
            vc.productDetail = self.productData?.response[tableIndex!].products[collectionIndex!]
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        cell.products = (productData?.response[indexPath.row])!
        return cell
    }
}
