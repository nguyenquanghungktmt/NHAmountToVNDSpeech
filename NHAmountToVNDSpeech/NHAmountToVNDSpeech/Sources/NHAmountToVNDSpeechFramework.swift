//
//  NHAmountToVNDSpeechFramework.swift
//  NHAmountToVNDSpeech
//
//  Created by Hung Nguyen Quang on 14/1/25.
//

import UIKit

public protocol NHAmountToVNDSpeechDelegate: AnyObject {
    func printVC()
}

final public class NHAmountToVNDSpeechFramework: NSObject {
    public static let shared = NHAmountToVNDSpeechFramework()
    
    public weak var delegate: NHAmountToVNDSpeechDelegate?
    
    public func openSDK(from vc: UIViewController?, delegate: NHAmountToVNDSpeechDelegate?) {
        let nextVC = AmountVoiceViewController()
        vc?.navigationController?.pushViewController(nextVC, animated: true)
        self.delegate = delegate
        self.delegate?.printVC()
    }
}
