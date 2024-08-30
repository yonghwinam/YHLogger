// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

public func YHDebugLog(_ message: Any?,
                       functionName: StaticString = #function,
                       fileName: NSString = #file,
                       lineNumber: Int = #line,
                       userInfo: [String: Any] = [:]) {
    let className = fileName.lastPathComponent
#if DEBUG
    if message != nil {
        print(" 🧐 \(className):\(lineNumber) - \(functionName)> \(message!)")
    } else {
        print(" 🧐 \(className):\(lineNumber) >")
    }
#endif
}

public func YHInfoLog(_ message: Any?,
                      functionName: StaticString = #function,
                      fileName: NSString = #file,
                      lineNumber: Int = #line,
                      userInfo: [String: Any] = [:]) {
    let className = fileName.lastPathComponent
#if DEBUG
    if message != nil {
        print(" ✅ \(className):\(lineNumber) - \(functionName)> \(message!)")
    } else {
        print(" ✅ \(className) \(lineNumber)>")
    }
#endif
}

public func YHWarningLog(_ message: Any?,
                         functionName: StaticString = #function,
                         fileName: NSString = #file,
                         lineNumber: Int = #line,
                         userInfo: [String: Any] = [:]) {
    let className = fileName.lastPathComponent
#if DEBUG
    if message != nil {
        print(" ⚠️ \(className):\(lineNumber) - \(functionName)> \(message!)")
    } else {
        print(" ⚠️ \(className):\(lineNumber)>")
    }
#endif
}

public func YHErrorLog(_ message: Any?,
                       functionName: StaticString = #function,
                       fileName: NSString = #file,
                       lineNumber: Int = #line,
                       userInfo: [String: Any] = [:]) {
    let className = fileName.lastPathComponent
#if DEBUG
    if message != nil {
        print(" ❌ \(className):\(lineNumber) - \(functionName)> \(message!)")
    } else {
        print(" ❌ \(className):\(lineNumber)>")
    }
#endif
}
