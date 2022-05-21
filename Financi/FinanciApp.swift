//
//  FinanciApp.swift
//  Financi
//
//  Created by Stephane Girão Linhares on 12/05/22.
//

import SwiftUI

@main
struct FinanciApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(ControlRenda())
        }
    }
}
