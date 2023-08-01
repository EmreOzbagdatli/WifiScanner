//
//  ContentView.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 1.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {

        VStack{
            Text("Click the button to start scanning Wi-Fİ networks")
                .font(.title)
                .padding()
            
            NavigationLink(destination: ListScreenView()){
                Text("Start Scanning")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 200,height: 50)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .navigationBarHidden(true)
        
        
        
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
