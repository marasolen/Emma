//
//  SpeechRecognizer.swift
//  EmmaApp
//
//  Created by Ben Walker on 2020-01-11.
//  Copyright © 2020 bnwlkr. All rights reserved.
//

import Foundation
import AVFoundation
import Speech

protocol SpeechRecognizerDelegate {
	func onRecognized(text: String)
	func onComplete()
}

class SpeechRecognizer {
	let delay = 1.5
	var language: String!
	let audioEngine = AVAudioEngine()
	var request: SFSpeechAudioBufferRecognitionRequest?
	var recognitionTask: SFSpeechRecognitionTask?
	var delegate: SpeechRecognizerDelegate!
	var timer: Timer?
	
	init() {
    	let node = audioEngine.inputNode
		let recordingFormat = node.outputFormat(forBus: 0)

		node.installTap(onBus: 0, bufferSize: 1024, format: recordingFormat) { buffer, _ in
			self.request?.append(buffer)
		}
		audioEngine.prepare()
	}
	
	func startListening (languageCode: String) throws {
		print("startListening")
		do {
			try audioEngine.start()
		} catch {
			print("failed to start audio engine")
		}
		self.request = SFSpeechAudioBufferRecognitionRequest()
		let speechRecognizer = SFSpeechRecognizer(locale: Locale.init(identifier: languageCode))
		recognitionTask = speechRecognizer?.recognitionTask(with: request!) { result, _ in
			if let transcription = result?.bestTranscription {
				self.delegate?.onRecognized(text: transcription.formattedString)
				self.startTimer()
			}
		}
		startTimer()
	}
	
	
	func startTimer () {
		self.timer?.invalidate()
		self.timer = Timer.scheduledTimer(withTimeInterval: self.delay, repeats: false, block: {_ in
			self.delegate.onComplete()
		})
	}
	
	func stopListening () {
		audioEngine.stop()
		request?.endAudio()
		recognitionTask?.cancel()
	}
	

}
