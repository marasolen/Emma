//
//  Translator.swift
//  Emma
//
//  Created by Ben Walker on 2020-01-11.
//  Copyright © 2020 bnwlkr. All rights reserved.
//

import Foundation
import Alamofire

typealias ISOLanguageCode = String

private let API_KEY = ""

protocol TranslatorProtocol {
	static func translate(message: String, from: ISOLanguageCode, to: ISOLanguageCode, resultHandler: @escaping (String) -> ())
}

struct InputBody: Encodable {
    let q: [String]
    //let source: String
    let target: String
}

struct Translator: TranslatorProtocol {
	static func translate(message: String, from: ISOLanguageCode, to: ISOLanguageCode, resultHandler: @escaping (String) -> ()) {
        
        let body = InputBody(q: [message], target: to)

        AF.request("https://translation.googleapis.com/language/translate/v2",
        method: .post,
        parameters: body,
        encoder: JSONParameterEncoder.default,
        headers: [
         "Authorization": ACCESS_TOKEN
         ]).responseJSON { response in
             do {
                let resp = try response.result.get() as! [String: Any]
                print(resp)
                if let data = resp["data"] as? [String: Any] {
					print(data)
					let translations = data["translations"] as! [[String: Any]]
					let trans = translations.first!
					let finalText = trans["translatedText"] as! String  // finally unwrapped!!!
					resultHandler(finalText)
				}
             } catch let err {
                debugPrint(err)
             }
        }
    }
}

