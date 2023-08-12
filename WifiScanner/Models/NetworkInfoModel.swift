//
//  NetworkInfoModel.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 4.08.2023.
//

import Foundation


struct NetworkInfoModel: Codable {
   
    let ipAddress: String
    let ssID: String?
    let bssID: String?
}
