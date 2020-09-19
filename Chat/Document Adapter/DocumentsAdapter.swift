//
//  DocumentsAdapter.swift
//  Bid2Win
//
//  Created by santhoshkumar nampally on 13/12/19.
//  Copyright © 2019 santhoshkumar nampally. All rights reserved.
//

import Foundation

enum DocumentPath: String {
    case translation = "translation"
}

class DocumentsAdapter {
    static func saveToFile(_ data:Data, path: String) {
        do {
            var documentPath = getDirectoryPath()
            documentPath.append("/" + path)
            createFolderForPath(path: documentPath)
            try data.write(to: URL.init(fileURLWithPath: documentPath))
        }
        catch let error {
            print(error)
        }
    }
    
    static func createFolderForPath(path: String) {
        var folderPath = getDirectoryPath()
        var components = path.components(separatedBy: "\(folderPath)/")
        components = components.last?.components(separatedBy: "/") ?? []
        
        _ = components.popLast()
        
        for each in components {
            folderPath = folderPath + "/\(each)"
            if !(FileManager().fileExists(atPath: folderPath)) {
                try? FileManager().createDirectory(atPath: folderPath, withIntermediateDirectories: true, attributes: nil)
            }
        }
    }
    
    static func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    static func getFileUrlFor(path: String) -> URL? {
        var documentPath = getDirectoryPath()
        documentPath.append("/" + path)
        
        if (FileManager().fileExists(atPath: documentPath)) {
            return URL.init(fileURLWithPath: documentPath)
        }
        
        return nil
    }
    
    static func getData(path : String) -> Data?{
        
        return UserDefaults.standard.value(forKey: path) as? Data
    }
}
