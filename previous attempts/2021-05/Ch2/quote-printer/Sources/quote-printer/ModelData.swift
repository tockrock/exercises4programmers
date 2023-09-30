//
//  ModelData.swift
//  
//
//  Created by 鈴木剛 on 2021/06/02.
//

import Foundation

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
//    guard let file_path = Bundle.module.path(forResource: filename, ofType: nil)
//    else {
//        fatalError("Couldn't find \(filename) in main bundle.")
//    }
//    print(file_path)
    
    guard let file = Bundle.module.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
