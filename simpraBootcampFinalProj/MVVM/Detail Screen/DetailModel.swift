//
//  DetailModel.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 22.01.2023.
//

import Foundation
import UIKit
import CoreData

//class DetailModel {
//    
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    private(set) var databaseData: [Entity] = []
//    weak var delegate: DetailModelProtocol
//    
//    
//    
//    func getDataFromCoreData() {
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//        let context = appDelegate.persistentContainer.viewContext
//        let request = NSFetchRequest<Entity>(entityName: "Entity")
//        request.returnsObjectsAsFaults = false
//        
//        do {
//            let results = try context.fetch(request)
//            self.databaseData = results
//            delegate.didCoreDataFetch()
//        } catch {
//            print("Error while fetching data from CoreData")
//        }
//        
//    }
//    
//}
//
//protocol DetailModelProtocol: AnyObject {
//  
//  func didCoreDataFetch()
//  func didCoreDataCouldntFetch()
//}
