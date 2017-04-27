//
//  Extension-String.swift
//  Pods
//
//  Created by aaron on 16/7/5.
//
//

import Foundation
import UIKit


// MARK: - subscripts
public extension String {
    /**
     截串
     
     - parameter startIndex: 起始位置
     - parameter endIndex:   结束位置
     
     - returns: 新的截串
     */
    public subscript(startIndex: Int, endIndex: Int) -> String {
        var startIndex = startIndex
        var endIndex = endIndex
        if startIndex < 0 { startIndex = 0 }
        if endIndex > self.characters.count { endIndex = self.characters.count }
        
        let start = self.startIndex.advancedBy(startIndex)
        let end = start.advancedBy(endIndex - startIndex)
        return self.substringWithRange(start ..< end)
    }
    
    /**
     获取单个字符
     
     - parameter index: 位置
     
     - returns: 位置对应上的字符
     */
    public subscript(index: Int) -> Character {
        var index = index
        if index >= self.characters.count { index = self.characters.count - 1 }
        if index < 0 { index = 0 }
        return self.characters[self.characters.startIndex.advancedBy(index)]
    }
}

// MARK: - Vars
public extension String {
    /// 获取颜色值 #fff, fff, #f0f0f0, f0f0f0
    var color: UIColor {
        get {
            var cacheString = self
            if cacheString.hasPrefix("#") {
                cacheString = cacheString.substringFromIndex(cacheString.startIndex.advancedBy(1))
            }
            if cacheString.characters.count == 3 {
                
                let startIndex = cacheString.startIndex.advancedBy(1)
                let redString = cacheString.substringToIndex(startIndex)
                let endIndex = startIndex.advancedBy(1)
                let greenString = cacheString.substringWithRange(startIndex ..< endIndex)
                let blueString = cacheString.substringFromIndex(endIndex)
                var red: UInt32 = 0
                var green: UInt32 = 0
                var blue: UInt32 = 0
                NSScanner(string: "\(redString)\(redString)").scanHexInt(&red)
                NSScanner(string: "\(greenString)\(greenString)").scanHexInt(&green)
                NSScanner(string: "\(blueString)\(blueString)").scanHexInt(&blue)
                
                return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
                
            } else if cacheString.characters.count == 6 {
                let startIndex = cacheString.startIndex.advancedBy(2)
                let redString = cacheString.substringToIndex(startIndex)
                let endIndex = startIndex.advancedBy(2)
                let greenString = cacheString.substringWithRange(startIndex ..< endIndex)
                let blueString = cacheString.substringFromIndex(endIndex)
                var red: UInt32 = 0
                var green: UInt32 = 0
                var blue: UInt32 = 0
                
                NSScanner(string: "\(redString)").scanHexInt(&red)
                NSScanner(string: "\(greenString)").scanHexInt(&green)
                NSScanner(string: "\(blueString)").scanHexInt(&blue)
                return UIColor(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: 1)
            }
            return UIColor.blackColor()
        }
    }
    /// 判断字符串中是否包含有emoji表情
    var isContainEmoji: Bool {
        get {
            for character in self.unicodeScalars {
                let value = character.value
                if value > 0xE001 && value > 0xE05A || value > 0xE05A && value < 0xE15A || value > 0xE201 && value < 0xE253 || value > 0xE401 && value < 0xE44C || value > 0xE501 && value < 0xE537 {
                    return true
                }
            }
            return false
        }
    }
    /// MD5加密
    var md5: String {
        get {
            return NSString(string: self).md5()
        }
    }
    /// SHA1加密
    var sha1: String {
        get {
            return NSString(string: self).sha1()
        }
    }
    /// SHA256加密
    var sha256: String {
        get {
            return NSString(string: self).sha256()
        }
    }
    /// 字符串转成图片
    var image: UIImage? {
        get {
            return UIImage(named: self)
        }
    }
    /// url转码
    var urlEncode: String {
        return self.stringByAddingPercentEscapesUsingEncoding(NSUTF8StringEncoding) ?? ""
    }
    /// 解url码
    var urlDeCode: String {
        return self.stringByRemovingPercentEncoding ?? ""
    }
    /// 是否为空
    var isBlank: Bool {
        return self.trim() == ""
    }
    /// 是否不为空
    var isNotBlank: Bool {
        return !self.isBlank
    }
}

// MARK: - Funcs
public extension String {
    /**
     获取字符的CGSize
     
     - parameter containerSize: 父容器的大小
     - parameter font:          字符串字体
     
     - returns: 字符串CGSize
     */
    public func getSize(_ containerSize: CGSize, font: UIFont) -> CGSize {
        let string = NSString(string: self)
        let option = NSStringDrawingOptions.UsesLineFragmentOrigin
        let attribute = [NSFontAttributeName: font]
        let size = string.boundingRectWithSize(containerSize, options: option, attributes: attribute, context: nil).size
        return size
    }
    /**
     去掉前后空格
     
     - returns: String
     */
    public func trim() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    /**
     转成日期
     
     - parameter dateFormatter: 日期格式
     
     - returns: NSDate?
     */
    public func toDate(dateFormat: String) -> NSDate? {
        let formatter = NSDateFormatter()
        formatter.dateFormat = dateFormat
        return formatter.dateFromString(self)
    }
}




