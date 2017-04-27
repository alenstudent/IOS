//
//  Extension-UIColor.swift
//  Pods
//
//  Created by aaron on 16/9/23.
//
//

import UIKit

// MARK: - Funcs
public extension UIColor {
    /**
     根据大小画出纯颜色图片
     
     - parameter size: 图片大小
     
     - returns: UIImage
     */
    public func imageWithSize(_ size: CGSize) -> UIImage? {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        CGContextSetFillColorWithColor(context, self.CGColor)
        CGContextFillRect(context, rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img
    }
}
