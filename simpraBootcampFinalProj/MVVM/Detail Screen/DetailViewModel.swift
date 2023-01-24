//
//  DetailViewModel.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 22.01.2023.
//

import Foundation
import UIKit

class DetailViewModel {
    
    private let model = DetailModel()
    
    var onErrorDetected: ( (String?) -> () )?
    var refreshItem: ( ([MainCellModel]) -> () )?
    
    init() {
        model.getDataFromCoreData()
    }
}

extension DetailViewModel: DetailModelProtocol {
    func didCoreDataFetch() {
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
    func didCoreDataCouldntFetch() {
        onErrorDetected?("the data from coreData has couldnt fetched")
    }
    
}

extension DetailViewModel {
    
}
