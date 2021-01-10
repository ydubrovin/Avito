//
//  ParsingJSON.swift
//  Avito
//
//  Created by Юрий Дубровин on 30.12.2020.
//

import Foundation

struct Stat:Codable{
    struct Result:Codable{
        struct List:Codable{
            let id:String
            let title:String
            let description:String?
            let icon:[String:String]
            let price:String
            let isSelected: Bool
        }
        let title:String
        let actionTitle:String
        let selectedActionTitle:String
        let list:[List]
    }
    let status:String
    let result:Result
}
