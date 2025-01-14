//
//  AmountVoiceViewController.swift
//  AmountVNDSpeechDemo
//
//  Created by Hung Nguyen Quang on 30/12/24.
//

import UIKit

class AmountVoiceViewController: UIViewController {
    @IBOutlet weak var tfAmount: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Start NHAmountToSpeech
        AmountToVNDSpeech.shared.start()
    }


    @IBAction func didSelectBack(_ sender: Any) {
        AmountToVNDSpeech.shared.destroy()
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func didSelectSpeechAmount(_ sender: Any) {
        let amount = tfAmount.text ?? ""
        AmountToVNDSpeech.shared.speak(amount)
    }
    
}
