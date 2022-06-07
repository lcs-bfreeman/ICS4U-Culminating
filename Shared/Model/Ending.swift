//
//  Ending.swift
//  ICS4U-Culminating
//
//  Created by Brad Kang on 2022-05-30.
//

import Foundation

struct Ending {
    let classification: EndingClassification
    let description: String
    var color: String {
        switch self.classification {
        case .best:
            return "#90C8E0"  // Light blue
        case .good:
            return "#FFDE5F"  // Pale yellow
        case .ok:
            return "#D7883C"  // Orange
        case .death:
            return "#AB1800"  // Deep red
        }
    }
}
