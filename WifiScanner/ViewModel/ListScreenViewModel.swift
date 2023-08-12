//
//  ListScreenViewModel.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 11.08.2023.
//

import Foundation

class ListScreenViewModel: ObservableObject {
    
    @Published var networkInfo: NetworkInfoModel = .init(ipAddress: "", ssID: nil, bssID: nil)
    
    func fetchCurrent() {
        WiFiManager().fetchCurrent { [weak self] networkInfo in
            self?.networkInfo = networkInfo
        }
    }
    
    func saveToLocal() {
        IPAddressDataManager.shared.saveToLocal(newNetworkInfo: networkInfo)
    }
}
