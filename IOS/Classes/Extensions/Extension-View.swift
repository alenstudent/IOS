//
//  Extends-View.swift
//  flipclass
//
//  Created by aaron on 15/8/14.
//  Copyright (c) 2015年 whaty. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    ///  扩展宽属性
    var width: CGFloat {
        get {
            return self.bounds.width
        }
        set {
            var frame = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
    }
    /// 扩展高属性
    var height: CGFloat {
        get {
            return self.bounds.height
        }
        set {
            var frame = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
    }
    // 扩展x坐标属性
    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            var frame = self.frame
            frame.origin.x = newValue
            self.frame = frame
        }
    }
    // 扩展y坐标属性
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            var frame = self.frame
            frame.origin.y = newValue
            self.frame = frame
        }
    }
    
    var anchorPoint: CGPoint {
        get {
            return self.layer.anchorPoint
        }
        set {
            let obj = self
            let frame = obj.frame
            self.layer.anchorPoint = newValue
            dispatch_async(dispatch_get_main_queue()) { 
                obj.frame = frame
            }
        }
    }
    
    
    /// 圆角
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
            self.setNeedsDisplay()
        }
    }
    /// 边框粗细
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
            self.setNeedsDisplay()
        }
    }
    /// 边框颜色
    @IBInspectable var borderColor: UIColor? {
        get {
            let cgColor = self.layer.borderColor
            if cgColor == nil {
                return nil
            } else {
                return UIColor.init(CGColor: self.layer.borderColor!)
            }
        }
        set {
            self.layer.borderColor = newValue!.CGColor
            self.setNeedsDisplay()
        }
    }
    /// 获取当前view所在的控制器
    var currentViewController: UIViewController! {
        get {
            var target: UIViewController! = nil
            var view: UIView? = self
            var index = 0
            while true {
                index += 1
                if view == nil { break }
                let responder = view!.nextResponder()
                if responder is UIViewController {
                    target = responder as! UIViewController
                    break
                }
                view = view!.superview
            }
            return target
        }
    }
}







