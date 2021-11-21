//
//  Date.swift
//  Marvel
//
//  Created by c-villain on 21.11.2021.
//

import Foundation

extension Date {
    static var currentTimeStamp: String {
        return String(Date().timeIntervalSince1970 * 1000)
    }
}
