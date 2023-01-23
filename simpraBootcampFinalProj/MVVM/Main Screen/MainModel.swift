//
//  MainModel.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 21.01.2023.
//

import Foundation
import Alamofire
import CoreData
import UIKit


class MainModel {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let apiKey: String = "ddb4403e135a40c0bd385887074b55fa"
    
    private(set) var data: [Result] = []
    private(set) var databaseData: [Entity] = []
    
    weak var delegate: MainModelProtocol?
    
    func fetchData() {
        
        if InternetManager.shared.isInternetActive() {
            AF.request("https://api.rawg.io/api/games?key=\(apiKey)&page=5").responseDecodable(of: Games.self ) { (res) in
                
                guard let response = res.value else {
                    self.delegate?.didDataCouldntFetch()
                    print("There is no data")
                    return
                }
                self.data = response.results ?? []
                self.delegate?.didDataFetch()
                print("data geldi")
                
                for eachItem in self.data {
                    self.saveToCoreData(eachItem)
                }
            }
        } else {
            retrieveFromCoreData()
            print("coredatadan çektim")
        }
        
        
        
    }
    
    private func saveToCoreData(_ data: Result) {
      let context = appDelegate.persistentContainer.viewContext
      if let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context) {
        let listObject = NSManagedObject(entity: entity, insertInto: context)
            listObject.setValue(data.name ?? "", forKey: "name")
            listObject.setValue(data.backgroundImage ?? "", forKey: "backgroundImage")
            listObject.setValue(data.rating ?? 0, forKey: "rating")
            listObject.setValue(data.released ?? "", forKey: "released")
            listObject.setValue(data.id, forKey: "id")
        
        do {
          try context.save()
            print("CoreDataya Kaydettim")
        } catch {
          print("ERROR while saving data to CoreData")
        }
      }
    }
    
    public func retrieveFromCoreData() {
      let context = appDelegate.persistentContainer.viewContext
      
      let request = NSFetchRequest<Entity>(entityName: "Entity")
      
      do {
        let result = try context.fetch(request)
        print("\(result.count)")
        self.databaseData = result
        delegate?.didCacheDataFetch()
          print("data çekildi")
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
