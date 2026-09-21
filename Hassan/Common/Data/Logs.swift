//
//  Logs.swift
//  Hassan
//
//  Created by Mourchidi Mfoumby on 11/09/2026.
//


import os
import FirebaseCrashlytics

private let crashlytics = Crashlytics.crashlytics()
private let subsystem = "com.upsaclay.gedoise"

func d(_ tag: String, _ message: String) {
    let logger = Logger(subsystem: subsystem, category: tag)
    
    let formatter = DateFormatter()
    formatter.dateFormat = "MM-dd HH:mm:ss.SSS"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone.current
    let date = formatter.string(from: Date())
    
    logger.debug("🔄 \(date) \(tag)\t\(subsystem)\t [D] \(message)")
}

func i(_ tag: String, _ message: String) {
    let logger = Logger(subsystem: subsystem, category: tag)
    
    let formatter = DateFormatter()
    formatter.dateFormat = "MM-dd HH:mm:ss.SSS"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone.current
    let date = formatter.string(from: Date())
    
    logger.info("🚹 \(date) \(tag)\t\(subsystem)\t [I] \(message)")
}

func w(_ tag: String, _ message: String) {
    let logger = Logger(subsystem: subsystem, category: tag)
    
    let formatter = DateFormatter()
    formatter.dateFormat = "MM-dd HH:mm:ss.SSS"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone.current
    let date = formatter.string(from: Date())
    
    logger.warning("⚠️ \(date) \(tag)\t\(subsystem)\t [W] \(message)")
}

func e(_ tag: String, _ message: String, _ error: Error? = nil) {
    let logger = Logger(subsystem: subsystem, category: tag)
    
    let formatter = DateFormatter()
    formatter.dateFormat = "MM-dd HH:mm:ss.SSS"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone.current
    let date = formatter.string(from: Date())
    
    logger.critical("🛑 \(date) \(tag)\t\(subsystem)\t [E] \(message): \(error)")
    #if DEBUG
    #else
    crashlytics.log("\(date) \(tag)\t\(subsystem)\t E \(message)")
    if let error {
        crashlytics.record(error: error)
    }
    #endif
}
