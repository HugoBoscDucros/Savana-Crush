//
//  Chain.swift
//  Savan Crush
//
//  Created by Bosc-Ducros Hugo on 01/02/2016.
//  Copyright © 2016 Bosc-Ducros Hugo. All rights reserved.
//

import Foundation

class Chain: Hashable, CustomStringConvertible {
    
    var score = 0
    
    var cookies = [Cookie]()
    
    enum ChainType: CustomStringConvertible {
        case Horizontal
        case Vertical
        
        var description: String {
            switch self {
            case .Horizontal: return "Horizontal"
            case .Vertical: return "Vertical"
            }
        }
    }
    
    var chainType: ChainType
    
    init(chainType: ChainType) {
        self.chainType = chainType
    }
    
    func addCookie(cookie: Cookie) {
        cookies.append(cookie)
    }
    
    func firstCookie() -> Cookie {
        return cookies[0]
    }
    
    func lastCookie() -> Cookie {
        return cookies[cookies.count - 1]
    }
    
    var length: Int {
        return cookies.count
    }
    
    var description: String {
        return "type:\(chainType) cookies:\(cookies)"
    }
    
    var hashValue: Int {
        return cookies.reduce(0){ $0.hashValue ^ $1.hashValue }
        //return reduce(cookies, 0) { $0.hashValue ^ $1.hashValue }
    }
}

func ==(lhs: Chain, rhs: Chain) -> Bool {
    return lhs.cookies == rhs.cookies
}