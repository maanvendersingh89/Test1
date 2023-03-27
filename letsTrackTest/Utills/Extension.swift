//
//  Extension.swift
//  LetsTrackTest
//
//  Created by Apple on 25/03/23.
//

import Foundation
import UIKit

extension UIColor {
    public convenience init(hex: String) {
           let hexString: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
           let scanner = Scanner(string: hex)
           if (hexString.hasPrefix("#")) {
               scanner.scanLocation = 1
           }
           var color: UInt32 = 0
        
           scanner.scanHexInt32(&color)
           let mask = 0x000000FF
           let r = Int(color >> 16) & mask
           let g = Int(color >> 8) & mask
           let b = Int(color) & mask
           let red   = CGFloat(r) / 255.0
           let green = CGFloat(g) / 255.0
           let blue  = CGFloat(b) / 255.0
           self.init(red:red, green:green, blue:blue, alpha:1)
       }
}


