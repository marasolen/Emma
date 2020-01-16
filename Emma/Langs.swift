//
//  Langs.swift
//  EmmaApp
//
//  Created by Rowan Lindsay on 1/11/20.
//  Copyright © 2020 bnwlkr. All rights reserved.
//
import Foundation


struct Language {
    let isoCd: String
    let name: String
    let flagUCd: String
}

let LANGUAGES: [Language] = [
    Language(isoCd: "ar-SA", name: "Arabic",                    flagUCd: "🇦🇪"),
    Language(isoCd: "cs-CZ", name: "Czech",                     flagUCd: "🇨🇿"),
    Language(isoCd: "da-DK", name: "Danish",                    flagUCd: "🇩🇰"),
    Language(isoCd: "de-DE", name: "German",                    flagUCd: "🇩🇪"),
    Language(isoCd: "el-GR", name: "Greek (Modern)",            flagUCd: "🇬🇷"),
    Language(isoCd: "en-AU", name: "English (Australia)",       flagUCd: "🇦🇺"),
    Language(isoCd: "en-GB", name: "English (United Kingdom)",  flagUCd: "🇬🇧"),
    Language(isoCd: "en-US", name: "English (United States)",   flagUCd: "🇺🇸"),
    Language(isoCd: "en-ZA", name: "English (South Africa)",    flagUCd: "🇿🇦"),
    Language(isoCd: "es-ES", name: "Spanish (Spain)",           flagUCd: "🇪🇸"),
    Language(isoCd: "es-MX", name: "Spanish (Mexico)",          flagUCd: "🇲🇽"),
    Language(isoCd: "fi-FI", name: "Finnish",                   flagUCd: "🇫🇮"),
    Language(isoCd: "fr-CA", name: "French (Canada)",           flagUCd: "🇨🇦"),
    Language(isoCd: "fr-FR", name: "French (France)",           flagUCd: "🇫🇷"),
    Language(isoCd: "he-IL", name: "Hebrew",                    flagUCd: "🇮🇱"),
    Language(isoCd: "hu-HU", name: "Hungarian",                 flagUCd: "🇭🇺"),
    Language(isoCd: "id-ID", name: "Indonesian",                flagUCd: "🇮🇩"),
    Language(isoCd: "it-IT", name: "Italian",                   flagUCd: "🇮🇹"),
    Language(isoCd: "ja-JP", name: "Japanese",                  flagUCd: "🇯🇵"),
    Language(isoCd: "ko-KR", name: "Korean",                    flagUCd: "🇰🇷"),
    Language(isoCd: "nl-BE", name: "Dutch (Belgium)",           flagUCd: "🇧🇪"),
    Language(isoCd: "nl-NL", name: "Dutch (Netherlands)",       flagUCd: "🇳🇱"),
    Language(isoCd: "no-NO", name: "Norwegian",                 flagUCd: "🇳🇴"),
    Language(isoCd: "pl-PL", name: "Polish",                    flagUCd: "🇵🇱"),
    Language(isoCd: "pt-BR", name: "Portuguese (Brazil)",       flagUCd: "🇧🇷"),
    Language(isoCd: "pt-PT", name: "Portuguese (Portugal)",     flagUCd: "🇵🇹"),
    Language(isoCd: "ro-RO", name: "Romanian",                  flagUCd: "🇷🇴"),
    Language(isoCd: "ru-RU", name: "Russian",                   flagUCd: "🇷🇺"),
    Language(isoCd: "sk-SK", name: "Slovak",                    flagUCd: "🇸🇰"),
    Language(isoCd: "sv-SE", name: "Swedish",                   flagUCd: "🇸🇪"),
    Language(isoCd: "th-TH", name: "Thai",                      flagUCd: "🇹🇭"),
    Language(isoCd: "tr-TR", name: "Turkish",                   flagUCd: "🇹🇷"),
    Language(isoCd: "zh-CN", name: "Chinese (China)",           flagUCd: "🇨🇳"),
    Language(isoCd: "zh-HK", name: "Chinese (Hong Kong)",       flagUCd: "🇭🇰"),
    Language(isoCd: "zh-TW", name: "Chinese (Taiwan)",          flagUCd: "🇹🇼")
]
