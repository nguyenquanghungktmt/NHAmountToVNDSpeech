//
//  AmountToVNDSpeech.swift
//  NHAmountToVNDSpeech
//
//  Created by Hung Nguyen Quang on 30/12/24.
//

import Foundation

public protocol AmountToVNDSpeechDelegate: AnyObject {
    
}

final public class AmountToVNDSpeech: NSObject {
    public static let shared = AmountToVNDSpeech()
    
    private var numberToVietnamese: NumberToVietnamese?
    private var textToSpeech: TextToSpeech?
    
    public weak var delegate: AmountToVNDSpeechDelegate?
    
    public func start() {
        numberToVietnamese = NumberToVietnamese()
        textToSpeech = TextToSpeech()
    }
    
    public func speak(_ amount: String, speed: Float = 0.3) {
        
        if !validAmount(amount) {
            textToSpeech?.speak("Số tiền không hợp lệ", speed)
            return
        }
        
        let text = numberToVietnamese?.numberToWord(amount) ?? ""
        textToSpeech?.speak(text, speed)
    }
    
    public func destroy() {
        textToSpeech?.stopSpeaking()
        textToSpeech = nil
        numberToVietnamese = nil
        delegate = nil
    }
    
    private func validAmount(_ input: String) -> Bool {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        if let number = formatter.number(from: input) {
            // Check if the number is a valid decimal number with up to two decimal places
            return number.decimalValue == (NSDecimalNumber(decimal: number.decimalValue).rounding(accordingToBehavior: nil) as Decimal)
        }
        return false
    }
}
