//
//  ListScreenView.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 2.08.2023.
//

import SwiftUI

struct ListScreenView: View {
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Network Information")) {
                    ForEach(exampleConnection, id: \.self.0) { example in
                        VStack(alignment: .leading) {
                            Text("SSID: \(example.0)")
                            Text("BSSID: \(example.1)")
                            Text("IP Address: \(example.2)")
                        }
                    }
                }
            }
            
            
            .navigationTitle("Wi-Fi Connection")
        }
    }
    
    var exampleConnection: [(String, String, String)] = [
        ("Example SSID 1", "00:11:22:33:44:55", "192.168.1.100")
    ]
}

struct ListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ListScreenView()
    }
}


