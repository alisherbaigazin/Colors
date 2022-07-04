//
//  UIColor - ext.swift
//  Colors
//
//  Created by Alisher Baigazin on 05.07.2022.
//

import UIKit

extension UIColor {
    static func random() -> UIColor {
        UIColor(red: CGFloat.random(in: 0...1),
                green: CGFloat.random(in: 0...1),
                blue: CGFloat.random(in: 0...1),
                alpha: 1)
    }
}
