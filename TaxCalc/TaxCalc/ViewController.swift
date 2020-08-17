//
//  ViewController.swift
//  TaxCalc
//
//  Created by miyazawaryohei on 2020/08/17.
//  Copyright © 2020 miya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //変数名を読みやすいように変更
    @IBOutlet var priceTextField: UITextField!
    @IBOutlet var taxTextField: UITextField!
    @IBOutlet var resultLabel: UILabel!
    let taxValueKey = "taxValue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taxTextField.text = (UserDefaults.standard.object(forKey: taxValueKey) as? String) ?? ""
    }
    
    @IBAction func calc(_ sender: Any) {
        UserDefaults.standard.set(taxTextField.text, forKey: taxValueKey)
        tax()
    }
    
    func tax (){
        //textFieldの中身を空にするとアプリが落ちるので、修正しました
        let taxNum = Int(priceTextField.text!) ?? 0
        let consumptionTax =  (Float(taxTextField.text!) ?? 0) / 100
        let taxCalc = Int(Float(taxNum) * (1 + consumptionTax))
        resultLabel.text = String(taxCalc)
    }
}

