// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

open class YHLogger {
    
    private let debugIcon: String
    private let infoIcon: String
    private let warningIcon: String
    private let errorIcon: String
    
    public init(debugIcon: String = "🧐",
                infoIcon: String = "✅",
                warningIcon: String = "⚠️",
                errorIcon: String = "❌") {
        self.debugIcon = debugIcon
        self.infoIcon = infoIcon
        self.warningIcon = warningIcon
        self.errorIcon = errorIcon
    }
    
    public func debug(_ message: Any?,
                      functionName: StaticString = #function,
                      fileName: NSString = #file,
                      lineNumber: Int = #line,
                      userInfo: [String: Any] = [:]) {
        let className = fileName.lastPathComponent
        if message != nil {
            print(" \(debugIcon) \(className):\(lineNumber) - \(functionName)> \(message!)")
        } else {
            print(" \(debugIcon) \(className):\(lineNumber) >")
        }
    }
    
    public func info(_ message: Any?,
                     functionName: StaticString = #function,
                     fileName: NSString = #file,
                     lineNumber: Int = #line,
                     userInfo: [String: Any] = [:]) {
        let className = fileName.lastPathComponent
        if message != nil {
            print(" \(infoIcon) \(className):\(lineNumber) - \(functionName)> \(message!)")
        } else {
            print(" \(infoIcon) \(className) \(lineNumber)>")
        }
    }
    
    public func warning(_ message: Any?,
                        functionName: StaticString = #function,
                        fileName: NSString = #file,
                        lineNumber: Int = #line,
                        userInfo: [String: Any] = [:]) {
        let className = fileName.lastPathComponent
        if message != nil {
            print(" \(warningIcon) \(className):\(lineNumber) - \(functionName)> \(message!)")
        } else {
            print(" \(warningIcon) \(className):\(lineNumber)>")
        }
    }
    
    public func error(_ message: Any?,
                      functionName: StaticString = #function,
                      fileName: NSString = #file,
                      lineNumber: Int = #line,
                      userInfo: [String: Any] = [:]) {
        let className = fileName.lastPathComponent

        if message != nil {
            print(" \(errorIcon) \(className):\(lineNumber) - \(functionName)> \(message!)")
        } else {
            print(" \(errorIcon) \(className):\(lineNumber)>")
        }
    }
}
