//
//  MainModelView.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 21.01.2023.
//

import Foundation

class MainViewModel {
    private let model = MainModel()
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.fetchData()
    }
    
    func cellPressed(_ index: Int) {
        // When you pressed it, what is gonna happen
    }
}

extension MainViewModel: MainModelProtocol {
    func didDataFetch() {
        
    }
    func didDataCouldntFetch() {
        
    }
    func didCacheDataFetch() {
        
    }
}
