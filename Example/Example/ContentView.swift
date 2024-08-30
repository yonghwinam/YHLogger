//
//  ContentView.swift
//  Example
//
//  Created by Yonghwi on 8/30/24.
//

import SwiftUI
import YHLogger

//let logger = YHLogger(debugIcon: "🤣",
//                      infoIcon: "!!!!",
//                      warningIcon: "😱",
//                      errorIcon: "🤫")

let logger = YHLogger()

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            logger.debug("debug")
            logger.info("info")
            logger.warning("warning")
            logger.error("error")
        }
    }
}

#Preview {
    ContentView()
}
