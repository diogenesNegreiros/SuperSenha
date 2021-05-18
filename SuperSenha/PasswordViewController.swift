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
    var numberOfPassword = 1
    var useUperLetters: Bool!
    var useNumbers: Bool!
    var useLowerLetters: Bool!
    var useEspecialCaracters: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func generate(_ sender: UIButton) {
    }
}
