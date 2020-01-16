//
//  EmmaBot.swift
//  Emma
//
//  Created by Ben Walker on 2020-01-12.
//  Copyright © 2020 bnwlkr. All rights reserved.
//

import Foundation
import Alamofire

protocol ChatbotProtocol {
	static func send(message: String, responseHandler: @escaping (String) -> Void)
}

struct AccessToken: Encodable {
    let token: String
}

struct InputText: Encodable {
    let text: String
    let language_code: String
}

struct Query: Encodable {
    let text: InputText
}

struct SendBody: Encodable {
    let query_input: Query
}

struct EmmaBot: ChatbotProtocol {
    
	static func send(message: String, responseHandler: @escaping (String) -> Void) {
        var sessionID: String = ""
        let store = UserDefaults.standard
        if store.object(forKey: "uid") == nil {
            debugPrint("generating new uid")
            let uid = UUID().uuidString
            store.set(uid, forKey: "uid")
            if !store.synchronize(){
                debugPrint("Error in store")
            }
            debugPrint(uid)
            sessionID = uid
        } else {
            sessionID = store.string(forKey: "uid") ?? ""
            debugPrint("found uid " + sessionID)
        }
        if sessionID == "" {
            debugPrint("Failed to get session ID")
            return
        }
        let LANG_CODE = "en-US"
        let input = InputText(text: message, language_code: LANG_CODE)
        let query = Query(text: input)
        let body = SendBody(query_input: query)
        AF.request("https://dialogflow.googleapis.com/v2/projects/emma-ftvlgu/agent/sessions/" + sessionID + ":detectIntent",
                   method: .post,
                   parameters: body,
                   encoder: JSONParameterEncoder.default,
                   headers: [
                    "Authorization": ACCESS_TOKEN
                    ]).responseJSON { response in
                        do {
                            let resp = try response.result.get() as! [String: Any]
                            print(resp)
                            let maybeResult = resp["queryResult"] as Optional
                            if maybeResult == nil {
                                print("Likely error with API access token")
                                return
                            }
                            let result = maybeResult as! [String: Any]
                            let response = result["fulfillmentText"] as Optional
                            if response != nil {
                                let data = response! as! String
                                responseHandler(data)
                            } else {
                               print("No response")
                            }
                        } catch let err {
                            debugPrint(err)
                        }
        }
	}
}
