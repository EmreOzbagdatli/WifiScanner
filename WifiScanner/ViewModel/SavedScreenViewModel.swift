//
//  SavedScreenViewModel.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 11.08.2023.
//

import Foundation


class SavedScreenViewModel: ObservableObject {
    
    @Published var networkInfoModels : [NetworkInfoModel] = []
    
    
    func fetchOldInfos (){
        self.networkInfoModels = IPAddressDataManager.shared.getLocal()
    }
    
    func deleteAll() {
        IPAddressDataManager.shared.deleteAllNetworkInfo()
        self.networkInfoModels = []
    }
    
    
    
}
