//
//  Demos.swift
//
//
//  Created by Cay Zhang on 2020/2/23.
//
import SwiftUI
import Combine
import Speech
import SwiftSpeech

struct audioRecord: View {
    
    var sessionConfiguration: SwiftSpeech.Session.Configuration
    
    @State public var message: String = ""
    
    public init(sessionConfiguration: SwiftSpeech.Session.Configuration) {
        self.sessionConfiguration = sessionConfiguration
    }
    
    public init(locale: Locale = .current) {
        self.init(sessionConfiguration: SwiftSpeech.Session.Configuration(locale: locale))
    }
    
    public init(localeIdentifier: String) {
        self.init(locale: Locale(identifier: localeIdentifier))
    }
    
    var body: some View {
        VStack(spacing: 35.0) {
            Text(message)
                .font(.system(size: 25, weight: .bold, design: .default))
            SwiftSpeech.RecordButton()
                .swiftSpeechToggleRecordingOnTap(sessionConfiguration: sessionConfiguration, animation: .spring(response: 0.3, dampingFraction: 0.5, blendDuration: 0))
                .onRecognizeLatest(update: $message)
            
        }.onAppear {
            SwiftSpeech.requestSpeechRecognitionAuthorization()
        }
    }
}
