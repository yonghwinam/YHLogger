//
//  ExampleTests.swift
//  ExampleTests
//
//  Created by Yonghwi on 8/30/24.
//

import Testing
import Foundation
import YHLogger

@testable import Example

struct Parameters: Codable {
    let username: String
    let password: String
}

struct ExampleTests {
    
    
    @Test func defaultLog() {
        /// Initialize the logger instance
        let logger = YHLogger()
        
        /// Log a debug message
        logger.debug("debug")
        
        /// Log an informational message
        logger.info("info")
        
        /// Log a warning message
        logger.warning("warning")
        
        /// Log an error message
        logger.error("error")
    }
    
    @Test func customLog() {
        /// Initialize the logger with custom labels for different log levels
        let customLogger = YHLogger(debugLabel: "😆",   /// Custom icon for debug logs
                                    infoLabel: "😉",    /// Custom icon for info logs
                                    warningLabel: "😫", /// Custom icon for warning logs
                                    errorLabel: "😡")   /// Custom icon for error logs
        
        /// Log a custom debug message
        customLogger.debug("custom debug")
        
        /// Log a custom informational message
        customLogger.info("custom info")
        
        /// Log a custom warning message
        customLogger.warning("custom warning")
        
        /// Log a custom error message
        customLogger.error("custom error")
    }
    
    @Test func requestLog() async throws {
        /// 1.  Initialize the logger instance
        let logger = YHLogger()
        
        let url = URL(string: "https://dummyjson.com/user/login")!
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONEncoder().encode(Parameters(username: "emilys", password: "emilyspass"))
            let (data, response) = try await URLSession.shared.data(for: request)
            
            /// 2.  Log the request, response, and data
            logger.request(request, response: response, data: data)
            
        } catch {
            logger.error("Failed to encode request parameters or fetch data from the server: \(error.localizedDescription)")
        }
    }
}
