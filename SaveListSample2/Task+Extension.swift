//
//  Task+Extension.swift
//  SaveListSample2
//
//  Created by Fauzan Ramadhan on 15/05/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation
import CoreData

extension Task {
    static func saveTask(context: NSManagedObjectContext, taskName: String) -> Task? { //static adalah pasti ada meskipun belum di initiater
        //bikin entitas
        let task = Task(context: context) //init di class task
        task.taskName = taskName //masukin salah satu data property-nya
        
        //execute
        do {
            try context.save()
            return task
        } catch {
            return nil
        }
    }
    
    
    static func fetchAll(context:NSManagedObjectContext) -> [Task] {
        //bikin request
        let request:NSFetchRequest<Task> = Task.fetchRequest()
        //pake generic, karena ambigu, fetch request bisa banyak jenis yg bisa diambilnya
        //request untuk dapet array of <Task>
        
        //                let predicate = NSPredicate (format: "taskName BEGINSWITH 'm'")
        //                request.predicate = predicate
        //                https://academy.realm.io/posts/nspredicate-cheatsheet/
        
        //eksekusi
        do {
            return try context.fetch(request)
            //si context.fetch(request) itu ngereturn array of Task, karena udah di setting generic
        } catch {
            return []
        }
    }
    
    static func deleteAll(context:NSManagedObjectContext) {
        let request:NSFetchRequest<NSFetchRequestResult> = Task.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)
        try? context.execute(deleteRequest)
    }
    
//    static func delete(context:NSManagedObjectContext) -> {
//        
//    }
    
    
}
