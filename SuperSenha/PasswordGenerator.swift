//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Diogenes de Souza on 18/05/21.
//

import Foundation

class PasswordGenerator {
    
    var numberOfCaracters: Int
    var useUperLetters: Bool
    var useLowerLetter: Bool
    var useNumbers: Bool
    var useEspecialCaracters: Bool
    
    var passwords: [String] = []
    private let letters = "abcdefghijlmnopqrstuvxz"
    private let numbers = "0123456789"
    private let specialCaracters = "!@#$%ˆ&*()_+=-~`][{}|';:/.,<>?"
    
    init(numberOfCaracters: Int, useLowerLetters: Bool, useNumbers: Bool, useUperLetters: Bool, useEspecialCaracters: Bool) {
        
        var numChars = min(numberOfCaracters, 16)
        numChars = max(numChars, 1)
        
        self.numberOfCaracters = numChars
        self.useUperLetters = useUperLetters
        self.useLowerLetter = useLowerLetters
        self.useNumbers = useNumbers
        self.useEspecialCaracters = useEspecialCaracters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLowerLetter {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useUperLetters {
            universe += letters.uppercased()
        }
        
        if useEspecialCaracters {
            universe += specialCaracters
        }
        
        let universeArray = Array(universe)
        
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCaracters {
                let index = Int(arc4random_uniform(UInt32(universeArray.count)))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        return passwords
    }
}
