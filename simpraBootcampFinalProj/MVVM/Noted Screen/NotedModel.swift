//
//  NotedModel.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 22.01.2023.
//

import Foundation
import CoreData
import UIKit


class NotedModel {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private(set) var data: [Result] = []
    private(set) var databaseData: [Entity] = []
    
    weak var delegate: (NotedModelProtocol)?
    
    public func retrieveFromCoreData() {
      let context = appDelegate.persistentContainer.viewContext
      
      let request = NSFetchRequest<Entity>(entityName: "Entity")
      
      do {
        let result = try context.fetch(request)
        print("\(result.count)")
        self.databaseData = result
        delegate?.didCacheDataFetch()
          print("datadan çektim")
      } catch {
        print("ERROR while fetching data from CoreData")
        delegate?.didDataCouldntFetch()
      }
    }
}

protocol NotedModelProtocol: AnyObject {
    func didCacheDataFetch()
    func didDataCouldntFetch()
}
