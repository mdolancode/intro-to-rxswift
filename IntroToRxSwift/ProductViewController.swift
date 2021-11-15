//
//  ViewController.swift
//  IntroToRxSwift
//
//  Created by Matthew Dolan on 2021-11-14.
//

import UIKit
import RxSwift
import RxCocoa

class ProductViewController: UIViewController {
    
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()
    
    private var viewModel = ProductViewModel()
    private var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableView()
    }
    
    func bindTableView() {
        // Bind items to table
        viewModel.items.bind(to: tableView.rx.items(
            cellIdentifier: "cell",
            cellType: UITableViewCell.self)
        ) { row, model, cell in
            cell.textLabel?.text = model.title
            cell.imageView?.image = UIImage(systemName: model.imageName)
        }.disposed(by: disposeBag)
        
        // Bind a model selected handler
        tableView.rx.modelSelected(Product.self).bind { product in
            print(product.title)
        }.disposed(by: disposeBag)
        
        // Fetch items
        viewModel.fetchItems()
    }
}

