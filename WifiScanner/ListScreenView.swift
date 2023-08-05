//
//  ListScreenView.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 2.08.2023.
//

import SwiftUI
import FGRoute

struct ListScreenView: View {
    
    @EnvironmentObject var ipProvider: IPAddressDataProvider
    
    @State private var ipAddress: String = ""
    
    var body: some View {
        VStack {
            Text("\(ipProvider.currentIP.ipAddress)")
            Text("\(ipProvider.currentIP.ssID ?? "No value")")
            Text("\(ipProvider.currentIP.bssID ?? "No value")")
            
            Button {
                ipProvider.saveToLocal()
            } label: {
                Text("Save to local")
            }.padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(20)
            

        }.onAppear {
            ipAddress = FGRoute.getIPAddress()
        }
        .onChange(of: ipAddress, perform: { newValue in
            let model = NetworkInfoModel(ipAddress: newValue, ssID: FGRoute.getSSID(), bssID: FGRoute.getBSSID())
            self.ipProvider.currentIP = model
        })
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink(destination: SavedScreenView()) {
                    Image(systemName: "book")
                }
            }
        }

    }

}
