//
//  ContentView.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 1.08.2023.
//

import SwiftUI
import NetworkExtension
import CoreLocation


struct ContentView: View {
    
    @State private var locationManager = CLLocationManager()
    @StateObject var viewModel = ContentViewModel()
    
    
    
    var body: some View {
        VStack {
            Image(systemName: "network.badge.shield.half.filled")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding(.bottom, 20)
            
            
            Text("Scan your Wi-Fi")
                .font(.title)
            
            Text("(IP Adress, SSID , BSSID)")
                .font(.title)
                .padding()
            
            NavigationLink {
                ListScreenView()
            } label: {
                Text("Click for scan")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(20)
                
            }
            
        }.onAppear {
            locationManager.requestWhenInUseAuthorization()
            
        }
        
    }
    
}
struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
