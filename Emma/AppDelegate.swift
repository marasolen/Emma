//
//  AppDelegate.swift
//  Emma
//
//  Created by Ben Walker on 2020-01-12.
//  Copyright © 2020 bnwlkr. All rights reserved.
//

import UIKit
import AVFoundation

let ACCESS_TOKEN = "Bearer ya29.Il-5B5jm3FC8TvJDQn5E8Zgjoj7oBup-A5qMP1fobJkrfh5itLVcSb2cqZtoWUC36KmtlDX7tnmJGPoj61v86JjhV9DLwORQQ-YA9Z97MslfV9rPkaHmK0Wph_JhplUW3w"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
		let audioSession = AVAudioSession.sharedInstance()
		do {
			try audioSession.setCategory(AVAudioSession.Category.playAndRecord, options: AVAudioSession.CategoryOptions.defaultToSpeaker)
		} catch {
		  print("audioSession properties weren't set because of an error.")
		}
		return true
	}

	// MARK: UISceneSession Lifecycle

	func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
		// Called when a new scene session is being created.
		// Use this method to select a configuration to create the new scene with.
		return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
	}

	func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
		// Called when the user discards a scene session.
		// If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
		// Use this method to release any resources that were specific to the discarded scenes, as they will not return.
	}


}

