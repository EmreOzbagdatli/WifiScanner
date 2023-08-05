//
//  WifiScannerApp.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 1.08.2023.
//

import SwiftUI

@main
struct WifiScannerApp: App {
    
    @StateObject var ipProvider: IPAddressDataProvider = IPAddressDataProvider()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                LocationPermissionView()
            }.environmentObject(ipProvider)
            
        }
    }
}
