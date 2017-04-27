//
//  UINavigationBarExtensio.swift
//  Student
//
//  Created by aaron on 17/1/22.
//  Copyright © 2017年 aaron. All rights reserved.
//

import UIKit


private var UINavigationBarOverLayKey = "UINavigationBarOverLayKey"

public extension UINavigationBar {
    
    private func setOverLay(_ overLay: UIView?) {
        objc_setAssociatedObject(self, &UINavigationBarOverLayKey, overLay, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
    }
    private func getOverLay() -> UIView? {
        return objc_getAssociatedObject(self, &UINavigationBarOverLayKey) as? UIView
    }
    
    /**
     设置背景颜色
     
     - parameter color: 颜色
     */
    public func setBackgroundColorExt(_ color: UIColor) {
        
        if self.getOverLay() == nil {
            self.setBackgroundImage(UIImage(), forBarMetrics: .Default)
            let overLayViewFrame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height + 20)
            let overLayView = UIView(frame: overLayViewFrame)
            overLayView.userInteractionEnabled = false
            overLayView.autoresizingMask = .FlexibleWidth
            self.setOverLay(overLayView)
            self.subviews.first?.insertSubview(overLayView, atIndex: 0)
        }
        self.getOverLay()?.backgroundColor = color
    }
    /**
     设置透明度
     
     - parameter alpha: 透明度（ 0-1 ）
     */
    public func setAlphaExt(_ alpha: CGFloat) {
        var alpha = alpha
        if alpha > 1 {
            alpha = 1
        }
        if alpha < 0 {
            alpha = 0
        }
        if let views = self.valueForKey("_leftViews") as? [UIView] {
            for view in views {
                view.alpha = alpha
            }
        }
        if let views = self.valueForKey("_rightViews") as? [UIView] {
            for view in views {
                view.alpha = alpha
            }
        }
        if let titleView = self.valueForKey("_titleView") as? UIView {
            titleView.alpha = alpha
        }
        //    when viewController first load, the titleView maybe nil
        for view in self.subviews {
            if let clazz = NSClassFromString("UINavigationItemView") where view.isKindOfClass(clazz) {
                view.alpha = alpha
            }
            if let clazz = NSClassFromString("_UINavigationBarBackIndicatorView") where view.isKindOfClass(clazz) {
                view.alpha = alpha
            }
        }
    }
    /**
     设置Y值
     
     - parameter y: y值
     */
    public func setPositionY(_ y: CGFloat) {
        self.transform = CGAffineTransformMakeTranslation(0, y)
    }
    /**
     重置
     */
    public func reset() {
        self.setBackgroundImage(nil, forBarMetrics: .Default)
        self.getOverLay()?.removeFromSuperview()
        self.setOverLay(nil)
    }
}





















