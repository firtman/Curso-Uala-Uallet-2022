//
//  ViewController.swift
//  Uallet
//
//  Created by Maximiliano Firtman on 3/28/22.
//

// protocolo - definición de métodos que una clase puede implementar
//             si decide cumplir con el protocolo


import UIKit


class LoginViewController: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var txtUsuario: UITextField!
    @IBOutlet weak var txtContrasena: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // no podemos ir a otra pantalla en viewDidLoad, tenemos que esperar
    // al viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.bool(forKey: "logueado") {
            irAHome(animado: false)
        }
    }
    
    @IBAction func dobleTapLogo(_ sender: Any) {
        txtUsuario.text = "admin"
        txtContrasena.text = "12345"
        
    }
    
    @IBAction func tocoFondo(_ sender: Any) {
        txtUsuario.resignFirstResponder()
        txtContrasena.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // quita el teclado
        return true
    }

    
    
    func irAHome(animado isAnimated: Bool = true) {
        let tabVC = MainTabViewController()
        tabVC.modalTransitionStyle = .coverVertical
        tabVC.modalPresentationStyle = .fullScreen
        present(tabVC, animated: isAnimated)
        
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "logueado")
    }
    
    @IBAction func login(_ sender: Any) {
        
        // Intentá hacer lo siguiente
        // si llega a generar excepción: NO ME IMPORTA, seguí de largo
        try? API.login("", "") { _ in
            
        }
        
        do {
            print("Intentando loguear")
            try API.login(txtUsuario.text!, txtContrasena.text!) { logueado in
                if logueado {
                    irAHome()
                } else {
                    alertaError("Error en los datos de ingreso. Intente nuevamente.")
                }
            }
        } catch APIError.UserIncomplete {
            alertaError("No se ingresó el usuario")
        } catch APIError.PasswordIncomplete {
            alertaError("No se ingresó la contraseña")
        } catch {
            alertaError("Error desconocido")
        }
    }
    
    func alertaError(_ mensaje: String) {
        let alerta = UIAlertController(title: "Log in",
                                       message: mensaje,
                                       preferredStyle: .alert)
        
        let botonOk = UIAlertAction(title: "Aceptar",
                                    style: .default)
        
        
        alerta.addAction(botonOk)
        present(alerta, animated: true)
    }


}

