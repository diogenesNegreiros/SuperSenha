//
//  PasswordViewController.swift
//  SuperSenha
//
//  Created by Diogenes de Souza on 18/05/21.
//

import UIKit

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var textViewPassword: UITextView!
    
    var numberOfCaracters = 10
    var numberOfPasswords = 1
    var useUperLetters: Bool!
    var useNumbers: Bool!
    var useLowerLetters: Bool!
    var useEspecialCaracters: Bool!
    
    var passworGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas: \(numberOfPasswords)"
        passworGenerator = PasswordGenerator(numberOfCaracters: numberOfCaracters, useLowerLetters: useLowerLetters, useNumbers: useNumbers, useUperLetters: useUperLetters, useEspecialCaracters: useEspecialCaracters)
        
        generatePasswords()
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    
    func generatePasswords() {
        textViewPassword.scrollRangeToVisible(_NSRange(location: 0, length: 0))
        textViewPassword.text = ""
        let passwords = passworGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            textViewPassword.text.append(password + "\n\n")
        }
    }
}
