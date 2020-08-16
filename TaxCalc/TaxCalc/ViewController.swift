//
//  ViewController.swift
//  TaxCalc
//
//  Created by miyazawaryohei on 2020/08/17.
//  Copyright © 2020 miya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var textField2: UITextField!
    @IBOutlet var result: UILabel!
    
    let taxValue = "taxValue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.object(forKey: taxValue) != nil {
            textField2.text = UserDefaults.standard.object(forKey: taxValue) as? String
        }
    }
    
    @IBAction func calc(_ sender: Any) {
        UserDefaults.standard.set(textField2.text, forKey: taxValue)
        tax()
    }
    
    func tax (){
        let taxNum = Int(textField.text!)
        let conTax = Float(1 + Float(textField2.text!)! / 100)
        let taxCalc = Int(Float(taxNum!) * conTax)
        result.text = String(taxCalc)
    }
}

