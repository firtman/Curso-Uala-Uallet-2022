//
//  API.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/29/22.
//

import Foundation

// (Bool) -> Void
typealias CallbackLogin = (Bool)->Void

enum APIError: Error {
   case UserIncomplete, PasswordIncomplete, ServerError
}

class API {
    // closure: función tratada como variable, expresión lambda, función anónima, función literal
  
    static func login(_ usuario: String,
                      _ password: String,
                      onFinished callback: (Bool)->Void) throws {
        
        // abro una base de datos (caso imaginario)
        // database.open()
        defer {
            // cierro la base de datos cuando la función termine
            // database.close()
        }
        
        guard usuario.count >= 4 else {
            throw APIError.UserIncomplete
        }
        
        guard password.count >= 4 else {
            throw APIError.PasswordIncomplete
        }

        
        // asincrónico
        if usuario=="admin" && password=="12345" {
            callback(true)
        } else {
            callback(false)
        }
        
       
    }
    
    
    func register(user: String?, password: String?) throws {
        if let user = user {
            if user.count > 3 {
                
            }
        }
        
        if user != nil {
            if user!.count > 3 {
                
            }
        }
    }
    
    
}


