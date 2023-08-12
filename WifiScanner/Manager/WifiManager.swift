//
//  WifiManager.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 11.08.2023.
//

import Foundation
import NetworkExtension

class WiFiManager {

    func getIPAddress() -> String? {
        var address: String?

        var ifaddr: UnsafeMutablePointer<ifaddrs>?
        if getifaddrs(&ifaddr) == 0 {
            var ptr = ifaddr
            while ptr != nil {
                defer { ptr = ptr?.pointee.ifa_next }

                guard let interface = ptr?.pointee else {
                    return nil
                }

                let addrFamily = interface.ifa_addr.pointee.sa_family
                if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                    guard let ifa_name = interface.ifa_name else {
                        return nil
                    }
                    let name: String = String(cString: ifa_name)

                    if name == "en0" {
                        var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                        getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len), &hostname, socklen_t(hostname.count), nil, socklen_t(0), NI_NUMERICHOST)
                        address = String(cString: hostname)
                    }
                }
            }
            freeifaddrs(ifaddr)
        }
        return address
    }

    func fetchCurrent(completionHandler: @escaping (NetworkInfoModel) -> Void) {

        let ip = getIPAddress()!

        NEHotspotNetwork.fetchCurrent { hotspotNetwork in

            guard let network = hotspotNetwork else {
                let wifiInfo = NetworkInfoModel(ipAddress: ip, ssID: nil, bssID: nil)
                completionHandler(wifiInfo)
                return
            }
            let wifiInfo = NetworkInfoModel(ipAddress: ip, ssID: network.ssid, bssID: network.bssid)
            completionHandler(wifiInfo)
        }
    }
}

