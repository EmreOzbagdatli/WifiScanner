//
//  Extension.swift
//  WifiScanner
//
//  Created by Emre Özbağdatlı on 14.08.2023.
//

import Foundation

extension String {
    func localized(with comment : String = "") -> String {
        return NSLocalizedString(self, tableName: nil,bundle: Bundle.main , value: "", comment: comment)
    }
}
