//
//  Extension-Image.swift
//  Pods
//
//  Created by aaron on 16/7/8.
//
//

import Foundation
import UIKit

// MARK: - Funcs
public extension UIImage {
    /**
     逆时钟旋转90度
     */
    public func rotate90CounterClockwise() -> UIImage {
        var image: UIImage!
        switch self.imageOrientation {
        case .Up:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Left)
        case .Down:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Right)
        case .Left:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Down)
        case .Right:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Up)
        case .UpMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .RightMirrored)
        case .DownMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .LeftMirrored)
        case .LeftMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .UpMirrored)
        case .RightMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .DownMirrored)
        }
        return image;
    }
    /**
     逆时钟旋转90度
     */
    public func rotate90Clockwise() -> UIImage {
        var image: UIImage!
        switch self.imageOrientation {
        case .Up:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Right)
        case .Down:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Left)
        case .Left:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Up)
        case .Right:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Down)
        case .UpMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .LeftMirrored)
        case .DownMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .RightMirrored)
        case .LeftMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .DownMirrored)
        case .RightMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .UpMirrored)
        }
        return image;
    }
    /**
     逆时钟旋转90度
     */
    public func rotate180() -> UIImage {
        var image: UIImage!
        switch self.imageOrientation {
        case .Up:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Down)
        case .Down:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Up)
        case .Left:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Right)
        case .Right:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .Left)
        case .UpMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .DownMirrored)
        case .DownMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .UpMirrored)
        case .LeftMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .RightMirrored)
        case .RightMirrored:
            image = UIImage(CGImage:self.CGImage!, scale: 1, orientation: .LeftMirrored)
        }
        return image;
    }
    /**
     旋转做任意角度
     
     - parameter angle: 角度
     
     - returns: 旋转后的图片
     */
    public func rotateAny(_ angle: CGFloat) -> UIImage {
        
        var image: UIImage!
        
        let size = CGSize(width: self.size.width * self.scale, height: self.size.height * self.scale)
        var rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        CGRectApplyAffineTransform(rect, CGAffineTransformMakeRotation(angle))
        let outputSize = CGSize(width: rect.width, height: rect.height)
        UIGraphicsBeginImageContext(outputSize)
        let context = UIGraphicsGetCurrentContext()
        CGContextTranslateCTM(context, outputSize.width / 2, outputSize.height / 2)
        CGContextRotateCTM(context, angle)
        CGContextTranslateCTM(context, -size.width / 2, -size.height / 2)
        self.drawInRect(CGRect(x: 0, y: 0, width: size.width, height: size.height))
        image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    /** 第比例缩放到指定大小 */
    public func scaleToSize(_ targetSize: CGSize) -> UIImage? {
        
        var newImage: UIImage? = nil
        autoreleasepool { () -> () in
            // 真实大小
            let size = self.size
            let width = size.width
            let height = size.height
            // 目标大小
            let targetWidth = targetSize.width
            let targetHeight = targetSize.height
            
            var scaleFactor: CGFloat = 0.0
            // 缩放后的大小
            var scaleWidth = targetWidth
            var scaleHeight = targetHeight
            
            var thumbnailPoint = CGPoint.zero
            
            if !CGSizeEqualToSize(size, targetSize) {
                
                let widthScaleFactor = width / targetWidth
                let heightScaleFactor = height / targetHeight
                
                scaleFactor = widthScaleFactor > heightScaleFactor ? widthScaleFactor : heightScaleFactor
                
                scaleWidth = width / scaleFactor
                scaleHeight = height / scaleFactor
                
                if widthScaleFactor > heightScaleFactor {
                    thumbnailPoint.y = (targetHeight - scaleHeight) * 0.5
                } else {
                    thumbnailPoint.x = (targetWidth - scaleWidth) * 0.5
                }
            }
            
            UIGraphicsBeginImageContext(targetSize)
            var thumbnailRect = CGRect.zero
            thumbnailRect.origin = thumbnailPoint
            thumbnailRect.size.width = scaleWidth
            thumbnailRect.size.height = scaleHeight
            self.drawInRect(thumbnailRect)
            newImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
        }
        return newImage
        
    }
    /**
     图片转为nsData
     
     - parameter quality: 转换质量（0-1）
     
     - returns: NSData
     */
    public func toNSData(_ quality: CGFloat) -> NSData? {
        let data = UIImageJPEGRepresentation(self, quality)
        let dataLength = data?.length ?? 0
        print("数据大小: \(dataLength)")
        if Double(dataLength) > 100 * 1024 {
            return self.toNSData(quality - 0.1)
        } else {
            return data
        }
    }
}
