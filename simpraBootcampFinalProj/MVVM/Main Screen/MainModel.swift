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
    var pageNumber: Int = 6
    
    private(set) var data: [Result] = []
    private(set) var databaseData: [Entity] = []
    
    private var nextPageURL: URL?
    private var previousPageURL: URL?
    
    weak var delegate: MainModelProtocol?
    
    let refreshController = UIRefreshControl()
    
    func fetchData(refresh: Bool = false, url: URL? = nil) {
        
        // controlling internet
        
        if InternetManager.shared.isInternetActive() {
            
            // fetchin data with Alamofire
            AF.request("https://api.rawg.io/api/games?key=\(apiKey)&page=\(String(pageNumber))").responseDecodable(of: Games.self ) { (res) in
                
                guard let response = res.value else {
                    self.delegate?.didDataCouldntFetch()
                    print("There is no data")
                    return
                }
                self.refreshController.endRefreshing()
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
        
        // saving data to CoreData named "Entity"
        
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<Entity>(entityName: "Entity")
        request.predicate = NSPredicate(format: "id = %d", data.id!)
        do {
            let result = try context.fetch(request)
            if result.count == 0 {
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
            } else {
                print("Duplicate data, not saved to CoreData")
            }
        } catch {
            print("Error while fetching data for duplicate check")
        }
    }
    
    
    public func retrieveFromCoreData() {
        
        // retrieving datas from CoreData named "Entity"
        
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
    
    func fetchNextPage() {
        pageNumber += 1
    }

    func fetchPreviousPage() {
        if pageNumber != 1 {
            pageNumber -= 1
        }
    }
    
}

protocol MainModelProtocol: AnyObject {
    func didDataFetch()
    func didDataCouldntFetch()
    func didCacheDataFetch()
}
