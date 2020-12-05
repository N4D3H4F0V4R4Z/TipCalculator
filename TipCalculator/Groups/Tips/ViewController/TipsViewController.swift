//
//  TipsViewController.swift
//  TipCalculator
//
//  Created by Наджафов Араз on 03.12.2020.
//

import UIKit

class TipsViewController: UIViewController {
    
    // - UI
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipPrecentageLabel: UILabel!
    @IBOutlet weak var tipPrecentageSlider: UISlider!
    
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    @IBOutlet weak var numberOfPeopleSlider: UISlider!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var eachPriceLabel: UILabel!
    
    @IBOutlet weak var textLabelView: UILabel!
    
    var tipCalculator = TipCalculator(amountBeforeTax: 0, tipPrecentage: 0.10)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        billTextField.becomeFirstResponder()
        
        textLabelView.text = """
            Я считаю, что неумение дать адекватные по размеру чаевые — верный признак неудачника.
            © Дональд Трамп
            """
        
    }
    
    func calculateBill() {
        tipCalculator.tipPrecentage = Double(tipPrecentageSlider.value) / 100.0
        tipCalculator.amountBeforeTax = (billTextField.text! as NSString).doubleValue
        tipCalculator.calculateTip()
        updateUI()
    }
    
    func updateUI(){
        totalPriceLabel.text = String(format: "Всего: %0.2f₽", tipCalculator.totalAmount)
        let numberOfPeople: Int = Int(numberOfPeopleSlider.value)
        eachPriceLabel.text = String(format: "С каждого: %0.2f₽", tipCalculator.totalAmount / Double(numberOfPeople))
    }
    
    @IBAction func billTextFieldAction(_ sender: Any) {
        calculateBill()
    }
    
    @IBAction func tipPrecentageSliderAction(_ sender: Any) {
        calculateBill()
        tipPrecentageLabel.text = String(format: "🧮: %02d%%", Int(tipPrecentageSlider.value * 1))
    }
    
    @IBAction func numberOfPeopleSliderAction(_ sender: Any) {
        calculateBill()
        numberOfPeopleLabel.text = "👨‍👩‍👧‍👦: \(Int(numberOfPeopleSlider.value * 1))"
    }
    
}
