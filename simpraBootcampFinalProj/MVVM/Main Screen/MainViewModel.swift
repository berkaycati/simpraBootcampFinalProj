//
//  MainModelView.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 21.01.2023.
//

import Foundation
import UIKit

class MainViewModel {
    private let model = MainModel()
    private var vc: MainViewController?
    private let navigationController = UINavigationController()
    
    var onErrorDetected: ( (String?) -> () )?
    var refreshItem: ( ([MainCellModel]) -> () )?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
//    func cellPressed(_ index: Int) {
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        if let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
//            print("içerdeyim")
//            navigationController.pushViewController(vc, animated: true)
//            
//        }
//        
//    }
}

extension MainViewModel: MainModelProtocol {
    func didDataFetch() {
        let cellModels: [MainCellModel] = model.data.map{
            .init(
                id: $0.id ?? 0,
                name: $0.name ?? "",
                released: $0.released ?? "",
                backgroundImage: $0.backgroundImage ?? "",
                rating: $0.rating ?? 0)
            
        }
        refreshItem?(cellModels)
    }
    func didDataCouldntFetch() {
        onErrorDetected?("Please Try It Again Later")
    }
    func didCacheDataFetch() {
        let cellModels: [MainCellModel] = model.databaseData.map{
            .init(
                id: Int($0.id) ?? 0,
                name: $0.name ?? "",
                released: $0.released ?? "",
                backgroundImage: $0.backgroundImage ?? "",
                rating: $0.rating ?? 0)
            
        }
        refreshItem?(cellModels)
    }
}
