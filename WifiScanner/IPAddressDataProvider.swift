//
//  IPAddressDataProvider.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 4.08.2023.
//

import Foundation


final class IPAddressDataProvider: ObservableObject {
    @Published var savedIPs: [NetworkInfoModel] = []
    @Published var currentIP: NetworkInfoModel = .init(ipAddress: "", ssID: "", bssID: "")
    
    func saveToLocal() {
        saveToUserDefaults()
        
    }
    
    func getLocal() {
        self.savedIPs = readFromUserDefaults()
        print("\(self.savedIPs)")
    }
    
    private func readFromUserDefaults() -> [NetworkInfoModel] {
        if let data = UserDefaults.standard.data(forKey: "IPs") {
            do {
                let decoder = JSONDecoder()
                let ips = try decoder.decode([NetworkInfoModel].self, from: data)
                return ips
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        return []
    }
    
    private func saveToUserDefaults() {
        do {
            let encoder = JSONEncoder()
            var ips = readFromUserDefaults()
            ips.append(currentIP)
            
            let data = try encoder.encode(ips)

            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "IPs")

        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
}
