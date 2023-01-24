//
//  AddNoteViewModel.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 24.01.2023.
//

import Foundation
import UIKit

class AddNoteViewModel: AddNoteModelProtocol {
    
    var onErrorDetected: ( (String?) -> () )?
    var refreshItem: ( ([MainCellModel]) -> () )?
    
    private let model = AddNoteModel()
    
    init() {
        model.delegate = self
    }
    
    func didViewLoad() {
        model.retrieveNoteFromCoreData()
    }
    
    
}

extension AddNoteViewModel {
    func didNoteDataFetch() {
        let cellModels: [MainCellModel] = model.databaseData.map{_ in 
            .init(id: <#T##Int#>, name: <#T##String#>, released: <#T##String#>, backgroundImage: <#T##String#>, rating: <#T##Double#>)
        }
    }
    
    func didNoteDataCouldntFetch() {
        <#code#>
    }
}
