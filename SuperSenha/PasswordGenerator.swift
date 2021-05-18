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
    var usenumbers: Bool
    var useEspecialCaracters: Bool
    
    var passwords: [String] = []
    private let letters = ["abcdefghijlmnopqrstuvxz"]
    private let numbers = ["0123456789"]
    private let specialCaracters = ["!@#$%ˆ&*()_+=-~`][{}|';:/.,<>?"]
    
}
