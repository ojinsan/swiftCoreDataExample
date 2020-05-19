//
//  CoreDataHelper.swift
//  SaveListSample2
//
//  Created by Fauzan Ramadhan on 15/05/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation
import CoreData

struct CoreDataHelper {
    var context: NSManagedObjectContext
    
    func fetchAll<T: NSManagedObject>() -> [T] {
        //bikin request
        //let request:NSFetchRequest<T> = T.fetchRequest()
        let request = T.fetchRequest()
        //request untuk dapet array of <Task>
        
        //                let predicate = NSPredicate (format: "taskName BEGINSWITH 'm'")
        //                request.predicate = predicate
        //                https://academy.realm.io/posts/nspredicate-cheatsheet/
        
        //eksekusi
        do {
            return try context.fetch(request) as? [T] ?? []
            //si context.fetch(request) itu ngereturn array of Task, karena udah di setting generic
        } catch {
            return []
        }
    }
}
