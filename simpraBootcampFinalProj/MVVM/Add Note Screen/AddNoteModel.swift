//
//  AddNoteModel.swift
//  simpraBootcampFinalProj
//
//  Created by Berkay on 24.01.2023.
//

import Foundation
import CoreData
import UIKit


class AddNoteModel {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    private(set) var databaseData: [Entity] = []
    
    weak var delegate: AddNoteModelProtocol?
    
     func saveNoteToCoreData(_ id: Int?, _ note: String?) {
        let context = appDelegate.persistentContainer.viewContext
        if let entity = NSEntityDescription.entity(forEntityName: "Entity", in: context) {
            let noteObject = NSManagedObject(entity: entity, insertInto: context)
            noteObject.setValue(id, forKey: "id")
            noteObject.setValue(note, forKey: "note")
            do {
                try context.save()
                print("Not kaydedildi.")
            } catch {
                print("Error while saving note to CoreData")
            }
        }
    }
    
    public func retrieveNoteFromCoreData() {
        let context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<Entity>(entityName: "Entity")
        
        do {
            let result = try context.fetch(request)
            print("\(result.count)")
            self.databaseData = result
            delegate?.didNoteDataFetch()
            print("data çekildi")
        } catch {
            print("ERROR while fetching data from CoreData")
            delegate?.didNoteDataCouldntFetch()
        }
    }

}

protocol AddNoteModelProtocol: AnyObject {
    func didNoteDataFetch()
    func didNoteDataCouldntFetch()
}
