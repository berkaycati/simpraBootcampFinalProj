//
//  NotedViewModel.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 22.01.2023.
//

import Foundation


class NotedViewModel: NotedModelProtocol, MainModelProtocol {
    
    
    
    
    private let model = MainModel()
    
    var onErrorDetected: ((String?)->())?
    var refreshItem: (([MainCellModel])->())?
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.retrieveFromCoreData()
    }
}

extension NotedViewModel {
    func didCacheDataFetch() {
        let cellModels : [MainCellModel] = model.databaseData.map{
            .init(
                id: Int($0.id) ?? 0,
                name: $0.name ?? "",
                released: $0.released ?? "",
                backgroundImage: $0.backgroundImage ?? "",
                rating: $0.rating ?? 0)
        }
        refreshItem?(cellModels)
    }
    
    func didDataCouldntFetch() {
        onErrorDetected?("Data Couldnt be fetched from CoreData")
    }
    
    func didDataFetch() {
        print("DataFetched we are in NotedViewModel")
    }
}
