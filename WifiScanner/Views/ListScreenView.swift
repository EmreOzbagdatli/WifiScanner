//
//  ListScreenView.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 2.08.2023.
//

import SwiftUI

struct ListScreenView: View {
    @StateObject var viewModel = ListScreenViewModel()
    
    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text("Device IP Address")
                    .font(.title)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                    .shadow(radius: 20)
                
                Text(" : \(viewModel.networkInfo.ipAddress)")
                    .font(.title2)
                    .padding()
                
                
                Text("Current SSID")
                    .font(.title)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                    .shadow(radius: 20)
                
                
                Text(": \(viewModel.networkInfo.ssID ?? "Not Found".localized())")
                    .font(.title2)
                    .padding()
                
                
                Text("Current BSSID")
                    .font(.title)
                    .padding()
                    .background(Color.gray)
                    .cornerRadius(10)
                    .shadow(radius: 20)
                
                Text(" : \(viewModel.networkInfo.bssID ?? "Not Found".localized())")
                    .font(.title2)
                    .padding()
                
                Button("Save to Local") {
                    viewModel.saveToLocal()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.top, 40)
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: SavedScreenView()) {
                        Image(systemName: "book")
                    }
                }
                
                
            }.onAppear() {
                viewModel.fetchCurrent()
            }
       
    }
}
 


struct ListScreenView_Provider : PreviewProvider {
    static var previews: some View{
        ListScreenView()
    }
}
