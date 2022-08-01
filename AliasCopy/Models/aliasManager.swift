//
//  aliasManager.swift
//  Alias
//
//  Created by Ilya Vasilev on 30.07.2022.
//

import Foundation

struct AliasManager : Codable {
     let words : [String]
     init() { words = [] }
 }

let aliasWords =  parseJSON(resourseName: "simpleJson")

let emodjyArray = [
"🤠", "🗿", "⛺️", "🐔", "😜", "😱", "🚀",
"🐳", "🍄", "🦠", "🐸", "👑", "😏", "🥳"
]

func parseJSON(resourseName: String) -> [String]?{ //парсинг файлов json
        guard let path = Bundle.main.path(forResource: resourseName, ofType: "json") else {return nil}
        let url = URL(fileURLWithPath: path)
        
        do {
            let data = try Data(contentsOf: url)
            let json = try JSONDecoder().decode(AliasManager.self, from: data)
            return json.words
           
        }
        catch{
            print(error)
            return nil
        }
        
    }
