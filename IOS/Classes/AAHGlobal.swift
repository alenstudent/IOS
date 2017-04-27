//
//  AaronGlobal.swift
//  Pods
//
//  Created by aaron on 16/7/5.
//
//

import UIKit
import Foundation

private let PREFIX = "Frameworks"
private let SUFFIX = "framework"
private let FRAMEWORK_NAME = "AaronFramework"
private let BUNDLE_NAME = "\(FRAMEWORK_NAME).bundle"


private func getResourceName(_ resourceName: String) -> String {
    return "\(PREFIX)/\(FRAMEWORK_NAME).\(SUFFIX)/\(resourceName)"
}

func getXibName(_ xibName: String) -> String {
    return getResourceName(xibName)
}

func getImageName(_ imageName: String) -> String {
    return getResourceName("\(BUNDLE_NAME)/\(imageName)")
}


private let AaronImageBundle = NSBundle(path: NSBundle.mainBundle().pathForResource("\(PREFIX)/\(FRAMEWORK_NAME).\(SUFFIX)/\(BUNDLE_NAME)", ofType: nil)!)

private let AaronXibBundle = NSBundle(path: NSBundle.mainBundle().pathForResource("\(PREFIX)/\(FRAMEWORK_NAME).\(SUFFIX)", ofType: nil)!)


