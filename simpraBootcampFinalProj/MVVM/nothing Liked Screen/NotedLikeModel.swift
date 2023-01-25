//
//  NotedLikeModel.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 24.01.2023.
//

import Foundation
import CoreData
import UIKit

class NotedLikeModel {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private(set) var data: [Result] = []
    private(set) var databaseData: [Favorites] = []
    
    weak var delegate: (NotedLikeModelProtocol)?
    
    public func retrieveFromCoreData() {
      let context = appDelegate.persistentContainer.viewContext
      
      let request = NSFetchRequest<Favorites>(entityName: "Favorites")
      
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

protocol NotedLikeModelProtocol: AnyObject {
    func didCacheDataFetch()
    func didDataCouldntFetch()
}
