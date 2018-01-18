//
//  ViewController.swift
//  Calculadora
//
//  Created by JoNaDCorp on 16/01/2018.
//  Copyright © 2018 JoNaDCorp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //var operacion para poder pasar datos
    var operacion: Operacion!
    //var para poder trabajar con el textfield
    @IBOutlet weak var lblDisplay: UITextField!
    //var texfield de ver la operacion
    @IBOutlet var verOperacion: UILabel!
    //var para pasar un argumento a la clase operacion
    var n1:Float!
    //var para permitir seguir con la operacion
    var permisoConcedido = false
    
    //Cuando se llama a esta función, se actualiza el TextField de la interfaz con el texto del boton pulsado
    @IBAction func btnPulsado(_ sender: UIButton) {
        var texto = sender.titleLabel!.text!
        print("\(texto)")
        actualizarVista(texto:texto)
    }
    //funcion que contiene los botones de las operaciones
    @IBAction func btn_operaciones(_ sender: UIButton) {
        //comprobacion de si esta vacio el textfield
        if(lblDisplay.text == ""){
        //si esta vacio se tomará como un 0
            n1 = 0
        }else{
            //si no esta vacio se comprueba si hay un punto solo
            if (lblDisplay.text != "."){
            n1 = Float(lblDisplay.text!)!
                // en caso de que llegue aqui se permite realizar la operacion
                permisoConcedido = true
            }else{
                permisoConcedido = false
            }
        }
        if (permisoConcedido){
            switch(sender.titleLabel!.text!){
            case "+":
                operacion = Operacion(num1:n1,signo:"+")
                lblDisplay.text = ""
                break
            case "-":
                operacion = Operacion(num1:n1, signo: "-")
                lblDisplay.text = ""
                break
            case "X":
                operacion = Operacion(num1:n1, signo: "X")
                lblDisplay.text = ""
                break
            case "/":
                operacion = Operacion(num1:n1, signo: "/")
                lblDisplay.text = ""
                break
            case "C":
                n1 = 0
                operacion = nil
                lblDisplay.text = ""
                verOperacion.text = ""
                break
            case "=":
                if(lblDisplay.text != ""){
                    operacion.setOperando2(num2: Float(lblDisplay.text!)!)
                    if(operacion.resolver()){
                        lblDisplay.text = String(operacion.resultado)
                        verOperacion.text = "\(operacion.operando1!) \(operacion.operador!) \(operacion.operando2!)"
                    }else{
                        lblDisplay.text = "Error"
                    }
                }else{
                    print("textfield vacio")
                }
                break
            default:
                break
            }
        }
        
    }
    
   //Esta función se encarga de mostrar los cambios del modelo en la interfaz
    func actualizarVista(texto : String){
        print("\(texto)")
        lblDisplay.insertText(texto)
        
    }
    //función que se encarga de borrar el textfield
    @IBAction func bntBorrar(_ sender: UIButton) {
        if (lblDisplay.text != ""){
                let texto:String = (lblDisplay.text)!
                let nuevoTexto = texto.substring(to: texto.index(before: texto.endIndex))
                lblDisplay.text = nuevoTexto
        }else{
            print("textfield vacio")
        }
    }
}

