//
//  DatabaseHelper.swift
//  ToDosAppOdev
//
//  Created by Onur Zaim on 14.09.2025.
//

import Foundation

// MARK: - CLASSES
class DatabaseHelper {
    static func copyDatabase() {
        let bundle = Bundle.main.path(forResource: Constant.databaseAdi, ofType: Constant.databaseDosyaTuru)
        
        let veritabaniYolu = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let hedefYol = URL(fileURLWithPath: veritabaniYolu).appendingPathComponent(Constant.databaseAdi + Constant.databaseDosyaTuru)
        
        let fm = FileManager.default
        
        if fm.fileExists(atPath: hedefYol.path) {
            print(Constant.uyari)
        }else{
            do{
                try fm.copyItem(atPath: bundle!, toPath: hedefYol.path)
            }catch{
                print(error.localizedDescription)
            }
        }
        
    }
}

// MARK: - Constant
extension DatabaseHelper {
    enum Constant {
        static let databaseDosyaTuru = ".sqlite"
        static let databaseAdi = "todosappodev"
        static let uyari = "Veritabanı daha önce kopyalanmış."
    }
}
