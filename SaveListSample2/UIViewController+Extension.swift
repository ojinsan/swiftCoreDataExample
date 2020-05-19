//
//  UIViewController+Extension.swift
//  SaveListSample2
//
//  Created by Fauzan Ramadhan on 15/05/20.
//  Copyright © 2020 Jazilul Athoya. All rights reserved.
//

import Foundation
import UIKit
import CoreData

//agar UIViewController bisa akses extensionnya Task. Context itu jembatan
extension UIViewController {
    func getViewContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate //di casting karena yakin yang dipilih App delegate
        let context = appDelegate.persistentContainer.viewContext
        return context //buat eksekusi coredata ntar
    }
}


