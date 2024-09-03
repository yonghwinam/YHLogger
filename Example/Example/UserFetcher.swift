//
//  UserFetcher.swift
//  Example
//
//  Created by Yonghwi on 8/30/24.
//

import Foundation
import SwiftUI



class UserFetcher: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var firstName = ""
    @Published var lastName = ""
    @Published var gender = ""
    @Published var image = ""
    
    func signIn(username: String, password: String) async -> RequestResult {
        
        guard let url = URL(string: "https://dummyjson.com/user/login") else { return RequestResult() }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONEncoder().encode(SignInParam(username: username, password: password))
            let (data, response) = try await URLSession.shared.data(for: request)
            
            return RequestResult(request: request, response: response, data: data)
        } catch {
            return RequestResult()
        }
    }
}
