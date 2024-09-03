// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

open class YHLogger {
    
    private let debugLabel: String
    private let infoLabel: String
    private let warningLabel: String
    private let errorLabel: String
    private let requestLabel: String
    
    public init(debugLabel: String = "🧐",
                infoLabel: String = "✅",
                warningLabel: String = "⚠️",
                errorLabel: String = "❌",
                requestLabel: String = "🛜") {
        
        self.debugLabel = debugLabel
        self.infoLabel = infoLabel
        self.warningLabel = warningLabel
        self.errorLabel = errorLabel
        self.requestLabel = requestLabel
    }
    
    public func debug(_ message: Any?,
                      functionName: StaticString = #function,
                      fileName: NSString = #file,
                      lineNumber: Int = #line) {
        let className = fileName.lastPathComponent
        if message != nil {
            print(" \(debugLabel) \(className):\(lineNumber) - \(functionName)> \(message!)")
        } else {
            print(" \(debugLabel) \(className):\(lineNumber) >")
        }
    }
    
    public func info(_ message: Any?,
                     functionName: StaticString = #function,
                     fileName: NSString = #file,
                     lineNumber: Int = #line,
                     userInfo: [String: Any] = [:]) {
        let className = fileName.lastPathComponent
        if message != nil {
            print(" \(infoLabel) \(className):\(lineNumber) - \(functionName)> \(message!)")
        } else {
            print(" \(infoLabel) \(className) \(lineNumber)>")
        }
    }
    
    public func warning(_ message: Any?,
                        functionName: StaticString = #function,
                        fileName: NSString = #file,
                        lineNumber: Int = #line) {
        let className = fileName.lastPathComponent
        if message != nil {
            print(" \(warningLabel) \(className):\(lineNumber) - \(functionName)> \(message!)")
        } else {
            print(" \(warningLabel) \(className):\(lineNumber)>")
        }
    }
    
    public func error(_ message: Any?,
                      functionName: StaticString = #function,
                      fileName: NSString = #file,
                      lineNumber: Int = #line) {
        let className = fileName.lastPathComponent

        if message != nil {
            print(" \(errorLabel) \(className):\(lineNumber) - \(functionName)> \(message!)")
        } else {
            print(" \(errorLabel) \(className):\(lineNumber)>")
        }
    }
    
    public func request(_ request: URLRequest? = nil,
                        response: URLResponse? = nil,
                        data: Data? = nil,
                        functionName: StaticString = #function,
                        fileName: NSString = #file,
                        lineNumber: Int = #line) {
        
        let className = fileName.lastPathComponent
        
        var statusCode: Int = .zero
        var method = ""
        var url = ""
        var reqHeaders = ""
        var body = ""
        
        var resHeaders = ""
        var result = ""
        
        if request?.httpMethod != nil {
            method = request!.httpMethod!
        }
        
        if request?.url?.absoluteString != nil {
            url = request!.url!.absoluteString
        }
        
        if request?.allHTTPHeaderFields != nil {
            reqHeaders = dicToJsonString(request!.allHTTPHeaderFields!)
        }
        
        if request?.httpBody != nil {
            body = dataToJsonString(request!.httpBody!)
        }
        
        if let httpResponse = response as? HTTPURLResponse {
            statusCode = httpResponse.statusCode
            resHeaders = dicToJsonString(httpResponse.allHeaderFields)
        }
        
        if data != nil {
            guard let json = try? JSONSerialization.jsonObject(with: data!) else {
                print(" \(requestLabel) \(className):\(lineNumber)> The response object is not JSON formatted.")
                return
            }
            
            let prettyJsonData = try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            if let jsonString = String(data: prettyJsonData, encoding: .utf8) {
                result = jsonString
            }
        
        }
        
        print(" \(requestLabel) \(className):\(lineNumber) - \(functionName)> \(method) \(url)\nRequest Headers: \(reqHeaders)\nBody: \(body)\nStatus Code: \(statusCode)\nResponse Headers: \(resHeaders)\nResult: \(result)")
    }
    
    
    // MARK: - Private Method
    /// Converts a `Dictionary` to a JSON-formatted string.
    private func dicToJsonString(_ dic: [AnyHashable : Any]) -> String {
        guard let data = try? JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted) else { return "" }
        guard let jsonString = String(data: data, encoding: .utf8) else { return "" }
        
        return jsonString
    }
    
    /// Converts `Data` to a JSON-formatted string.
    private func dataToJsonString(_ data: Data) -> String {
        guard let json = try? JSONSerialization.jsonObject(with: data) else { return "" }
        let prettyJsonData = try! JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        let jsonString = String(data: prettyJsonData, encoding: .utf8) ?? ""
        
        return jsonString
    }
}
