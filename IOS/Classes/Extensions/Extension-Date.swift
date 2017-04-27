//
//  Extension-Date.swift
//  Pods
//
//  Created by aaron on 16/9/23.
//
//

import UIKit

public extension NSDate {

    public func toString(_ dateFormat: String) -> String {
        let dateformatter = NSDateFormatter()
        dateformatter.dateFormat = dateFormat
        return dateformatter.stringFromDate(self)
    }
}
