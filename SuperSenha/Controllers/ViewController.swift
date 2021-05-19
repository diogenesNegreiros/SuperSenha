//
//  ViewController.swift
//  SuperSenha
//
//  Created by Diogenes de Souza on 16/05/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var lbTotalPasswords: UITextField!
    @IBOutlet weak var lbTotalCaracters: UITextField!
    @IBOutlet weak var swUperLetters: UISwitch!
    @IBOutlet weak var swLowerLetters: UISwitch!
    @IBOutlet weak var swNumbers: UISwitch!
    @IBOutlet weak var swEspecialCaracters: UISwitch!
    @IBOutlet weak var generateIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configNavigationBar()
        lbTotalPasswords.inputAccessoryView = createToolBar()
        lbTotalCaracters.inputAccessoryView = createToolBar()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        let passwordViewController = segue.destination as! PasswordViewController
        
        if let numberOfCaracters = Int(lbTotalCaracters.text!) {
            passwordViewController.numberOfCaracters = numberOfCaracters
        }
        
        if let numberOfPasswords = Int(lbTotalPasswords.text!) {
            passwordViewController.numberOfPasswords = numberOfPasswords
        }
        
        passwordViewController.useNumbers = swNumbers.isOn
        passwordViewController.useLowerLetters = swLowerLetters.isOn
        passwordViewController.useUperLetters = swUperLetters.isOn
        passwordViewController.useEspecialCaracters = swEspecialCaracters.isOn
        
        view.endEditing(true)
        generateIndicator.stopAnimating()
    }
    
    func configNavigationBar() {
        let navBar = self.navigationController!.navigationBar
        navBar.tintColor = UIColor.white
        navBar.barTintColor = .purple
        navBar.titleTextAttributes = [.foregroundColor: UIColor.yellow]
        navBar.backgroundColor = .purple
        navBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func createToolBar() -> UIToolbar {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 0, height: 30))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneEditing))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([space, doneButton], animated: true)
        return toolbar
    }
    
    @objc private func doneEditing() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
    
}
