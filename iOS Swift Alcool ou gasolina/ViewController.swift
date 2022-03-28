//
//  ViewController.swift
//  iOS Swift Alcool ou gasolina
//
//  Created by Sergio Santos on 27/03/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var legendResult: UILabel!
    @IBOutlet weak var alcoholPriceField: UITextField!
    @IBOutlet weak var gasolinePriceField: UITextField!
    
    let valueConstant: Double = 0.7
    
    @IBAction func calculeteFuel(_ sender: Any) {
        
        if let alcoholPrice = alcoholPriceField.text {
            if let gasolinePrice = gasolinePriceField.text {
                // Validate the entered values
                
                let validatedFields = self.fieldsValidation(alcoholPrice: alcoholPrice, gasolinePrice: gasolinePrice)
               
                if validatedFields {
                    self.calculateBestPrice(alcoholPrice: alcoholPrice, gasolinePrice: gasolinePrice)
                } else {
                    legendResult.text = "Digite os preços para calcular!"
                }
            }
        }
        
    }
    
    func calculateBestPrice(alcoholPrice: String, gasolinePrice: String) {
        // Convert Values
        if let alcoholValue = Double(alcoholPrice) {
            if let gasolineValue = Double(gasolinePrice) {
                /*
                 Faz cálculo (precoAlcool / preco gasolina)
                 Se o resultado >= 0.7 melhor utilizar gasolina, senão melhor utilizar Álcool
                 */
                let priceResult = alcoholValue / gasolineValue
                if priceResult >= self.valueConstant {
                    self.legendResult.text = "Melhor utilizar Gasolina!"
                } else {
                    self.legendResult.text = "Melhor utilizar Álcool!"
                }
            }
        }
    }
    
    func fieldsValidation(alcoholPrice: String, gasolinePrice: String) -> Bool {
        var valitatedFields: Bool = true
        
        if alcoholPrice.isEmpty {
            valitatedFields = false
        } else if gasolinePrice.isEmpty {
            valitatedFields = false
        }
        
        return valitatedFields
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

