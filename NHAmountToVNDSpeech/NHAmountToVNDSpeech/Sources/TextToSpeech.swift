//
//  TextToSpeech.swift
//  NHAmountToVNDSpeech
//
//  Created by Hung Nguyen Quang on 30/12/24.
//

import AVFoundation

internal class TextToSpeech {
    var synthesizer = AVSpeechSynthesizer()
    
    internal func speak(_ text: String, _ language: String = "vi") {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.pitchMultiplier = 0.8
        utterance.rate = 0.2 // min: 0.1, max: 1.0, default: 0.5
        
        synthesizer.speak(utterance)
    }
    
    internal func continueSpeaking() {
        synthesizer.continueSpeaking()
    }
    
    internal func stopSpeaking() {
        synthesizer.stopSpeaking(at: .immediate)
    }
    
    internal func pauseSpeaking() {
        synthesizer.pauseSpeaking(at: .immediate)
    }
}
