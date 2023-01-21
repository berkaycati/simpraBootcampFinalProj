//
//  MainModel.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 21.01.2023.
//

import Foundation
import Alamofire
import CoreData
import CoreData
import UIKit


class MainModel {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let apiKey: String = "ddb4403e135a40c0bd385887074b55fa"
    private(set) var data: [Result] = []
    private(set) var databaseData: [ListEntity] = []
    weak var delegate: MainModelProtocol?
    
    func fetchData() {
        
        AF.request("https://api.rawg.io/api/games?key=\(apiKey)&page=7").responseDecodable(of: GameApiData.self ) { game in
            guard let response = game.value else {
                self.delegate?.didDataCouldntFetch()
                print("There is no data")
                return
            }
            self.data = response.mainResults ?? []
            self.delegate?.didDataFetch()
        }
        
    }
    
    private func saveToCoreData(_ data: Result) {
      let context = appDelegate.persistentContainer.viewContext
      if let entity = NSEntityDescription.entity(forEntityName: "ListEntity", in: context) {
        let listObject = NSManagedObject(entity: entity, insertInto: context)
        listObject.setValue(data.name ?? "", forKey: "name")
        
        do {
          try context.save()
        } catch {
          print("ERROR while saving data to CoreData")
        }
      }
    }
    
    private func retrieveFromCoreData() {
      let context = appDelegate.persistentContainer.viewContext
      
      let request = NSFetchRequest<ListEntity>(entityName: "ListEntity")
      
      do {
        let result = try context.fetch(request)
        print("\(result.count)")
        self.databaseData = result
        delegate?.didCacheDataFetch()
      } catch {
        print("ERROR while fetching data from CoreData")
        delegate?.didDataCouldntFetch()
      }
    }
    
}



protocol MainModelProtocol: AnyObject {
    func didDataFetch()
    func didDataCouldntFetch()
    func didCacheDataFetch()
}
