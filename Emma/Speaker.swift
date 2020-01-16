//
//  Speaker.swift
//  Emma
//
//  Created by Ben Walker on 2020-01-12.
//  Copyright © 2020 bnwlkr. All rights reserved.
//

import Foundation
import AVFoundation

protocol SpeakerDelegate {
	func onFinishSpeaking()
}

class Speaker: NSObject, AVSpeechSynthesizerDelegate {
	let synth = AVSpeechSynthesizer()
	var delegate: SpeakerDelegate?
	override init() {
        super.init()
        synth.delegate = self
    }
    
	func say(message: String, languageCode: String) {
        let utterance = AVSpeechUtterance(string: message)
        utterance.voice = AVSpeechSynthesisVoice(language: languageCode)
        synth.speak(utterance)
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        delegate?.onFinishSpeaking()
    }
}
