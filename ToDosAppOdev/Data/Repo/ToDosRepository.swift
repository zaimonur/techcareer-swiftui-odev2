//
//  ToDosRepository.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import Foundation

class ToDosRepository {
    
    // MARK: - Tanımlamalar
    let db:FMDatabase?
    
    // MARK: - Veri Tabanı Yolu
    init () {
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent("todosappodev.sqlite")
        db = FMDatabase(path: hedefYol.path)
    }

    // MARK: - CREATE - C
    func save(name:String) async throws {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO todos (name) VALUES (?)", values: [name])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    // MARK: - READ - R
    func loadToDos() async throws -> [ToDos]{
        var list = [ToDos]()
        db?.open()
        do {
            let result = try db!.executeQuery( "SELECT * FROM todos", values: nil )
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
                let toDo = ToDos(id: id, name: name)
                list.append(toDo)
            }
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
        return list
    }
    
    // MARK: - UPDATE - U
    func update(id:Int,name:String) async throws {
        db?.open()
        do {
            try db!.executeUpdate( "UPDATE todos SET name = ? WHERE id = ?", values: [name,String(id)])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }

    // MARK: - DELETE - D
    func delete(id:Int) async throws {
        db?.open()
        do {
            try db!.executeUpdate( "DELETE FROM todos WHERE id = ?", values: [String(id)])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }

    // MARK: - SEARCH
    func search(searchText:String) async throws -> [ToDos]{
        var list = [ToDos]()
        db?.open()
        do {
            let result = try db!.executeQuery( "SELECT * FROM todos WHERE name LIKE '%\(searchText)%'", values: nil)
            
            while result.next() {
                let id = Int(result.string(forColumn: "id"))!
                let name = result.string(forColumn: "name")!
                let toDo = ToDos(id: id, name: name)
                list.append(toDo)
            }
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
        return list
    }
}
