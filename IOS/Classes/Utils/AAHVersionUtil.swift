//
//  AAHVersionUtil.swift
//  Pods
//
//  Created by aaron on 16/7/8.
//
//

public class AAHVersionUtil: NSObject {
    /**
     获取当前短版本号
     
     - returns: 短版本号
     */
    public class func getCurrentShortVersion() -> String {
        let bundleDic = NSBundle.mainBundle().infoDictionary
        let shortVersion = bundleDic?["CFBundleShortVersionString"] as? String
        return shortVersion ?? ""
    }
    
    /**
     获取当前版本号
     
     - returns: 当前版本号
     */
    public class func getCurrentVersion() -> String {
        let bundleDic = NSBundle.mainBundle().infoDictionary!
        let version = bundleDic["CFBundleVersion"] as! String
        return version
    }

}
