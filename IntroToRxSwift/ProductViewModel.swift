//
//  ProductViewModel.swift
//  IntroToRxSwift
//
//  Created by Matthew Dolan on 2021-11-14.
//

import Foundation
import RxSwift

struct ProductViewModel {
    var items = PublishSubject<[Product]>()
    
    func fetchItems() {
        let products = [
            Product(imageName: "house", title: "Home"),
            Product(imageName: "gear", title: "Settings"),
            Product(imageName: "person.circle", title: "Profile"),
            Product(imageName: "airplane", title: "Flights"),
            Product(imageName: "bell", title: "Activity")
        ]
        
        items.onNext(products)
        items.onCompleted()
    }
}
