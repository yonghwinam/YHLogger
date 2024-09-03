
# YHLogger

`YHLogger` is a customizable Swift logging utility that enhances the debugging experience by allowing developers to log messages with different severity levels and custom icons. This logger also provides a feature to log HTTP request and response details, making it easier to debug network-related issues.

## Features

- Customizable log icons for different log levels (debug, info, warning, error).
- Detailed logging for HTTP requests and responses.
- Easy integration into any Swift project.

## Requirements

- **iOS 13.0** or later
- **macOS 10.15** or later
- **Swift 5.0** or later

## Installation

### Swift Package Manager

To install `YHLogger` using Swift Package Manager:

1. In Xcode, select `File` > `Swift Packages` > `Add Package Dependency...`.
2. Enter the repository URL: `https://github.com/YourUsername/YHLogger.git`
3. Choose the version you prefer, then click `Next` and `Finish`.

## Usage

### Basic Logging

```swift
let logger = YHLogger()

logger.debug("This is a debug message")
logger.info("This is an info message")
logger.warning("This is a warning message")
logger.error("This is an error message")
```
##### Console :
 - 🧐 ExampleTests.swift:27 - defaultLog()> debug
 - ✅ ExampleTests.swift:30 - defaultLog()> info
 - ⚠️ ExampleTests.swift:36 - defaultLog()> error
 - ❌ ExampleTests.swift:36 - defaultLog()> error


### Custom Logging Labels

```swift
let customLogger = YHLogger(debugLabel: "🩵", 
                            infoLabel: "💚", 
                            warningLabel: "💛", 
                            errorLabel: "💔")

customLogger.debug("Custom debug message")
customLogger.info("Custom info message")
customLogger.warning("Custom warning message")
customLogger.error("Custom error message")
```
##### Console:
 - 🩵 ExampleTests.swift:47 - customLog()> custom debug
 - 💚 ExampleTests.swift:50 - customLog()> custom info
 - 💛 ExampleTests.swift:53 - customLog()> custom warning
 - 💔 ExampleTests.swift:56 - customLog()> custom error

### Logging HTTP Requests and Responses

```swift
let logger = YHLogger()

do {
    var request = URLRequest(url: URL(string: "https://dummyjson.com/user/login")!)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    request.httpBody = try JSONEncoder().encode(["username": "test", "password": "1234"])

    let (data, response) = try await URLSession.shared.data(for: request)
    
    logger.request(request, response: response, data: data)
    
} catch {
    logger.error("Failed to encode request parameters or fetch data from the server: \(error.localizedDescription)")
}
```
##### Console:

```
🛜 ExampleTests.swift:74 - requestLog()> POST https://dummyjson.com/user/login
Request Headers: {
  "Content-Type" : "application\/json"
}
Body: {
  "username" : "emilys",
  "password" : "emilyspass"
}
Status Code: 200
Response Headers: {
    "Set-Cookie" : "accessToken=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVC ...
}
Result: {
  "gender" : "female",
  "firstName" : "Emily",
  "id" : 1,
  ...
}
```

## License

`YHLogger` is available under the MIT license. See the [LICENSE](LICENSE) file for more information.

