//
//  ContentView.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 1.08.2023.
//

//
//  ContentView.swift
//  bitti
//
//  Created by Doğancan Mavideniz on 4.08.2023.
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
        // Handle authorization status changes here
    }
}

struct LocationPermissionView: View {
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            Text("Scan IP, BSSID and SSID ")
                .font(.title)
                .padding()
            
            NavigationLink {
                ListScreenView()
            } label: {
                Text("Click for scan")
            }
            
            
        }
    }
}
