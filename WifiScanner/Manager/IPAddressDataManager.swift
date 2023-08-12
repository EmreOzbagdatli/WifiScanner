//
//  IPAddressDataProvider.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 4.08.2023.
//

import Foundation


final class IPAddressDataManager {

    static let shared = IPAddressDataManager()

    func saveToLocal(newNetworkInfo: NetworkInfoModel) {
        saveToUserDefaults(newNetworkInfo: newNetworkInfo)

    }

    func getLocal() -> [NetworkInfoModel] {
        return readFromUserDefaults()
    }

    func deleteAllNetworkInfo() {
        self.deleteAllLocal()
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

    private func saveToUserDefaults(newNetworkInfo: NetworkInfoModel) {
        do {
            let encoder = JSONEncoder()
            var ips = readFromUserDefaults()
            ips.append(newNetworkInfo)

            let data = try encoder.encode(ips)

            UserDefaults.standard.set(data, forKey: "IPs")
        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }

    private func deleteAllLocal() {

        var array = readFromUserDefaults()
        array.removeAll()
        UserDefaults.standard.set(array, forKey: "IPs")

    }
}


