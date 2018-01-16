//
//  ViewController.swift
//  is it email
//
//  Created by SUP'Internet 04 on 16/01/2018.
//  Copyright © 2018 SUP'Internet 04. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBOutlet weak var emailTextField: UITextField!

    @IBAction func checkAction(_ sender: UIButton) {
        if self.emailTextField.text == nil{
            self.createAlert(isValid: false)
            return;
        }else{
            let email = Email(email: self.emailTextField.text!)
            if !email.isValid(){
                self.createAlert(isValid: false)
                return;
            }
            
            self.createAlert(isValid: true)
        }
    }
    
    func createAlert(isValid: Bool){
        let message = isValid ? "Votre email est valide" : "Votre email n'est pas valide"
        //let message = isValid ? "Votre email est valide" : "Votre email n'est pas valide"
        
        let alert = UIAlertController(title: "Vérification email", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default, handler: { _ in
            self.performSegue(withIdentifier: "showModal", sender: nil)
        }))
            
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

