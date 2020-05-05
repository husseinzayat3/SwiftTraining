//
//  DbHelper.swift
//  IosTutorial
//
//  Created by Developer Iakta on 04/05/2020.
//  Copyright © 2020 Developer Iakta. All rights reserved.
//

import Foundation
import SQLite3

class DbHelper{
    init() {
        db = openDatabase()
        createTable()
    }
    
    let dbPath: String = "myDb.sqlite"
    var db:OpaquePointer?

    func openDatabase() -> OpaquePointer?
    {
        let fileURL = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(dbPath)
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK
        {
            print("error opening database")
            return nil
        }
        else
        {
            print("Successfully opened connection to database at \(dbPath)")
            return db
        }
    }
    
    func createTable(){
        let createQuery = "CREATE TABLE IF NOT EXISTS contact(Id INTEGER PRIMARY KEY,name TEXT,surname TEXT, number TEXT);"
        var createStatmenet: OpaquePointer? = nil
        if sqlite3_prepare(db, createQuery, -1, &createStatmenet, nil) == SQLITE_OK
        {
            if sqlite3_step(createStatmenet) == SQLITE_DONE
            {
                print("table created")
            } else
            {
                print("Error creating table")
            }
        } else {
            print("Error preparing table")
        }
        sqlite3_finalize(createStatmenet)
    }
    
    func insert(id: Int,name:String, surname: String, number: String) {
        let insertQuery = "INSERT INTO contact (Id, name, surname, number) VALUES (?,?,?,?);"
        var insertStatment : OpaquePointer? = nil
        let prep = sqlite3_prepare(db, insertQuery, -1, &insertStatment, nil)
        if  prep == SQLITE_OK{
            sqlite3_bind_int(insertStatment, 1, Int32(id)) // ID
            sqlite3_bind_text(insertStatment, 2, (name as NSString).utf8String , -1, nil) // Name
            sqlite3_bind_text(insertStatment, 3, (surname as NSString).utf8String , -1, nil) // Surname
            sqlite3_bind_text(insertStatment, 4, (number as NSString).utf8String , -1, nil) // number
            
            if sqlite3_step(insertStatment) == SQLITE_DONE {
                print("CONTACT ADDED!!")
            } else {
                print("Could not insert contact")
            }
            
        }else{
//            print(sqlite3_prepare_v3(db, insertQuery, -1,1, &insertStatment, nil))
            print("ERROR PREPARING INSERT ROW")
        }
        sqlite3_finalize(insertStatment)
    }
    
    func read() -> [Contact] {
        let selectQuery = "SELECT * FROM contact;"
        var selectStatment: OpaquePointer? = nil
        var contactsLst : [Contact] = []
        if sqlite3_prepare_v2(db, selectQuery, -1, &selectStatment, nil) == SQLITE_OK {
            while sqlite3_step(selectStatment) == SQLITE_ROW {
                let id = sqlite3_column_int(selectStatment, 0) 
                let name = String(describing: String(cString: sqlite3_column_text(selectStatment, 1)))
                let surname = String(describing: String(cString: sqlite3_column_text(selectStatment, 2)))
                let number = String(describing: String(cString: sqlite3_column_text(selectStatment, 3)))
                contactsLst.append(Contact(id: Int(id), name: name, surname: surname, number: number))
                print("Query Result:")
                print("\(id) | \(name) | \(surname) | \(number)")
            }
        } else {
            print("SELECT statement could not be prepared")
        }
        sqlite3_finalize(selectStatment)
        return contactsLst
    }
    
    
}
