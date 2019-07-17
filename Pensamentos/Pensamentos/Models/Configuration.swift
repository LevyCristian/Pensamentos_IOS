//
//  Configuration.swift
//  Pensamentos
//
//  Created by Anderson Alencar on 03/07/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import Foundation


enum UserDefaultsKeys: String {
    
    case timeInterval = "timeInterval"
    case colorScheme = "colorScheme"
    case autoRefresh = "autoRefresh"
}




class Configuration { 
    
    let defaults = UserDefaults.standard // retorna o acesso ao UserDefaults do app
    
    static var shared: Configuration = Configuration()
    
    var timeInterval: Double {
        
        get{
            return defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
    }
    
    var colorScheme: Int {
        
        get{
            return defaults.integer(forKey: UserDefaultsKeys.colorScheme.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.colorScheme.rawValue)
        }
    }
    
    var autoRefresh: Bool {
        
        get{
            return defaults.bool(forKey: UserDefaultsKeys.autoRefresh.rawValue)
        }
        set{
            defaults.set(newValue, forKey: UserDefaultsKeys.autoRefresh.rawValue)
        }
    }
    
    var timeIntervalDescription: String {
        return "Mudar após \(Int(self.timeInterval)) segundos" // poderia utilizar o método round() no lugar de Int()
    }
    
    
    private init() {
        
        if defaults.double(forKey: UserDefaultsKeys.timeInterval.rawValue) == 0 {
            defaults.set(8.0, forKey: UserDefaultsKeys.timeInterval.rawValue)
        }
        //self.autoRefresh = false // por padrao mesmo sem essa configuraçao ele já se instancia como false
        //self.colorScheme = 0 // por padrão mesmo sem configurar ele já se instancia como 0
        
    }
    
    
    
    
    
    
}
