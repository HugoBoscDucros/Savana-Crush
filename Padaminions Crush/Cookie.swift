//
//  Cookie.swift
//  Savan Crush
//
//  Created by Bosc-Ducros Hugo on 01/02/2016.
//  Copyright © 2016 Bosc-Ducros Hugo. All rights reserved.
//

import SpriteKit

enum CookieType: Int, CustomStringConvertible {
    case Unknown = 0, Croissant, Cupcake, Danish, Donut, Macaroon, SugarCookie
    
    var spriteName: String {
        let spriteNames = [
            "Charline",
            "Hugo",
            "Leo",
            "Mikha",
            "Rafik",
            "Sandra"]
        
        return spriteNames[rawValue - 1]
    }
    
    var highlightedSpriteName: String {
        return spriteName //+ "-Highlighted"
    }
    
    static func random() -> CookieType {
        return CookieType(rawValue: Int(arc4random_uniform(6)) + 1)!
    }
    
    var description: String {
        return spriteName
    }
}

func ==(lhs:Cookie, rhs:Cookie) -> Bool {
    return lhs.column == rhs.column && lhs.row == rhs.row
}


class Cookie: CustomStringConvertible, Hashable {
    var column: Int
    var row: Int
    let cookieType: CookieType
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int, cookieType: CookieType) {
        self.column = column
        self.row = row
        self.cookieType = cookieType
    }
    
    var description: String {
        return "type:\(cookieType) square:(\(column),\(row))"
    }
    
    var hashValue: Int {
        return row*10 + column
    }
    
    
}