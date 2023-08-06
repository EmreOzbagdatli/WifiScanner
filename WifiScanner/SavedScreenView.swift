//
//  SavedScreenView.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 2.08.2023.
//
import SwiftUI


struct SavedScreenView: View {
    
    @EnvironmentObject var ipProvider: IPAddressDataProvider
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<ipProvider.savedIPs.count, id:\.self) { index in
                    VStack {
                        Text("\(ipProvider.savedIPs[index].ipAddress)")
                        Text("\(ipProvider.savedIPs[index].ssID ?? "No value")")
                        Text("\(ipProvider.savedIPs[index].bssID ?? "No value")")
                        Divider()
                    }
                    
                }
            }.font(.title2)
        }
        .navigationTitle("Saved Informations")
        
        
        .onAppear {
            ipProvider.getLocal()
        }
        
    }
}
