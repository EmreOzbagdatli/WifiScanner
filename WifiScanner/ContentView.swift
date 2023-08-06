//
//  ContentView.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 1.08.2023.
//

import SwiftUI
import FGRoute
import CoreLocation


class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
    }

    func requestLocationPermission() {
        DispatchQueue.global().async { [weak self] in
            if CLLocationManager.locationServicesEnabled() {
                self?.locationManager.requestWhenInUseAuthorization()
            }
        }
        
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    }
}

struct LocationPermissionView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            
            Image(systemName: "network.badge.shield.half.filled")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150,height: 150)
                .padding(.bottom,20)
            
            
            Text("Scan your Wi-Fi informations.")
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
            
            
        }
    }
}
