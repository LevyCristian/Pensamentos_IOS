//
//  QuotesManager.swift
//  Pensamentos
//
//  Created by Anderson Alencar on 03/07/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import Foundation


class QuotesManager {
    
    let quotes: [Quote]
    
    init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")! // url(forResource: "quotes.json", withExtension: nil)!  também é possível executar dessa forma
        let jsonData = try! Data(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        self.quotes  = try! jsonDecoder.decode([Quote].self, from: jsonData)
    }
    
    func getRandomQuote() -> Quote {
        //let index = Int(arc4random_uniform(UInt32(self.quotes.count)))
        let index = Int.random(0...self.quotes.count)
        return self.quotes[index]
    }
    
    
    
    
    
}
