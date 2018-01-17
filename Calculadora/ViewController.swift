//
//  ViewController.swift
//  Calculadora
//
//  Created by Jose Flores on 16/01/2018.
//  Copyright © 2018 Jose Flores. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var operacion: Operacion!
    
    @IBOutlet weak var lblDisplay: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    //Cuando se llama a esta función, se actualiza el TextField de la interfaz con el texto del boton pulsado
    @IBAction func btnPulsado(_ sender: UIButton) {
        let texto = sender.titleLabel!.text!
        print("\(texto)")
        actualizarVista(texto:texto)
        
    }
   //Esta función se encarga de mostrar los cambios del modelo en la interfaz
    func actualizarVista(texto : String){
        print("\(texto)")
        lblDisplay.insertText(texto)
        
    }

    @IBAction func bntBorrar(_ sender: UIButton) {
        var texto:String = (lblDisplay.text)!
        texto.remove(at: texto.endIndex)
        
        lblDisplay.text = String(texto)
    }
}

