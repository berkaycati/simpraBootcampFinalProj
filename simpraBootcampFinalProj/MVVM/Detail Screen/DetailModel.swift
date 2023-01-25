//
//  DetailModel.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 22.01.2023.
//

import Foundation
import UIKit
import CoreData

class DetailModel {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    
    private(set) var data: [Result] = []
    private(set) var databaseData: [Entity] = []
    
//    var commentArray: String = []
//    var idArray: Int
    
    weak var delegate: DetailModelProtocol?
    
    func getDataFromCoreData() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Entity")
//        request.returnsObjectsAsFaults = false
//
//        do {
//            let results = try context.fetch(request)
//            if results.count > 0 {
//                for result in results as! [NSManagedObject] {
//                    if let comment = result.value(forKey: "note") as? String {
//                        self.commentArray.append(comment)
//                    }
//                    if let id = result.value(forKey: "id") as? Int {
//                        self.idArray = id
//                    }
//                }
//            }
//            self.databaseData = results
//            delegate!.didCoreDataFetch()
//        } catch {
//            print("Error while fetching data from CoreData")
//        }
//
    }
    
}

protocol DetailModelProtocol: AnyObject {
  
  func didCoreDataFetch()
  func didCoreDataCouldntFetch()
}
