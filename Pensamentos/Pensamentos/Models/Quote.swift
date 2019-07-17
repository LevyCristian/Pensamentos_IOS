//
//  Quote.swift
//  Pensamentos
//
//  Created by Anderson Alencar on 03/07/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import Foundation


struct Quote: Codable  { // Encodable, Decodable
    
    var quote: String
    var author: String
    let image: String
    
    var quoteFormatted: String {
        
        return " ❛❛" + self.quote + "❜❜ "
    }
    
    var authorFormatted: String {
        return " ‑" + self.author + " ‑ "
    }
    
    
    
}
