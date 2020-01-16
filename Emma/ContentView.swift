//
//  ContentView.swift
//  Emma
//
//  Created by Ben Walker on 2020-01-12.
//  Copyright © 2020 bnwlkr. All rights reserved.
//

import SwiftUI
import AVFoundation

struct ContentView: View, SpeechRecognizerDelegate, SpeakerDelegate {
	
	let speechRecognizer = SpeechRecognizer()
	let speaker = Speaker()
	@State var newText = false
	@State var spoken = ""
	@State var englishSpoken = ""
	@State var emmaEnglish = ""
	@State var emmaResponse = ""
	@State var selection = 6 {
		didSet {
			self.speechRecognizer.stopListening()
			self.startSpeechRecognizing()
		}
	}
	@State var languageSelectorPresented = false
    var body: some View {
			VStack {
				VStack {
					ZStack {
						HStack {
							Image("logo")
								.resizable()
								.frame(width: CGFloat(60), height: CGFloat(60), alignment: .center)
						}
						HStack {
							Spacer()
							Button(action: {self.languageSelectorPresented = true}, label: {Text(LANGUAGES[selection].flagUCd).font(.system(size: 40))}).padding(.bottom, 10).padding(.top, 10).sheet(isPresented: $languageSelectorPresented, content: {LanguageSelectionView(parent: self)})

						}

					}
					Divider()
				}
				VStack {
					Text(spoken).bold().multilineTextAlignment(.center).padding(10)
					Text(englishSpoken).multilineTextAlignment(.center).padding(.leading, 10).padding(.trailing, 10)
				}.padding(.top, 100).padding(.bottom, 100)
				VStack {
					Text(emmaResponse).bold().multilineTextAlignment(.center).padding(10)
					Text(emmaEnglish).multilineTextAlignment(.center).padding(.leading, 10).padding(.trailing, 10)
				}
				Spacer()
			}.onAppear(perform: {
				self.speechRecognizer.delegate = self
				self.speaker.delegate = self
				self.startSpeechRecognizing()
			}).padding(.leading, 20).padding(.trailing, 20).padding(.top, 0)
		.statusBar(hidden: true)
    }
    
    func startSpeechRecognizing () {
		do {
			let lang = LANGUAGES[self.selection].isoCd
			print(lang)
            let compatCd: String = String(lang.prefix(2))
			try self.speechRecognizer.startListening(languageCode: compatCd)
		} catch {
			print("failed to start speech recognition")
		}
	}

    func onRecognized(text: String) {
		self.spoken = text
		self.newText = true
	}
	
	func onFinishSpeaking() {
		print("done speaking")
		self.startSpeechRecognizing()
	}
	
	func onComplete () {
		print("spoken: \(self.spoken)")
		if self.newText {
			let lang = LANGUAGES[self.selection].isoCd
            let compatCd: String = String(lang.prefix(2))
			self.speechRecognizer.stopListening()
			Translator.translate(message: self.spoken, from: compatCd, to: "en") { (result) -> () in
					self.englishSpoken = result.replacingOccurrences(of: "&#39;", with: "'")
				EmmaBot.send(message: result, responseHandler: { resp in
					self.emmaEnglish = resp
					Translator.translate(message: resp, from: "en", to: compatCd) { (result2) -> () in
						let processed = result2.replacingOccurrences(of: "&#39;", with: "'")
						self.emmaResponse = processed
						print(result2)
						self.speaker.say(message: processed, languageCode: LANGUAGES[self.selection].isoCd)
					}
				})
			}
			self.newText = false
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
