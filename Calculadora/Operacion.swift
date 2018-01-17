//
//  Operacion.swift
//  Calculadora
//
//  Created by Jose Flores on 17/01/2018.
//  Copyright © 2018 Jose Flores. All rights reserved.
//

import Foundation

class Operacion{
   /*
    var cadena: String!
    var operandos: Array<Float>!
    var cadenaArray: Array<String>!
     */
    var operando1: Float!
    var operando2: Float!
    var operador: String!
    var resultado: Float!
    var cadenaResultado: String!
    
    init(num1: Float, signo: String) {
        self.operando1 = num1
        self.operador = signo
    }
    
    //Esta funcion establece el operando2
    func setOperando2(num2: Float) -> Void
    {
        self.operando2 = num2
    }
    
    
    func resolver () -> Bool {
        if(self.operador == "+"){
            resultado = operando1 + operando2
        return true
        }
        
        else if(self.operador == "-"){
            resultado = operando1 - operando2
        return true
        }
        
        else if(self.operador == "X"){
            resultado = operando1 * operando2
        return true
        }
        
        else if(self.operador == "/"){
            resultado = operando1 / operando2
            return true
        }
        return false
    }
    
    
}
